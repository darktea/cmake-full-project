# 检查当前系统的 Cmake 版本
# 同时也会调用 cmake_policy 命令来检查当前的 policy 是否兼容
cmake_minimum_required(VERSION 3.20.0)

# 设置 3 个属性：
# 1）Project 的名字（Calc）
# 2）项目版本
# 3）项目的语言。例如：CXX，C
project(Calc VERSION 1.0.0 LANGUAGES CXX)

# 把 "${CMAKE_SOURCE_DIR}/cmake" 添加（append）到 CMAKE_MODULE_PATH 路径中去。
# 我们把我们自己编写的 module 放到了这个 ${CMAKE_SOURCE_DIR}/cmake 目录下。
# 这样以后要加载 module 时，会到 $(CMAKE_SOURCE_DIR)/cmake 目录下去搜寻要加载的 module。
#
# 其中：
# CMAKE_SOURCE_DIR 是当前项目的顶级目录
# CMAKE_MODULE_PATH 是 cmake module（cmake 模块）所在的目录
#
# CMake 中可以使用 list 命令来对 list 进行操作，这里是对 list 进行 APPEND
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# include 命令有 2 种用途：
# 1）包含其他以 cmake 为后缀的文件，并执行。一般需要指定到这个文件的绝对路径
# 2）包含其他的 module（不带 cmake 后缀），并执行。会在 CMAKE_MODULE_PATH 下按名字寻找要包含的 module
#
# 就这个例子来说，是第二种情况：加载 NoInSourceBuilds 模块，并执行
include(NoInSourceBuilds)

# 用 add_subdirectory 命令对项目进行第一级拆分，分为 2 个模块，也就是：src 和 test 2 个目录
#
# add_subdirectory 命令会在指定的 src 目录（当前目录下的 src 目录）中寻找 CMakeLists.txt 文件
# 如果能找到 CMakeLists.txt，那么这个文件会在「目录作用域」中进行解析（不同于「函数作用域」）
add_subdirectory(src bin)
add_subdirectory(test)

include(Install)
