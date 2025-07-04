//C++ 코드는 QML 엔진을 실행시키는 역할만
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // QML 로딩 실패 시 앱 종료 처리
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    // 기존의 url 로드 방식 대신 loadFromModule 사용
    // 파라미터 1: CMake에서 지정한 URI [GcsVideoStream]
    // 파라미터 2: 불러올 QML 컴포넌트 이름 [Main](Main.qml 파일)
    engine.loadFromModule("GcsVideoStream", "Main");

    return app.exec();
}
