///////////////////////////////////////////////////////////
// 			Long Fang Huang / Long Phuong Huynh			//
/////////////////////////////////////////////////////////

#include "movieinfo.h"

MovieInfo::MovieInfo(QObject *parent) : QObject(parent)
{

}

int MovieInfo::movieIndex() const
{
    return m_movieIndex;
}

QString MovieInfo::movieName() const
{
    return m_movieName;
}

QString MovieInfo::movieSynopsis() const
{
    return m_movieSynopsis;
}

QUrl MovieInfo::imageSource() const
{
    return m_imageSource;
}

QUrl MovieInfo::videoSource() const
{
    return m_videoSource;
}

void MovieInfo::setMovieIndex(int &movieIndex)
{
    if (m_movieIndex == movieIndex)
        return;

    m_movieIndex = movieIndex;
    emit movieIndexChanged(m_movieIndex);
}

void MovieInfo::setMovieName(QString &movieName)
{
    if (m_movieName == movieName)
        return;

    m_movieName = movieName;
    emit movieNameChanged(m_movieName);
}

void MovieInfo::setMovieSynopsis(QString &movieSynopsis)
{
    if (m_movieSynopsis == movieSynopsis)
        return;

    m_movieSynopsis = movieSynopsis;
    emit movieSynopsisChanged(m_movieSynopsis);
}

void MovieInfo::setImageSource(QUrl &imageSource)
{
    if (m_imageSource == imageSource)
        return;

    m_imageSource = imageSource;
    emit imageSourceChanged(m_imageSource);
}

void MovieInfo::setVideoSource(QUrl &videoSource)
{
    if (m_videoSource == videoSource)
        return;

    m_videoSource = videoSource;
    emit videoSourceChanged(m_videoSource);
}
