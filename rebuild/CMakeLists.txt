cmake_minimum_required(VERSION 3.20)
project(OutpostRebuild VERSION 0.1.0 LANGUAGES CXX)
# The release of Outpost: New Hope, shown on the title screen and in the
# executable's properties.
set(OUTPOST_VERSION "2.01")
set(OUTPOST_VERSION_NUMBERS 2,1,0,0)

# Modern rebuild of Outpost (Sierra, 1994/95, v1.51).
# Game data is read at runtime from the player's original files; see
# specs/003-original-rebuild/plan.md.

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
    add_compile_options(/W4 /permissive- /utf-8)
else()
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# ── Original data readers ────────────────────────────────────────────────
add_library(outpost_data STATIC
    src/data/dcl_archive.cpp
    src/data/ne_image.cpp
    src/data/string_table.cpp
    src/data/building_data.cpp
    src/data/building_groups.cpp
    src/data/research_tree.cpp
    src/data/star_table.cpp
    src/data/ops_save.cpp
    src/data/dialog_template.cpp
    src/data/game_files.cpp
    src/data/site_maps.cpp
    src/data/pictures.cpp
    src/data/menu_resource.cpp
    src/data/flc.cpp
    src/data/media.cpp
    src/data/planet_facts.cpp
    src/data/terrain_gen.cpp
    src/data/terrain_pack.cpp
)
target_include_directories(outpost_data PUBLIC src)

# ── Simulation core ──────────────────────────────────────────────────────
add_library(outpost_sim STATIC
    src/sim/object_db.cpp
    src/sim/world.cpp
    src/sim/building.cpp
    src/sim/step_queue.cpp
    src/sim/steps.cpp
    src/sim/research.cpp
    src/sim/events.cpp
    src/sim/endsim.cpp
    src/sim/ops_extensions.cpp
    src/sim/rebels.cpp
    src/sim/units.cpp
    src/sim/trucking.cpp
    src/sim/ai.cpp
    src/sim/ops_loader.cpp
    src/sim/ops_writer.cpp
    src/sim/ship_config.cpp
    src/sim/new_game.cpp
    src/sim/modern_galaxy.cpp
    src/sim/rebel_ai_improved.cpp
    src/sim/breakdowns_improved.cpp
    src/sim/disasters_improved.cpp
    src/sim/simulation.cpp
    src/sim/map.cpp
    src/sim/vehicles.cpp
)
target_link_libraries(outpost_sim PUBLIC outpost_data)

# A play-test bot (tools/autoplay): runs a colony with the player's rules and
# checks the state each turn. Not part of the game.
add_executable(outpost-autoplay tools/autoplay/autoplay.cpp)
target_link_libraries(outpost-autoplay PRIVATE outpost_sim)

