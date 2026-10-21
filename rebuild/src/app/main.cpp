// Outpost rebuild: the game window (Milestone 5). Reads the player's
// original files; the screens follow the original's resources (menus,
// dialog templates, bitmaps, sprite sheets).
//
//   outpost-rebuild [game folder] [save.OPS]
//
// Without a save the game starts at its Program Control menu. Scripted
// screenshots for checking the screens:
//
//   --shot file.bmp [turns]   render one frame to a BMP and exit
//   --turns n                 run n turns before the shot
//   --seed n                  seed rand() with n instead of the clock
//   --land                    put the Seed down on the first cell that takes it
//   --near type dx dy         put a building at an offset from colony 1's hub (after --turns)
//   --turns2 n                run n more turns after --near
//   --press id                press a control of the start screens (repeatable)
//   --place type x y          put a building down (colony screen)
//   --building x y            open the window of the building at (x, y)
//   --tile x y cmd            a TILEMENU command on the building at (x, y)
//   --dialog id               open a dialog template
//   --report cmd              a Reports menu command (9001..)
//   --level n                 show level n
//   --dpress id               press a button of the open dialog (repeatable)
//   --save file.OPS           save the game after the turns (before the shot)
//   --movies                  play movies and story pages (scripted runs skip them)
//   --terrain-packs           draw the surface with the terrain packs (I93)
//   --trace                   print each turn's colony figures and log codes
//   --wait ms                 let a movie or story page run ms before the shot

#include "app/game.hpp"
#include "app/gfx.hpp"
#include "app/start.hpp"
#include "data/game_files.hpp"
#include "data/ops_save.hpp"
#include "data/pictures.hpp"
#include "sim/ops_loader.hpp"
#include "sim/simulation.hpp"

#include <SDL.h>
#include <SDL_image.h>

#include <array>
#include <cctype>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <filesystem>
#include <fstream>
#include <iterator>
#include <memory>
#include <optional>
#include <string>
#include <vector>

using namespace outpost;
using namespace outpost::app;

namespace {

#ifndef OUTPOST_DEFAULT_DATA_DIR
#define OUTPOST_DEFAULT_DATA_DIR "Outpost"
#endif
#ifndef OUTPOST_FONT_FILE
#define OUTPOST_FONT_FILE "DejaVuSans.ttf"
#endif

// The font sits next to the executable.
std::filesystem::path fontPath() {
    std::filesystem::path p = OUTPOST_FONT_FILE;
    if (char* base = SDL_GetBasePath()) {
        p = std::filesystem::path(base) / OUTPOST_FONT_FILE;
        SDL_free(base);
    }
    return p;
}

int fail(const std::string& msg) {
    std::fprintf(stderr, "outpost-rebuild: %s\n", msg.c_str());
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "Outpost rebuild", msg.c_str(), nullptr);
    return 1;
}

bool saveShot(SDL_Renderer* ren, const std::string& file) {
    int w, h;
    SDL_GetRendererOutputSize(ren, &w, &h);
    SDL_Surface* s = SDL_CreateRGBSurfaceWithFormat(0, w, h, 32, SDL_PIXELFORMAT_ARGB8888);
    const bool png = file.size() > 4 && (file.ends_with(".png") || file.ends_with(".PNG"));
    bool ok = s && SDL_RenderReadPixels(ren, nullptr, SDL_PIXELFORMAT_ARGB8888, s->pixels, s->pitch) == 0 &&
              (png ? IMG_SavePNG(s, file.c_str()) : SDL_SaveBMP(s, file.c_str())) == 0;
    if (s) SDL_FreeSurface(s);
    return ok;
}

} // namespace

