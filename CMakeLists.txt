# 检查当前系统的 Cmake 版本
# 同时也会调用 cmake_policy 命令来检查当前的 policy 是否兼容
cmake_minimum_required(VERSION 3.20.0)

# 设置 3 个属性：
# 1）Project 的名字（Calc）
# 2）项目版本
# 3）项目的语言。例如：CXX，C
project(Calc VERSION 1.0.0 LANGUAGES CXX)

# 把 "${CMAKE_SOURCE_DIR}/cmake" 添加（append）到 CMAKE_MODULE_PATH 路径中去
#
# 其中：
# CMAKE_SOURCE_DIR 是当前项目的顶级目录
# CMAKE_MODULE_PATH 是 cmake module（cmake 模块）所在的目录
#
# CMake 中可以使用 list 命令来对 list 进行操作，这里是对 list 进行 APPEND
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(NoInSourceBuilds)

add_subdirectory(src bin)
add_subdirectory(test)

include(Install)
