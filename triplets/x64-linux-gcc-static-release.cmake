set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)

set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_BUILD_TYPE release)

# toolchain specific settings
if(DEFINED ENV{CC})
    set(CMAKE_C_COMPILER "$ENV{CC}")
else()
    set(CMAKE_C_COMPILER "gcc")
endif()

if(DEFINED ENV{CXX})
    set(CMAKE_CXX_COMPILER "$ENV{CXX}")
else()
    set(CMAKE_CXX_COMPILER "g++")
endif()

set(CMAKE_EXE_LINKER_FLAGS "-static")
set(CMAKE_SHARED_LINKER_FLAGS "-static")

