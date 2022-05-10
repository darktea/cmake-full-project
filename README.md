# CMake Project Struct

展示了使用 cmake 管理的项目的一种常用结构。参考了：

clone from <https://github.com/PacktPublishing/Modern-CMake-for-Cpp>

## 需要安装的构建工具

需要构建成功，需要安装一下工具。例如在 Mac 环境可以使用 brew install：

```sh
brew install clang-format
brew install cppcheck
brew install Doxygen
brew install lcov
```

## 构建

```sh
cmake -B buildtree
cmake --build buildtree
```
