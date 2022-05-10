## 检查当前系统的 Cmake 版本
## 同时也会调用 cmake_policy 命令来检查当前的 policy 是否兼容
cmake_minimum_required(VERSION 3.20.0)

## 设置 3 个属性：
## 1）Project 的名字（Calc）
## 2）项目版本
## 3）项目的语言。例如：CXX，C
project(Calc VERSION 1.0.0 LANGUAGES CXX)

## CMAKE_MODULE_PATH 被设置为 cmake 脚本所在的目录：工程顶级目录下的 cmake 子目录
## CMAKE_SOURCE_DIR 实际上就是当前项目的「顶级目录」
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(NoInSourceBuilds)

add_subdirectory(src bin)
add_subdirectory(test)

include(Install)