int main(int argc, char** argv) {
    std::string shot;
    int shotTurns = 0, shotLevel = -1;
    std::vector<int> presses, reports, dpresses;
    std::vector<std::string> shotDialogs;
    std::string saveTo;
    bool movies = false, trace = false, terrainPacks = false;
    int waitMs = 0;
    std::vector<std::array<int, 3>> shotPlace, shotTile;
    std::vector<std::array<int, 2>> shotBuilding;
    std::vector<std::string> args;
    uint32_t seed = 0;
    bool land = false;
    int shotTurns2 = 0;
    std::vector<std::array<int, 3>> shotNear;
    for (int i = 1; i < argc; ++i) {
        const std::string a = argv[i];
        if (a == "--shot" && i + 1 < argc) {
            shot = argv[++i];
            if (i + 1 < argc && std::isdigit(static_cast<unsigned char>(argv[i + 1][0]))) shotTurns = std::atoi(argv[++i]);
        } else if (a == "--seed" && i + 1 < argc) {
            seed = static_cast<uint32_t>(std::atoll(argv[++i]));
        } else if (a == "--near" && i + 3 < argc) {
            shotNear.push_back({std::atoi(argv[i + 1]), std::atoi(argv[i + 2]), std::atoi(argv[i + 3])});
            i += 3;
        } else if (a == "--turns2" && i + 1 < argc) {
            shotTurns2 = std::atoi(argv[++i]);
        } else if (a == "--land") {
            land = true;
        } else if (a == "--turns" && i + 1 < argc) {
            shotTurns = std::atoi(argv[++i]);
        } else if (a == "--press" && i + 1 < argc) {
            presses.push_back(std::atoi(argv[++i]));
        } else if (a == "--dialog" && i + 1 < argc) {
            shotDialogs.push_back(argv[++i]);
        } else if (a == "--report" && i + 1 < argc) {
            reports.push_back(std::atoi(argv[++i]));
        } else if (a == "--place" && i + 3 < argc) {
            shotPlace.push_back({std::atoi(argv[i + 1]), std::atoi(argv[i + 2]), std::atoi(argv[i + 3])});
            i += 3;
        } else if (a == "--tile" && i + 3 < argc) {
            shotTile.push_back({std::atoi(argv[i + 1]), std::atoi(argv[i + 2]), std::atoi(argv[i + 3])});
            i += 3;
        } else if (a == "--building" && i + 2 < argc) {
            shotBuilding.push_back({std::atoi(argv[i + 1]), std::atoi(argv[i + 2])});
            i += 2;
        } else if (a == "--trace") {
            trace = true;
        } else if (a == "--movies") {
            movies = true;
        } else if (a == "--terrain-packs") {
            terrainPacks = true;
        } else if (a == "--wait" && i + 1 < argc) {
            waitMs = std::atoi(argv[++i]);
        } else if (a == "--save" && i + 1 < argc) {
            saveTo = argv[++i];
        } else if (a == "--dpress" && i + 1 < argc) {
            dpresses.push_back(std::atoi(argv[++i]));
        } else if (a == "--level" && i + 1 < argc) {
            shotLevel = std::atoi(argv[++i]);
        } else {
            args.push_back(a);
        }
    }
    const std::filesystem::path dir = args.size() > 0 ? args[0] : OUTPOST_DEFAULT_DATA_DIR;
    const std::string saveName = args.size() > 1 ? args[1] : "";

    data::GameFiles files;
    if (!files.open(dir)) return fail("no Outpost game files in " + dir.string() + ": " + files.error());
    std::string err;
    sim::GameData data;
    if (!data.load(files, &err)) return fail("cannot read the game data: " + err);
    data::BuildingPictures pics;
    if (!pics.load(data.exe)) return fail("building picture tables not found in OUTPOST.EXE");
    const auto cd = files.cdAssets();
    if (!cd) return fail("the CD's BITMAPS folder was not found");

    // A save named on the command line skips the start screens.
    std::optional<StartResult> loaded;
    if (!saveName.empty()) {
        data::OpsSave save;
        std::optional<std::vector<uint8_t>> bytes = files.read(saveName);
        if (!bytes) {
            std::ifstream f(saveName, std::ios::binary);
            if (f) bytes = std::vector<uint8_t>(std::istreambuf_iterator<char>(f), {});
        }
        if (!bytes || !save.parse(*bytes)) return fail("cannot read the saved game " + saveName);
        auto sim = std::make_unique<sim::Simulation>(data, static_cast<uint32_t>(std::time(nullptr)));
        if (!sim::loadOps(*sim, save, nullptr, &err)) return fail("cannot load " + saveName + ": " + err);
        loaded = StartResult{};
        loaded->sim = std::move(sim);
        loaded->loadedFrom = saveName;
    }

    if (SDL_Init(SDL_INIT_VIDEO) != 0) return fail(SDL_GetError());
    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "1");
    // IMPROVED (I120): the game opens full screen (F11 / Alt+Enter for a
    // window); scripted screenshots keep a 1280x800 window.
    SDL_Window* win = SDL_CreateWindow("Outpost: New Hope", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 1280, 800,
                                       SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI |
                                           (shot.empty() ? SDL_WINDOW_FULLSCREEN_DESKTOP : 0));
    SDL_Renderer* ren = win ? SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)
                            : nullptr;
    if (!ren) return fail(SDL_GetError());
    int code = 0;
    {
        Gfx gfx(ren, *cd, fontPath());
        const std::filesystem::path saveDir = std::filesystem::current_path();
        Preferences prefs;
        if (shot.empty()) prefs.load(saveDir);          // scripted runs keep the defaults
        prefs.seed = seed;
        prefs.scripted = !shot.empty();
        if (!shot.empty()) prefs.animatedSequences = movies;
        if (terrainPacks) prefs.terrainPacks = true;
        Media media(ren, gfx, data.exe, pics, data.strings, *cd, prefs);
        media.audio.loadSoundtrack(gfx.assets() / "music");   // I95
        media.audio.loadClick(gfx.assets() / "ophd" / "sfx" / "click.ogg");   // I119
        setUiClick([&media] { media.audio.playClick(); });
        std::unique_ptr<StartFlow> start;
        std::unique_ptr<Game> game;
        auto startGame = [&](StartResult r) {
            game = std::make_unique<Game>(win, ren, data, std::move(r), pics, gfx, saveDir, prefs, media);
            if (!game->hasSite()) {
                code = fail("the saved game has no site with a map");
                game.reset();
                return false;
            }
            return true;
        };
        if (loaded) {
            if (!startGame(std::move(*loaded))) return code;
        } else {
            start = std::make_unique<StartFlow>(ren, gfx, data, pics, files, saveDir, prefs, media);
        }

        if (!shot.empty()) {
            for (int id : presses) {
                if (!start || start->done()) break;
                start->press(id);
            }
            if (start && start->done()) {
                StartResult r = start->take();
                start.reset();
                if (r.quit || !startGame(std::move(r))) return code;
            }
            if (game) {
                game->setTrace(trace);
                if (land) game->autoLand();
                if (shotLevel >= 0) game->setLevel(int16_t(shotLevel));      // --place works on the level shown
                for (const auto& p : shotPlace) game->placeAt(uint16_t(p[0]), int16_t(p[1]), int16_t(p[2]));
                if (shotTurns > 0) game->runTurns(shotTurns);
                for (const auto& p : shotNear) game->placeNear(uint16_t(p[0]), int16_t(p[1]), int16_t(p[2]));
                if (shotTurns2 > 0) game->runTurns(shotTurns2);
                if (!saveTo.empty()) game->save(saveTo);
                if (shotLevel >= 0) game->setLevel(int16_t(shotLevel));
                for (const auto& d : shotDialogs) game->openDialog(static_cast<uint16_t>(std::atoi(d.c_str())));
                for (int r : reports) game->openReport(r);
                for (const auto& t : shotTile) game->tileAt(int16_t(t[0]), int16_t(t[1]), t[2]);
                for (const auto& b : shotBuilding) game->openBuilding(int16_t(b[0]), int16_t(b[1]));
                for (int id : dpresses) game->pressDialog(id);
                if (waitMs > 0) media.sequence.tick(SDL_GetTicks() + uint32_t(waitMs));
                game->frame(false);
                media.audio.update();
                std::printf("colony music %s\n", media.audio.nowPlaying().empty() ? "off" : media.audio.nowPlaying().c_str());
            } else if (start) {
                start->tick(SDL_GetTicks() + uint32_t(waitMs));
                media.audio.update();
                start->draw();
                std::printf("stage %s mode %d music %s\n", start->stageName().c_str(), media.sequence.mode(),
                            !media.audio.nowPlaying().empty() ? media.audio.nowPlaying().c_str()
                            : media.audio.midiPlaying()        ? "playing"
                                                               : "off");
            }
            if (!saveShot(ren, shot)) code = fail("could not write " + shot);
        } else {
            bool running = true;
            while (running) {
                SDL_Event e;
                while (SDL_PollEvent(&e)) {
                    // IMPROVED (I50): F11 or Alt+Enter switches full screen.
                    if (e.type == SDL_KEYDOWN &&
                        (e.key.keysym.sym == SDLK_F11 ||
                         ((e.key.keysym.mod & KMOD_ALT) && e.key.keysym.sym == SDLK_RETURN))) {
                        const bool full = (SDL_GetWindowFlags(win) & SDL_WINDOW_FULLSCREEN_DESKTOP) != 0;
                        SDL_SetWindowFullscreen(win, full ? 0 : SDL_WINDOW_FULLSCREEN_DESKTOP);
                        continue;
                    }
                    if (game) {
                        const Game::Next n = game->event(e);
                        if (n == Game::Next::Quit) running = false;
                        if (n == Game::Next::Menu) {
                            game.reset();
                            start = std::make_unique<StartFlow>(ren, gfx, data, pics, files, saveDir, prefs, media);
                            break;
                        }
                    } else if (start) {
                        start->event(e);
                        if (start->done()) {
                            StartResult r = start->take();
                            start.reset();
                            if (r.quit || !startGame(std::move(r))) {
                                running = false;
                                break;
                            }
                        }
                    }
                }
                if (!running) break;
                media.audio.update();
                if (game && game->over()) {
                    game.reset();
                    start = std::make_unique<StartFlow>(ren, gfx, data, pics, files, saveDir, prefs, media);
                }
                if (game) {
                    game->scrollKeys();
                    game->frame();
                } else if (start) {
                    start->tick(SDL_GetTicks());
                    start->draw();
                    SDL_RenderPresent(ren);
                }
            }
        }
    }
    SDL_DestroyRenderer(ren);
    SDL_DestroyWindow(win);
    TTF_Quit();
    SDL_Quit();
    return code;
}
