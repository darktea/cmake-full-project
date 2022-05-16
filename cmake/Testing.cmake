# 在当前目录，及其子目录开启 CMake 的 CTest 功能
enable_testing()

# 准备获取外部依赖 googletest（使用 FetchContent 模块）
include(FetchContent)

# 获取外部依赖分 2 步。
# 第一步 Declare，并设置 option
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.11.0
)
# For Windows: Prevent overriding the parent project's
# compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
option(INSTALL_GMOCK "Install GMock" OFF)
option(INSTALL_GTEST "Install GTest" OFF)

# 第二步 获取、编译等工作
FetchContent_MakeAvailable(googletest)

include(GoogleTest)
include(Coverage)
include(Memcheck)

# 把可复用的部分用 macro 封装成一个 AddTest
macro(AddTests target)
  AddCoverage(${target})
  target_link_libraries(${target} PRIVATE gtest_main gmock)
  gtest_discover_tests(${target})
  AddMemcheck(${target})
endmacro()
