cmake_minimum_required(VERSION 3.13)

project(
	chimera_example
)

set(CMAKE_CXX_STANDARD 17)

set(GLEW_DIR
	"/Users/jinypark/.brew/Cellar/glew/2.2.0_1"
)

set(GLM_DIR
	"/Users/jinypark/.brew/Cellar/glm/0.9.9.8"
)

set(SOURCE_FILES
	source/main.cpp
)

add_executable(chimera_example
	${SOURCE_FILES}
)

# add_subdirectory(
# 	${GLEW_DIR}
# )

target_include_directories(chimera_example
	PUBLIC
    include
	${GLEW_DIR}/include
	${GLM_DIR}/include
)

# target_link_libraries(chimera_example
# 	glfw
# )

target_compile_definitions(chimera_example
	PRIVATE
    ROOT_PATH="${CMAKE_SOURCE_DIR}"
)