cmake_minimum_required(VERSION 3.27)

set(NAME triangle-opengl)
project(${NAME} VERSION 1.0 LANGUAGES C)

set(CHIMERA_ENGINE_DIR C:/Users/82104/Desktop/core5/Engine)
# Set modules(internal)
add_subdirectory(C:/Users/82104/Desktop/core5/Engine/Plugins/glfw C:/Users/82104/Desktop/core5/Templates/triangle-opengl/build/bin)
include_directories("${GLFW_SOURCE_DIR}/deps"
                    "${GLFW_SOURCE_DIR}/include")
# Set plugins(external)
find_package(Threads REQUIRED)


MESSAGE(STATUS "GLFW_SOURCE_DIR: ${GLFW_SOURCE_DIR}")
set(GLAD_GL "${GLFW_SOURCE_DIR}/deps/glad/gl.h")
set(GLAD_GLES2 "${GLFW_SOURCE_DIR}/deps/glad/gles2.h")
set(GETOPT "${GLFW_SOURCE_DIR}/deps/getopt.h"
            "${GLFW_SOURCE_DIR}/deps/getopt.c")
set(TINYCTHREAD "${GLFW_SOURCE_DIR}/deps/tinycthread.h"
                "${GLFW_SOURCE_DIR}/deps/tinycthread.c")


add_executable(triangle-opengl Source/triangle-opengl/triangle-opengl.c ${GLAD_GL})

target_link_libraries(triangle-opengl
                      glfw
                    #   glm
                    #   glad
)

set(GUI_ONLY_BINARIES triangle-opengl)

set_target_properties(${GUI_ONLY_BINARIES} PROPERTIES
    C_STANDARD 99
    FOLDER "${CMAKE_SOURCE_DIR}/Source/triangle-opengl"
)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)