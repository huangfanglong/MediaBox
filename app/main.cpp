///////////////////////////////////////////////////////////
// 			Long Fang Huang / Long Phuong Huynh			//
/////////////////////////////////////////////////////////

#include "movieinfo.h"
#include "playercontroller.h"
#include <QIcon>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    app.setWindowIcon(QIcon(":/assets/images/n-alphabet-round-circle-icon.svg"));
    qmlRegisterSingletonType<PlayerController>("com.llr.PlayerController", 1, 0, "PlayerController", PlayerController::singleton_provider);
    qmlRegisterType<MovieInfo>("com.llr.MovieInfo", 1, 0, "MovieInfo"); // Qt 5.12 does not have QML_ELEMENT macro so we use this

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
