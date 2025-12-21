cmake_minimum_required(VERSION 3.16)

project(main VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 启用QML语言服务器支持
set(QT_QML_GENERATE_QMLLS_INI ON)

# 禁用Vulkan以避免"Could NOT find WrapVulkanHeaders"警告
set(QT_NO_VULKAN TRUE)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appmain
    main.cpp
)

qt_add_qml_module(appmain
    URI main
    QML_FILES
        Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appmain PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appmain
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appmain
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appmain
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)