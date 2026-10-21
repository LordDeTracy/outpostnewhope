// Data-layer tests against the original Outpost 1.51 files.
// OUTPOST_TEST_DATA_DIR points at the CD folder (RESOURCE.000 + BITMAPS/...).

#include <catch2/catch_test_macros.hpp>
#include <catch2/matchers/catch_matchers_floating_point.hpp>

#include "data/building_data.hpp"
#include "data/building_names.hpp"
#include "data/menu_resource.hpp"
#include "data/pictures.hpp"
#include "data/dcl_archive.hpp"
#include "data/game_files.hpp"
#include "data/ne_image.hpp"
#include "data/ops_save.hpp"
#include "data/research_tree.hpp"
#include "data/star_table.hpp"
#include "data/string_table.hpp"

#include <filesystem>
#include <fstream>
#include <iterator>

using namespace outpost::data;

namespace {

const GameFiles& files() {
    static GameFiles f;
    static bool ok = f.open(OUTPOST_TEST_DATA_DIR);
    REQUIRE(ok);
    return f;
}

const NeImage& exe() {
    static NeImage img;
    static bool ok = [] {
        auto bytes = files().read("OUTPOST.EXE");
        return bytes && img.parse(std::move(*bytes));
    }();
    REQUIRE(ok);
    return img;
}

const StringTable& strings() {
    static StringTable t;
    static bool ok = t.load(exe());
    REQUIRE(ok);
    return t;
}

} // namespace

TEST_CASE("RESOURCE.000 decodes", "[data][archive]") {
    DclArchive arc;
    REQUIRE(arc.open(std::filesystem::path(OUTPOST_TEST_DATA_DIR) / "RESOURCE.000"));
    REQUIRE(arc.entries().size() == 14);
    const auto* e = arc.find("outpost.exe");
    REQUIRE(e != nullptr);
    REQUIRE(e->dosDate == ((15 << 9) | (7 << 5) | 19));      // 1995-07-19
    auto data = arc.extract("OUTPOST.EXE");
    REQUIRE(data.has_value());
    REQUIRE(data->size() == 640896);
    auto ini = arc.extract("OUTPOST.INI");
    REQUIRE(ini.has_value());
    REQUIRE(std::string(ini->begin(), ini->end()) == "[general]\r\nopimage=\r\n");
}

TEST_CASE("RESOURCE.000 entries match a reference extraction", "[data][archive]") {
    const auto ref = std::filesystem::path(OUTPOST_TEST_DATA_DIR) / ".." / "Resource.000 extract";
    if (!std::filesystem::exists(ref)) SKIP("no reference extraction");
    DclArchive arc;
    REQUIRE(arc.open(std::filesystem::path(OUTPOST_TEST_DATA_DIR) / "RESOURCE.000"));
    for (const auto& e : arc.entries()) {
        INFO(e.name);
        std::ifstream f(ref / e.name, std::ios::binary);
        REQUIRE(f.good());
        std::vector<uint8_t> want((std::istreambuf_iterator<char>(f)), std::istreambuf_iterator<char>());
        auto got = arc.extract(e.name);
        REQUIRE(got.has_value());
        REQUIRE(got->size() == want.size());
        REQUIRE(*got == want);
    }
}

TEST_CASE("OUTPOST.EXE NE structure", "[data][exe]") {
    const auto& img = exe();
    REQUIRE(img.segments().size() == 11);
    REQUIRE(img.autoDataSegment() == 11);
    REQUIRE(img.segments()[0].fileOffset == 0xA20);
    REQUIRE(img.segments()[0].length == 0x55B7);
    REQUIRE(img.dgroup().size() == 0x68B6);
    REQUIRE(img.resources().size() == 156);
}

TEST_CASE("String table", "[data][strings]") {
    const auto& s = strings();
    REQUIRE(s.size() == 882);
    REQUIRE(s.get(1444) == "Tau Ceti");
    REQUIRE(s.get(1500) == "Outpost - Turn #");
    REQUIRE(s.get(1495) == "Power");
}

TEST_CASE("Building data", "[data][buildings]") {
    auto bld = parseBldgBld(*files().read("BLDGBLD.DAT"));
    auto ops = parseBldgOps(*files().read("BLDGOPS.DAT"));
    REQUIRE(bld.size() == 138);
    REQUIRE(ops.size() == 138);
    REQUIRE(bld[20].name == "Tokamak");
    REQUIRE(ops[20].name == "Tokamak");

    // Tokamak operation burns the three fusion fuels.
    REQUIRE(ops[20].need[res::FusionA] == 1);
    REQUIRE(ops[20].need[res::FusionB] == 1);
    REQUIRE(ops[20].need[res::FusionC] == 1);
    // Agri dome: build needs 3 power + 2 workers, runs on 2 power + 1 worker.
    REQUIRE(bld[27].name == "AgriDome");
    REQUIRE(bld[27].need[res::Power] == 3);
    REQUIRE(bld[27].need[res::People] == 2);
    REQUIRE(ops[27].need[res::Power] == 2);
    REQUIRE(ops[27].need[res::People] == 1);
    // Construction flags only ever touch refined materials (17..28).
    for (const auto& r : bld)
        for (int id = res::OreLifeA; id < res::MetalA; ++id) REQUIRE(r.need[static_cast<size_t>(id)] == 0);
}

