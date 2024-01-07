include_directories(glad
    PUBLIC
    include
)

add_library(glad "src/glad.c")

set_target_properties(glad PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")