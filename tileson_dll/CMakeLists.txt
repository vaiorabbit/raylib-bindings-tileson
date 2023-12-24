cmake_minimum_required(VERSION 3.5)
include(CMakePrintHelpers)
project(tileson
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(BUILD_PLATFORM "arm64, aarch64, x86_64, etc." "x86_64")

set(TILESON_SOURCES
    ${CMAKE_CURRENT_LIST_DIR}/tileson/src/raylib-tileson.cpp
	)
add_library(tileson SHARED ${TILESON_SOURCES})

set_target_properties(tileson PROPERTIES PREFIX "")

target_include_directories(tileson PUBLIC ${RAYLIB_DLL_PATH}/raylib/src )
target_include_directories(tileson PUBLIC ${CMAKE_CURRENT_LIST_DIR}/tileson/include )

target_link_directories(tileson PUBLIC ${RAYLIB_DLL_PATH}/../lib)

# For " Policy CMP0042 is not set: MACOSX_RPATH is enabled by default."
if (APPLE)
    set(CMAKE_MACOSX_RPATH ON)
endif (APPLE)

if (APPLE)
    target_link_libraries(tileson raylib.${CMAKE_OSX_ARCHITECTURES})
else()
    target_link_libraries(tileson raylib)
endif()

if (APPLE)
    set_target_properties(tileson PROPERTIES
        XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ""
	)
endif (APPLE)


#install
install(TARGETS tileson
              RUNTIME DESTINATION  .
              LIBRARY DESTINATION  .
              ARCHIVE DESTINATION  .
              )
