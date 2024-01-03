cmake_minimum_required(VERSION 3.28)

project(Chimera_core)
set(NAME Chimera_core)

set(CMAKE_CXX_STANDARD 17)

# 프로젝트에 라이브러리가 없을 경우, 로컬에 설치된 라이브러리를 검색합니다.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/Build/BuildUtil/CMake")

add_subdirectory(
	"Plugins/glfw"
    "${CMAKE_SOURCE_DIR}/Binaries/test/glfw"
	)
	
add_subdirectory(
	"Plugins/glad"
	"${CMAKE_SOURCE_DIR}/Binaries/test/glad"
	)

# find required packages
find_package(GLM REQUIRED)
find_package(GLFW3 REQUIRED)
		
# set required libraries
set(LIBS ${LIBS} ${GLFW3_LIBRARY})
set(LIBS ${LIBS} GLAD)

if(APPLE)
	INCLUDE_DIRECTORIES(/System/Library/Frameworks)
	FIND_LIBRARY(COCOA_LIBRARY Cocoa)
	FIND_LIBRARY(OpenGL_LIBRARY OpenGL)
	FIND_LIBRARY(IOKit_LIBRARY IOKit)
	FIND_LIBRARY(CoreVideo_LIBRARY CoreVideo)
	MARK_AS_ADVANCED(COCOA_LIBRARY OpenGL_LIBRARY)
	SET(APPLE_LIBS ${COCOA_LIBRARY} ${IOKit_LIBRARY} ${OpenGL_LIBRARY} ${CoreVideo_LIBRARY})
	SET(APPLE_LIBS ${APPLE_LIBS} ${GLFW3_LIBRARY} ${ASSIMP_LIBRARY} ${FREETYPE_LIBRARIES})
	set(LIBS ${LIBS} ${APPLE_LIBS})
endif(APPLE)

set(GLAD_INCLUDE_DIR "Plugins/glad/include")

file(GLOB SOURCE
	source/*.cpp
)

include_directories(${NAME}
	PUBLIC
	include
	${GLM_INCLUDE_DIR}
	${GLFW3_INCLUDE_DIR}
	${GLAD_INCLUDE_DIR}
)

add_executable(${NAME} ${SOURCE})

target_link_libraries(${NAME} ${LIBS})

# target_compile_definitions(${NAME}
# 	PRIVATE
#     ROOT_PATH="${CMAKE_SOURCE_DIR}"
# )

# set_target_properties(${NAME}
#     PROPERTIES
#     ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/libar"
#     LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/liblib"
#     RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}"
# )