# vcpkg-prebuilt

## 一、简介

GitHub Actions​​ 自动化构建 C++ 第三方库。

只负责构建 static Release 库，不构建 dynamic Debug 库。

平台矩阵：`Windows + MSVC`，`Windows + MINGW64`，`Linux + GCC`，`Linux + Clang`。

将第三方库编译剥离为独立仓库的解决方案。在其他仓库中复用本仓库编译后的结果。

## 二、列表

- gRPC (protobuf)
- OpenSSL
- Qt
- Boost-uuid
- SQLite
- yaml-cpp
  
### 三、命名格式

打包编译后的压缩包发布在 Release 页面。

Release Package Naming Format：
```plaintext
<name>-[component]-v<semantic version>-<date build number>.<daily iteration number>-<platform>-<architecture>-<toolchain>.<extension>

<库名>-[组件]-v<语义化版本>-<日期构建号>.<日迭代号>-<平台>-<架构>-<工具链>.<包扩展名>

Windows 平台使用 7z 格式发布，GNU/Linux 平台使用 tar.xz 格式发布，扩展名与格式一致。
```
  
Examples:
```plaintext
boost-uuid-v1.88.0-20250927.1-linux-x86_x64-gcc.tar.xz
openssl-v3.5.0-20250927.2-windows-x86_x64-mingw.7z
```

### 四、项目结构

参考结构，请以实际为准：
```bash
vcpkg-prebuilt-repo/
├── .github/
│   ├── workflows/
│   │   ├── build-dependencies.yml    # 主构建工作流
│   │   └── trigger-build.yml         # 手动触发工作流
│   └── scripts/
│       ├── setup-environment.sh      # 环境设置脚本
│       ├── build-library.sh          # 库构建脚本
│       └── package-release.sh        # 打包脚本
├── configs/
│   ├── grpc-config.json              # gRPC 特定配置
│   ├── openssl-config.json           # OpenSSL 特定配置
│   └── ...                           # 其他库配置
└── README.md                         # 项目说明文档

vcpkg-prebuilt-repo/
├── .github/
│   ├── workflows/
│   │   ├── build-dependencies.yml     # 主工作流
│   │   └── trigger-build.yml          # 手动触发
│   └── scripts/
│       ├── setup-vcpkg.sh            # vcpkg 环境设置
│       ├── build-with-vcpkg.sh       # vcpkg 构建包装
│       ├── custom-patches/           # 自定义补丁
│       └── package-release.sh        # 打包脚本
├── triplets/
│   ├── x64-linux-release.cmake       # Linux GCC 配置
│   ├── x64-linux-clang-release.cmake # Linux Clang 配置
│   ├── x64-windows-msvc-release.cmake # Windows MSVC
│   └── x64-windows-mingw-release.cmake # Windows MinGW
├── vcpkg-config/
│   ├── versions/                     # 版本锁定文件
│   └── overlays/                     # 自定义端口
└── README.md
```

### 五、注意事项
github actions 存储容量限制。分步骤，减少并发线程数，动态清理，以优化磁盘空间。

手动选择触发要构建的库，如 boost-uuid，sqlite3 等。

构建完成后及时下载并发布到 Release 页面。

### 六、其他
无。
