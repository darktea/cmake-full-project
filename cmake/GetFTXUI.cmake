# 当前在使用 CMake（3.14 版本之后）时，推荐使用 FetchContent 模块来引入外部项目
# FetchContent 是对原先的 ExternalProject 模块更好的封装

# Step1：使用 include 命令加载 FetchContent 模块
include(FetchContent)

# Step2：使用 FetchContent_Declare 配置要引入的依赖
FetchContent_Declare(
  FTXTUI
  GIT_REPOSITORY https://github.com/ArthurSonzogni/FTXUI.git
  GIT_TAG        v0.11
)

# 本例子中，还需要使用 option 命令关闭以下选项
option(FTXUI_ENABLE_INSTALL "" OFF)
option(FTXUI_BUILD_EXAMPLES "" OFF)
option(FTXUI_BUILD_DOCS "" OFF)

# Step3：使用 FetchContent_MakeAvailable 进行依赖的下载，构建，安装等工作
FetchContent_MakeAvailable(FTXTUI)