# ── Tests ────────────────────────────────────────────────────────────────
option(OUTPOST_REBUILD_TESTS "Build the rebuild's tests" ON)
if(OUTPOST_REBUILD_TESTS)
    include(FetchContent)
    # Reuse an already-fetched Catch2 from the main build if present.
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/../build/_deps/catch2-src/CMakeLists.txt")
        set(FETCHCONTENT_SOURCE_DIR_CATCH2 "${CMAKE_CURRENT_SOURCE_DIR}/../build/_deps/catch2-src")
    endif()
    FetchContent_Declare(Catch2
        GIT_REPOSITORY https://github.com/catchorg/Catch2.git
        GIT_TAG v3.6.0)
    FetchContent_MakeAvailable(Catch2)

    add_executable(rebuild-tests
        tests/test_data.cpp
        tests/test_sim.cpp
        tests/test_saves.cpp
        tests/test_map.cpp
        tests/test_ship.cpp
        tests/test_new_game.cpp
        tests/test_media.cpp
        tests/test_modern.cpp
    )
    target_link_libraries(rebuild-tests PRIVATE outpost_sim Catch2::Catch2WithMain)
    # Folder with the original game: an install dir or the CD (RESOURCE.000).
    target_compile_definitions(rebuild-tests PRIVATE
        OUTPOST_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/../Outpost")
    enable_testing()
    add_test(NAME rebuild-tests COMMAND rebuild-tests)
endif()

# ── Game (Milestone 5) ───────────────────────────────────────────────────
# Needs SDL2 (e.g. vcpkg: -DCMAKE_PREFIX_PATH=C:/tools/vcpkg/installed/x64-windows).
option(OUTPOST_REBUILD_APP "Build the rebuild's game executable" ON)
if(OUTPOST_REBUILD_APP)
    if(WIN32 AND EXISTS "C:/tools/vcpkg/installed/x64-windows")
        list(APPEND CMAKE_PREFIX_PATH "C:/tools/vcpkg/installed/x64-windows")   # SDL2_image's PNG, zlib
    endif()
    if(WIN32 AND NOT SDL2_DIR AND EXISTS "C:/tools/vcpkg/installed/x64-windows/share/sdl2")
        set(SDL2_DIR "C:/tools/vcpkg/installed/x64-windows/share/sdl2")
    endif()
    if(WIN32 AND NOT SDL2_ttf_DIR AND EXISTS "C:/tools/vcpkg/installed/x64-windows/share/sdl2-ttf")
        set(SDL2_ttf_DIR "C:/tools/vcpkg/installed/x64-windows/share/sdl2-ttf")
        list(APPEND CMAKE_PREFIX_PATH "C:/tools/vcpkg/installed/x64-windows")
    endif()
    if(WIN32 AND NOT SDL2_image_DIR AND EXISTS "C:/tools/vcpkg/installed/x64-windows/share/SDL2_image/SDL2_imageConfig.cmake")
        set(SDL2_image_DIR "C:/tools/vcpkg/installed/x64-windows/share/SDL2_image")
    endif()
    find_package(SDL2 CONFIG QUIET)
    find_package(SDL2_ttf CONFIG QUIET)
    find_package(SDL2_image CONFIG QUIET)
    # Sound (milestone 7): SDL2_mixer for the waves, optional; MIDI goes
    # through MCI (winmm) on Windows, as in the original.
    if(WIN32 AND NOT SDL2_mixer_DIR AND EXISTS "C:/tools/vcpkg/installed/x64-windows/share/SDL2_mixer")
        set(SDL2_mixer_DIR "C:/tools/vcpkg/installed/x64-windows/share/SDL2_mixer")
    endif()
    find_package(SDL2_mixer CONFIG QUIET)
    if(SDL2_FOUND AND SDL2_ttf_FOUND AND SDL2_image_FOUND)
        add_executable(outpost-rebuild
            src/app/main.cpp src/app/gfx.cpp src/app/map_view.cpp src/app/hd_sprites.cpp src/app/ui.cpp
            src/app/start.cpp src/app/game.cpp
            src/app/audio.cpp src/app/movie.cpp src/app/sequence.cpp src/app/site_map.cpp
            src/app/research_window.cpp src/app/research_text.cpp src/app/planet_window.cpp)
        target_include_directories(outpost-rebuild PRIVATE src)
        target_link_libraries(outpost-rebuild PRIVATE outpost_sim SDL2::SDL2 SDL2::SDL2main SDL2_ttf::SDL2_ttf
            SDL2_image::SDL2_image)
        if(SDL2_mixer_FOUND)
            target_link_libraries(outpost-rebuild PRIVATE SDL2_mixer::SDL2_mixer)
            target_compile_definitions(outpost-rebuild PRIVATE OUTPOST_HAVE_MIXER=1)
        else()
            message(STATUS "SDL2_mixer not found: the game is built without sound effects and voices")
        endif()
        if(WIN32)
            target_link_libraries(outpost-rebuild PRIVATE winmm)
        endif()
        # Fonts and UI art are not original data: DejaVu Sans, Exo 2 and
        # Orbitron (free licences) and Kenney's sci-fi UI pack (CC0,
        # recoloured), kept in rebuild/assets and copied next to the
        # executable.
        target_compile_definitions(outpost-rebuild PRIVATE
            OUTPOST_DEFAULT_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/../Outpost"
            OUTPOST_FONT_FILE="DejaVuSans.ttf"
            OUTPOST_VERSION="${OUTPOST_VERSION}")
        if(WIN32)
            configure_file(src/app/version.rc.in "${CMAKE_CURRENT_BINARY_DIR}/version.rc" @ONLY)
            target_sources(outpost-rebuild PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/version.rc")
        endif()
        add_custom_command(TARGET outpost-rebuild POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                "${CMAKE_CURRENT_SOURCE_DIR}/assets/fonts/DejaVuSans.ttf"
                "${CMAKE_CURRENT_SOURCE_DIR}/assets/fonts/Exo2.ttf"
                "${CMAKE_CURRENT_SOURCE_DIR}/assets/fonts/Orbitron.ttf" $<TARGET_FILE_DIR:outpost-rebuild>
            COMMAND ${CMAKE_COMMAND} -E copy_directory
                "${CMAKE_CURRENT_SOURCE_DIR}/assets/ui" $<TARGET_FILE_DIR:outpost-rebuild>/ui
            # IMPROVED (I93): the terrain packs (CC0 art, tools/make_terrain_packs.py).
            COMMAND ${CMAKE_COMMAND} -E copy_directory
                "${CMAKE_CURRENT_SOURCE_DIR}/assets/terrain-packs" $<TARGET_FILE_DIR:outpost-rebuild>/terrain-packs
            # IMPROVED (I65): OutpostHD's building, robot and terrain art (BSD 3-Clause).
            COMMAND ${CMAKE_COMMAND} -E copy_directory
                "${CMAKE_CURRENT_SOURCE_DIR}/assets/ophd" $<TARGET_FILE_DIR:outpost-rebuild>/ophd
            # IMPROVED (I95): the player's soundtrack (OGG), replacing the music.
            COMMAND ${CMAKE_COMMAND} -E copy_directory
                "${CMAKE_CURRENT_SOURCE_DIR}/assets/music" $<TARGET_FILE_DIR:outpost-rebuild>/music)
        if(WIN32)
            add_custom_command(TARGET outpost-rebuild POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    $<TARGET_FILE:SDL2::SDL2> $<TARGET_FILE:SDL2_ttf::SDL2_ttf> $<TARGET_FILE:SDL2_image::SDL2_image>
                    $<TARGET_FILE_DIR:outpost-rebuild>)
            if(SDL2_mixer_FOUND)
                add_custom_command(TARGET outpost-rebuild POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E copy_if_different
                        $<TARGET_FILE:SDL2_mixer::SDL2_mixer> $<TARGET_FILE_DIR:outpost-rebuild>)
            endif()
            # Runtime DLLs of SDL2_image, SDL2_ttf and SDL2_mixer (vcpkg).
            foreach(dll libpng16.dll z.dll freetype.dll bz2.dll brotlicommon.dll brotlidec.dll
                        ogg.dll vorbis.dll vorbisfile.dll wavpackdll.dll)
                if(EXISTS "C:/tools/vcpkg/installed/x64-windows/bin/${dll}")
                    add_custom_command(TARGET outpost-rebuild POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E copy_if_different
                            "C:/tools/vcpkg/installed/x64-windows/bin/${dll}" $<TARGET_FILE_DIR:outpost-rebuild>)
                endif()
            endforeach()
        endif()
    else()
        message(STATUS "SDL2, SDL2_ttf or SDL2_image not found: the game executable is not built")
    endif()
endif()
