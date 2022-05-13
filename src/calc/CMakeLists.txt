# calc 目录下是库相关的代码
#
# 使用 add_library 命令建立一个全局可见的 target：calc_obj
# 这里使用了 OBJECT 关键字，指明该 target 是 object files
add_library(calc_obj OBJECT calc.cpp)

# 然后对 target 进行相关设置。

# 先使用 target_include_directories 命令让这个 target 配套的 include 目录被加到公共 public include 目录
# 这样其他使用这个 target 的代码，可以直接使用 #include "calc.h"
target_include_directories(calc_obj INTERFACE
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
set_target_properties(calc_obj PROPERTIES
    PUBLIC_HEADER src/calc/include/calc/calc.h
    POSITION_INDEPENDENT_CODE 1
)

add_library(calc_shared SHARED)
target_link_libraries(calc_shared calc_obj)
add_library(calc_static STATIC)
target_link_libraries(calc_static calc_obj)

include(Coverage)
CleanCoverage(calc_static)
include(Format)
Format(calc_static .)
include(CppCheck)
AddCppCheck(calc_obj)
include(Doxygen)
Doxygen(calc src/calc)
