cmake_minimum_required(VERSION 3.27)

project(ChimeraEngineCore)

set(CMAKE_CXX_STANDARD 17)

file(GLOB PLUGINS
	Plugins/*)

foreach(plugin IN LISTS PLUGINS)
	add_subdirectory(${plugin})	
endforeach()

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

set(LIBS ${LIBS} glm glad glfw)

file(GLOB SOURCE
	source/*.cpp
)

include_directories(${CMAKE_PROJECT_NAME}
	PUBLIC
	${GLAD_INCLUDE_DIR}
)

add_executable(${CMAKE_PROJECT_NAME} ${SOURCE})

target_link_libraries(${CMAKE_PROJECT_NAME} ${LIBS})

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
					  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}
)

# ----------------------------------------------------------------------------
# Add Custom makefile rule (ex make fclean, re)
ADD_CUSTOM_TARGET( re
        COMMENT "Re-building..."
        COMMAND make fclean && make all
        # ...
        )

ADD_CUSTOM_TARGET( fclean
        COMMENT "Cleaning config files, executable and binaries..."
        COMMAND make clean
		COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_SOURCE_DIR}/Binaries
		COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_SOURCE_DIR}/Config
        )