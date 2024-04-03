#include "mediaboxtestsetup.h"
#include <QQmlEngine>

MediaBoxTestSetup::MediaBoxTestSetup()
{
}

void MediaBoxTestSetup::qmlEngineAvailable(QQmlEngine* engine)
{
    engine->addImportPath("qrc:/");
}
