# 引入外部依赖的项目
include(GetFTXUI)

# 创建一个新的 target：calc_console_static 静态库（STATIC 关键字）
add_library(calc_console_static STATIC tui.cpp)

# 对外暴露其头文件（PUBLIC 关键字）
target_include_directories(calc_console_static PUBLIC include)
target_precompile_headers(calc_console_static PUBLIC <string>)
target_link_libraries(calc_console_static PUBLIC calc_shared
                    ftxui::screen ftxui::dom ftxui::component)
include(BuildInfo)
BuildInfo(calc_console_static)
include(Coverage)
CleanCoverage(calc_console_static)
include(Format)
Format(calc_console_static .)
include(CppCheck)
AddCppCheck(calc_console_static)
include(Doxygen)
Doxygen(calc_console src/calc_console)

add_executable(calc_console bootstrap.cpp)
target_link_libraries(calc_console calc_console_static)
