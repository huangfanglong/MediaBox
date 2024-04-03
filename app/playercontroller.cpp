///////////////////////////////////////////////////////////
// 			Long Fang Huang / Long Phuong Huynh			//
/////////////////////////////////////////////////////////

#include "playercontroller.h"
#include <QtMultimedia>

std::unique_ptr<PlayerController> PlayerController::instance = nullptr;

PlayerController::PlayerController(QObject *parent) : QObject(parent)
{

}

QObject* PlayerController::singleton_provider(QQmlEngine* qmlEngine, QJSEngine* jsEngine)
{
   Q_UNUSED(qmlEngine);
   Q_UNUSED(jsEngine);
   return Instance();
}

PlayerController* PlayerController::Instance()
{
    if(!instance){
        instance = std::unique_ptr<PlayerController>(new PlayerController());
    }
    return instance.get();
}

void PlayerController::switchToNext()
{
    m_playing = false;
    if (m_currentMovieIndex + 1 >= m_movieCount) {
        m_currentMovieIndex = 0;
    } else {
        m_currentMovieIndex++;
    }

    emit playingChanged();
    emit currentMovieIndexChanged();
}

void PlayerController::switchToPrevious()
{
    m_playing = false;
    if (m_currentMovieIndex > 0)
    {
        m_currentMovieIndex--;
    } else {
        m_currentMovieIndex = m_movieCount - 1;
    }

    emit playingChanged();
    emit currentMovieIndexChanged();
}

void PlayerController::playPause()
{
    m_playing = !m_playing;
    emit playingChanged();

//    if(m_playing == true) {
//        m_mediaPlayer.play();
//    } else {
//        m_mediaPlayer.pause();
//    }
}

void PlayerController::changeMediaSource(const QUrl &source)
{
    m_mediaPlayer.stop();
    m_mediaPlayer.setMedia(source);

    if(m_playing == true) {
        m_mediaPlayer.play();
    }

//    if(QMediaPlayer::State == QMediaPlayer::StoppedState) {
//        m_mediaPlayer.play();
//    }
}

int PlayerController::currentMovieIndex() const
{
    return m_currentMovieIndex;
}

int PlayerController::movieCount() const
{
    return m_movieCount;
}

bool PlayerController::playing() const
{
    return m_playing;
}
