# CMake Project Struct

展示了使用 cmake 管理的项目的一种常用项目结构。参考了：

clone from <https://github.com/PacktPublishing/Modern-CMake-for-Cpp>

## 构建工具

需要先安装相关的工具才能构建成功。例如在 Mac 环境可以使用 brew install：

```sh
brew install clang-format
brew install cppcheck
brew install Doxygen
brew install lcov
```

## 构建命令

```sh
cmake -B buildtree
cmake --build buildtree
```

## 项目结构

作为一个通用的项目模板，整个项目结构需要详细说明一下。

先介绍源代码目录 src 的结构：

```shell
├── src
│   ├── CMakeLists.txt
│   ├── calc
│   │   ├── CMakeLists.txt
│   │   ├── calc.cpp
│   │   └── include
│   │       └── calc
│   │           └── calc.h
│   └── calc_console
│       ├── CMakeLists.txt
│       ├── bootstrap.cpp
│       ├── include
│       │   └── tui.h
│       └── tui.cpp
```
