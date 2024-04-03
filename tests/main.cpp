#include "mediaboxtestsetup.h"
#include "movieinfo.h"
#include "playercontroller.h"
#include <QtQuickTest/quicktest.h>
#include <QQmlApplicationEngine>

//QUICK_TEST_MAIN(example)

int main(int argc, char** argv)
{

    QApplication app(argc, argv);

    MediaBoxTestSetup setup;

    qmlRegisterSingletonType<PlayerController>("com.llr.PlayerController", 1, 0, "PlayerController", PlayerController::singleton_provider);
    qmlRegisterType<MovieInfo>("com.llr.MovieInfo", 1, 0, "MovieInfo"); // Qt 5.12 does not have QML_ELEMENT macro so we use this

    return quick_test_main_with_setup(argc, argv, "MediaBoxTests", ":/", &setup);
    return app.exec();
}
