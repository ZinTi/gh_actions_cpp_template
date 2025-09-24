set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)

set(VCPKG_CMAKE_SYSTEM_NAME Windows)
set(VCPKG_BUILD_TYPE release)

# MSVC静态链接设置
set(VCPKG_PLATFORM_TOOLSET "v143")

# 对于静态CRT，需要设置这些标志
set(VCPKG_ENV_PASSTHROUGH_UNTRACKED "CL")
set(VCPKG_C_FLAGS "/MT")
set(VCPKG_CXX_FLAGS "/MT")

# 禁用vcpkg的自动编译器检测，使用环境变量
if(DEFINED ENV{CC})
    set(CMAKE_C_COMPILER "$ENV{CC}")
endif()

if(DEFINED ENV{CXX})
    set(CMAKE_CXX_COMPILER "$ENV{CXX}")
endif()