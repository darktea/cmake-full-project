# calc 目录下是库相关的代码
#
# 使用 add_library 命令建立一个全局可见的 target：calc_obj
# 这里使用了 OBJECT 关键字，指明该 target 是 object files
# 后续可以使用 target_link_libraries 命令来使用 object files
add_library(calc_obj OBJECT calc.cpp)

# 然后对 target 的 Properties 进行设置。

# 先使用 target_include_directories 命令把当前头文件的搜索路径加
# 这样其他使用这个 target 的代码，可以直接使用 #include "calc.h"
# 这里使用 INTERFACE 关键字标明加到 INTERFACE_INCLUDE_DIRECTORIES
# （如果使用 PRIVATE 关键字标明加到 INCLUDE_DIRECTORIES）
#
# 另外，这里还使用了 BUILD_INTERFACE 和 INSTALL_INTERFACE，
# 分别代表构建时的 INTERFACE 和 安装时的 INTERFACE
target_include_directories(calc_obj INTERFACE
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

# 直接使用 set_target_properties 命令设置必要的 PROPERTIES：
#
# PUBLIC_HEADER：指定 install 时，头文件的安装路径。
# 我们推荐的做法是把 calc.h 安装到：{系统头文件目录}/calc
# 而不是直接把 calc.h 安装到 ${系统头文件目录}
# 说明：${系统头文件目录} 在不同系统中可能不同，在 Mac 系统下可能是 /usr/local/include
#
# 要生成共享库的话，需要加上 -fPIC 选项：POSITION_INDEPENDENT_CODE
set_target_properties(calc_obj PROPERTIES
    PUBLIC_HEADER src/calc/include/calc/calc.h
    POSITION_INDEPENDENT_CODE 1
)

# 创建一个新的 target：calc_shared 共享库（SHARED 关键字）
add_library(calc_shared SHARED)

# 把 object files 链接到共享库 target
target_link_libraries(calc_shared calc_obj)

# 创建一个新的 target：calc_static 静态库（STATIC 关键字）
add_library(calc_static STATIC)

# 把 object files 链接到静态库 target
target_link_libraries(calc_static calc_obj)

# 包含 Coverage 脚本（cmake 目录下），会调用其中定义的函数：Coverage
include(Coverage)
CleanCoverage(calc_static)

# 包含 Format 脚本（cmake 目录下），会调用其中定义的函数：Format
include(Format)
Format(calc_static .)

# 包含 CppCheck 脚本（cmake 目录下），会调用其中定义的函数：AddCppCheck
include(CppCheck)
AddCppCheck(calc_obj)

# 包含 Doxygen 脚本（cmake 目录下），会调用其中定义的函数：Doxygen
include(Doxygen)
Doxygen(calc src/calc)
