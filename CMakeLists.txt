cmake_minimum_required(VERSION 3.16)

project(PageTurnerEditor VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)



qt_add_executable(appPageTurnerEditor
    main.cpp
)

qt_add_qml_module(appPageTurnerEditor
    URI PageTurnerEditor
    VERSION 1.0

    RESOURCES
    Assets/LeftToolbar/icons/selectBtnIcon.png
    Assets/LeftToolbar/icons/boxSelectBtnIcon.png
    Assets/LeftToolbar/icons/drawRectBtnIcon.png
    Assets/LeftToolbar/icons/drawElipseBtnIcon.png
    Assets/LeftToolbar/icons/drawLineBtnIcon.png
    Assets/LeftToolbar/icons/drawPoygonBtnIcon.png
    Assets/LeftToolbar/icons/drawTextBtnIcon.png
    Assets/LeftToolbar/icons/addImageBtnIcon.png
    Assets/LeftToolbar/icons/addAudioBtnIcon.png
    Assets/LeftToolbar/icons/addVideoBtnIcon.png
    Assets/LeftToolbar/icons/addGifBtnIcon.png
    Assets/LeftToolbar/icons/addQABtnIcon.png
    Assets/LeftToolbar/icons/showGridBtnIcon.png
    Assets/LeftToolbar/icons/showRulerBtnIcon.png
    Assets/LeftToolbar/icons/previewBtnIcon.png
    Assets/LeftToolbar/icons/showLayersBtnIcon.png
    Assets/LeftToolbar/icons/showPropertiesBtnIcon.png
    Assets/PageView/cursorXTracker.png
    Assets/PageView/cursorYTracker.png



    QML_FILES Main.qml
    QML_FILES LeftToolbar.qml
    QML_FILES RightSeperator.qml
    QML_FILES ToolbarBtn.qml
    QML_FILES Statusbar.qml
    QML_FILES TopSeperator.qml
    QML_FILES PageView.qml
    QML_FILES LayersPanel.qml
    QML_FILES PropertiesPanel.qml
    QML_FILES LeftSeperator.qml
    QML_FILES ProjectPage.qml
    QML_FILES BottomSeperator.qml
    QML_FILES CurrentPageLabel.qml
    QML_FILES MainMenubar.qml
    QML_FILES PageViewRightButtonMenu.qml
    QML_FILES PageViewRuler.qml
    QML_FILES PageViewGrid.qml
    QML_FILES SelectionBox.qml
    QML_FILES SelectPagePanel.qml


)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPageTurnerEditor PROPERTIES

    MACOSX_BUNDLE_GUI_IDENTIFIER tec.mlab.PageTurnerEditor
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)


target_link_libraries(appPageTurnerEditor
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPageTurnerEditor
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
