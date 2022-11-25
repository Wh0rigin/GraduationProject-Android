## flutter项目 部署 
---


1. flutter环境搭建

    要运行flutter程序首先你需要准备以下开发环境
    - flutter sdk
    - Android SDK
    - Chrome
    - Visual Studio develop for windows
    - Android Studio
    - IntelliJ IDEA

    在安装完flutter SDK后可以通过flutter doctor命令测试环境是否搭建成功。

2. 在flutter项目的lib/config文件下修改你的服务器IP

3. 进入powershell运行
    ```
    flutter run -d (设备名)
    ```
    设备名通过命令查询
    ```
    flutter devices
    ```