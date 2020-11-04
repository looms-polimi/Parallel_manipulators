cmake_minimum_required(VERSION 3.1)
project(FMI)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_BUILD_TYPE Release)

set(SRCS fmitest.cpp fmi_interface.cpp)
add_executable(fmitest ${SRCS})

add_custom_command(
    TARGET fmitest
    PRE_BUILD
    COMMAND omc buildfmi.mos
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    VERBATIM)

set_property(
    DIRECTORY
    PROPERTY ADDITIONAL_MAKE_CLEAN_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/FmiTest.Model")

## Link libraries
find_library(PUGI_XML pugixml)
target_link_libraries(fmitest ${PUGI_XML} ${CMAKE_DL_LIBS})
