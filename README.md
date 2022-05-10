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
