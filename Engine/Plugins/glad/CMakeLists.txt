include_directories(glad
    PUBLIC
    include
)

add_library(glad "src/glad.c")

add_custom_command(TARGET glad POST_BUILD
                   COMMAND ${CMAKE_COMMAND} 
                   -E copy $<TARGET_FILE:glad> 
                   ${CMAKE_SOURCE_DIR}/Binaries/${CMAKE_SYSTEM_NAME}/glad/$<TARGET_FILE_NAME:glad>)
