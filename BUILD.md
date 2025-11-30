# 如何构建此项目
你需要执行一下步骤来生成必要的依赖代码

1. 安装依赖
    ```shell
    flutter pub get
    ```
2. 生成必要依赖文件（JS相关）
使用base执行项目根目录下的`generate.sh`
    ```shell
    bash generate.sh
    ```
3. 生成代码
    ```shell
    flutter pub run build_runner build
    ```
    错误修复：Error: The method 'getInvocation' isn't defined for the type 'DartObjectImpl'
    Main problem is analyzer in version 8.4. you must downgrade to 8.3.
    ```shell
    dart pub downgrade analyzer
    ```
    重新执行上面命令

经过上面步骤后，你的项目就可以顺利编译了

记录一下问题：
1. media-kit: ad84c59faa2b871926cb31516bdeec65d7676884版本windows绑定20250514版本的libmpv-win32-video-cmake库缺少了必要的头文件 render_dxgi.h 导致无法编译