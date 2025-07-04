cmake_minimum_required(VERSION 3.16)

project(GcsVideoStream LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Qt6 패키지를 찾고, Quick과 Multimedia 컴포넌트를 요구
find_package(Qt6 6.2 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup()

# 실행 파일 정의
qt_add_executable(appGcsVideoStream
    main.cpp
)

# QML 모듈 정의
qt_add_qml_module(appGcsVideoStream
    URI GcsVideoStream
    VERSION 1.0
    QML_FILES Main.qml
)

# Qt 라이브러리 링크
target_link_libraries(appGcsVideoStream
    PRIVATE
    Qt6::Quick
    Qt6::Multimedia
)

install(TARGETS appGcsVideoStream
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
