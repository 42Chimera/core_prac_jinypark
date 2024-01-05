cmake_minimum_required(VERSION 3.27)

project(triangle-opengl)

include(${CMAKE_SOURCE_DIR}/Config/DefaultEngine.txt)

link_libraries(/Users/jinypark/Desktop/core_prac_jinypark/Engine/Intermediate/Plugins/glfw/src/libglfw.dylib)
# link_libraries(/Users/jinypark/Desktop/core_prac_jinypark/Engine/Plugins/glfw/Binaries/Darwin/GLFW/libglfw.dylib)
# link_libraries(/Users/jinypark/Desktop/core_prac_jinypark/Engine/Plugins/glfw/build/src/libglfw.dylib)


# set(GLFW_SOURCE_DIR /Users/jinypark/Desktop/core_prac_jinypark/Templates/triangle-opengl)
set(GLFW_SOURCE_DIR /Users/jinypark/Desktop/core_prac_jinypark/Engine/Plugins/glfw)

include_directories("${GLFW_SOURCE_DIR}/deps"
/Users/jinypark/Desktop/core_prac_jinypark/Engine/Plugins/glfw/include
/Users/jinypark/Desktop/core_prac_jinypark/Engine/Plugins/glfw/src
/Users/jinypark/Desktop/core_prac_jinypark/Engine/Plugins/glfw/build/src)

if (MATH_LIBRARY)
    link_libraries("${MATH_LIBRARY}")
endif()

# Workaround for the MS CRT deprecating parts of the standard library
if (MSVC OR CMAKE_C_SIMULATE_ID STREQUAL "MSVC")
add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif()

if (WIN32)
set(ICON glfw.rc)
elseif (APPLE)
set(ICON glfw.icns)
endif()

MESSAGE(STATUS "GLFW_SOURCE_DIR: ${GLFW_SOURCE_DIR}")
set(GLAD_GL "${GLFW_SOURCE_DIR}/deps/glad/gl.h")
set(GLAD_GLES2 "${GLFW_SOURCE_DIR}/deps/glad/gles2.h")
set(GETOPT "${GLFW_SOURCE_DIR}/deps/getopt.h"
            "${GLFW_SOURCE_DIR}/deps/getopt.c")
set(TINYCTHREAD "${GLFW_SOURCE_DIR}/deps/tinycthread.h"
                "${GLFW_SOURCE_DIR}/deps/tinycthread.c")


add_executable(triangle-opengl WIN32 MACOSX_BUNDLE triangle-opengl.c ${ICON} ${GLAD_GL})
# add_executable(triangle-opengl triangle-opengl.c ${ICON} ${GLAD_GL})

# link_directories(/Users/jinypark/Desktop/core_prac_jinypark/Engine/Binaries/Darwin/GLFW)

set(GUI_ONLY_BINARIES triangle-opengl)

set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
C_STANDARD 99
FOLDER "${CMAKE_SOURCE_DIR}")

# if (MSVC)
#     # Tell MSVC to use main instead of WinMain
#     set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
#                           LINK_FLAGS "/ENTRY:mainCRTStartup")
# elseif (CMAKE_C_SIMULATE_ID STREQUAL "MSVC")
#     # Tell Clang using MS CRT to use main instead of WinMain
#     set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
#                           LINK_FLAGS "-Wl,/entry:mainCRTStartup")
# endif()

if (APPLE)
    set_target_properties(triangle-opengl PROPERTIES MACOSX_BUNDLE_BUNDLE_NAME "OpenGL Triangle")

    set_source_files_properties(glfw.icns PROPERTIES
                                MACOSX_PACKAGE_LOCATION "Resources")
    set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
                          MACOSX_BUNDLE_SHORT_VERSION_STRING ${GLFW_VERSION}
                          MACOSX_BUNDLE_LONG_VERSION_STRING ${GLFW_VERSION}
                          MACOSX_BUNDLE_ICON_FILE glfw.icns
                          MACOSX_BUNDLE_INFO_PLIST "${GLFW_SOURCE_DIR}/CMake/Info.plist.in")
endif()


set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}
)