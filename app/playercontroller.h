///////////////////////////////////////////////////////////
// 			Long Fang Huang / Long Phuong Huynh			//
/////////////////////////////////////////////////////////

#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

#include <iostream>
#include <QObject>
#include <QtQml/QtQml>
#include <QMediaPlayer>
#include <QtMultimediaWidgets>
#include <QVideoWidget>

class PlayerController : public QObject
{
    Q_OBJECT

    // Keyword WRITE is removed so that it is only writable from back-end codes and not from QML side
    Q_PROPERTY(int currentMovieIndex READ currentMovieIndex NOTIFY currentMovieIndexChanged)
    Q_PROPERTY(int movieCount READ movieCount NOTIFY movieCountChanged)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)

public:
    explicit PlayerController(QObject *parent = nullptr);
    ~PlayerController() {}

    static PlayerController* Instance();
    static QObject* singleton_provider(QQmlEngine* qmlEngine, QJSEngine* jsEngine);

    int currentMovieIndex() const;
    int movieCount() const;
    bool playing() const;

public slots:
    void switchToNext();
    void switchToPrevious();
    void playPause();
    void changeMediaSource(const QUrl &source);

signals:
    void currentMovieIndexChanged();
    void movieCountChanged();
    void playingChanged();

private:
    static std::unique_ptr<PlayerController> instance;
    int m_currentMovieIndex = 0;
    int m_movieCount = 9;
    bool m_playing = false;
    QMediaPlayer m_mediaPlayer;
    QVideoWidget m_videoWidget;
};

#endif // PLAYERCONTROLLER_H
