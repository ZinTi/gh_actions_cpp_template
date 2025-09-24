set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)

# 注意 MinGW 不是使用 Windows 作为系统名称
set(VCPKG_CMAKE_SYSTEM_NAME MinGW)
set(VCPKG_BUILD_TYPE release)

# 明确设置工具链文件，避免vcpkg使用错误的检测逻辑
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/../toolchains/mingw.cmake")

# 设置编译器
if(DEFINED ENV{CC})
    set(CMAKE_C_COMPILER "$ENV{CC}")
else()
    set(CMAKE_C_COMPILER "x86_64-w64-mingw32-gcc")
endif()

if(DEFINED ENV{CXX})
    set(CMAKE_CXX_COMPILER "$ENV{CXX}")
else()
    set(CMAKE_CXX_COMPILER "x86_64-w64-mingw32-g++")
endif()

# 设置vcpkg特定的编译器变量
set(VCPKG_C_COMPILER "${CMAKE_C_COMPILER}")
set(VCPKG_CXX_COMPILER "${CMAKE_CXX_COMPILER}")

# 链接标志
set(CMAKE_EXE_LINKER_FLAGS "-static")
set(CMAKE_SHARED_LINKER_FLAGS "-static")

# 防止vcpkg错误地检测MSVC编译器
set(VCPKG_PLATFORM_TOOLSET "MinGW")