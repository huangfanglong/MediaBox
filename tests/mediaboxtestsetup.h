#ifndef MEDIABOXTESTSETUP_H
#define MEDIABOXTESTSETUP_H

#include <QObject>

class QQmlEngine;

class MediaBoxTestSetup : public QObject
{
    Q_OBJECT

public:
   MediaBoxTestSetup();
   ~MediaBoxTestSetup() = default;

public slots:
   void qmlEngineAvailable(QQmlEngine* engine);

signals:

};

#endif // MEDIABOXTESTSETUP_H