TEST_CASE("Research trees", "[data][research]") {
    ResearchTree tree;
    REQUIRE(tree.load(exe(), strings()));
    REQUIRE(tree.topics().size() == 131);       // 0..130

    const auto* basic = tree.find(1);
    REQUIRE(basic->name == "Basic Research");
    REQUIRE(basic->cost == 100);
    REQUIRE(basic->parent == 0);
    REQUIRE(tree.find(12)->name == "Exobiology");
    REQUIRE(tree.find(12)->cost == 200);

    const auto* agri2 = tree.find(118);
    REQUIRE(agri2->name == "Agriculture 2");
    REQUIRE(agri2->advanced);
    REQUIRE(agri2->cost == 100);
    REQUIRE(agri2->parent == 117);              // Genetic Engineering
    REQUIRE(tree.find(117)->parent == 116);     // Genetics
    REQUIRE(tree.find(116)->parent == 115);     // Biology
}

TEST_CASE("Star table", "[data][stars]") {
    StarTable stars;
    REQUIRE(stars.load(exe(), strings()));
    const auto& s = stars.stars();
    REQUIRE(s.size() == 21);
    REQUIRE(s[0].name == "Tau Ceti");
    REQUIRE(s[1].name == "Alpha Centauri B");
    REQUIRE(s[2].name == "Alpha Centauri A");
    REQUIRE(s[4].name == "70 Ophiuchi A");
    REQUIRE(s[20].name == "Delta Pavonis");
    REQUIRE(s[0].spectralClass == "G8");
    REQUIRE_THAT(s[0].distance(), Catch::Matchers::WithinAbs(11.7, 1e-9));

    int planetless = 0;
    for (const auto& r : s) {
        if (!r.hasTerrestrialPlanet()) {
            ++planetless;
            REQUIRE(r.planetCount == 1);
            REQUIRE(r.planetTypes[0] == 5);
        }
    }
    REQUIRE(planetless == 7);
    REQUIRE(stars.byName("Sigma Draconis")->planetCount == 4);
}

TEST_CASE("TUTOR.OPS save container", "[data][ops]") {
    auto bytes = files().read("TUTOR.OPS");
    REQUIRE(bytes.has_value());
    OpsSave save;
    REQUIRE(save.parse(*bytes));
    REQUIRE(save.version() == 1);
    REQUIRE(save.chunks().size() == 19);
    REQUIRE(save.chunk(0x10)->body.size() == 7484);
    REQUIRE(save.strings(0x04) == std::vector<std::string>{"Aphrodite", "Anonymous Bosch"});
    REQUIRE(save.strings(0x0D) == std::vector<std::string>{"Sigma Draconis 4"});
}

TEST_CASE("Building pictures, names and menus from OUTPOST.EXE", "[data][graphics]") {
    outpost::data::GameFiles files;
    REQUIRE(files.open(OUTPOST_TEST_DATA_DIR));
    outpost::data::NeImage exe;
    REQUIRE(exe.parse(*files.read("OUTPOST.EXE")));
    outpost::data::BuildingPictures pics;
    REQUIRE(pics.load(exe));
    REQUIRE(pics.sheetName(9) == "tile1.bmp");                 // DGROUP 0x172A
    const auto agri = pics.picture(27);                        // catalog +0x3382
    REQUIRE(agri);
    REQUIRE(agri->sheet >= 9);
    REQUIRE(agri->sheet <= 14);
    REQUIRE(pics.animation(53)->first == 1);                   // Smelter frames 1..10
    REQUIRE(pics.animation(53)->last == 10);
    REQUIRE_FALSE(pics.animation(27));                         // AgriDome is not animated
    REQUIRE(pics.terrain(1)->w == 107);                        // DGROUP 0x2554
    REQUIRE(pics.terrainSheet(1) == "272.bmp");

    outpost::data::StringTable strings;
    REQUIRE(strings.load(exe));
    REQUIRE(outpost::data::buildingName(exe, strings, 27) == "Agri. Dome");   // s5:BD80
    REQUIRE(outpost::data::buildingName(exe, strings, 63) == "Monorail Station");
    REQUIRE(outpost::data::buildingName(exe, strings, 67) == "bidLRoadConst");  // quirk Q63

    const auto menu = outpost::data::MenuResource::load(exe, "OPPOPMENU");
    REQUIRE(menu);
    REQUIRE(menu->items.size() == 1);
    const auto& bar = menu->items[0].children;
    REQUIRE(bar.size() == 5);
    REQUIRE(bar[2].text == "Control");
    REQUIRE(bar[2].children[0].id == 104);                    // "Run a Turn"
}
