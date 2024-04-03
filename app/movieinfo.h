///////////////////////////////////////////////////////////
// 			Long Fang Huang / Long Phuong Huynh			//
/////////////////////////////////////////////////////////

#ifndef MOVIEINFO_H
#define MOVIEINFO_H

#include <QObject>
#include <QUrl>
#include <QtQml/qqml.h>

class MovieInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int movieIndex READ movieIndex WRITE setMovieIndex NOTIFY movieIndexChanged)
    Q_PROPERTY(QString movieName READ movieName WRITE setMovieName NOTIFY movieNameChanged)
    Q_PROPERTY(QString movieSynopsis READ movieSynopsis WRITE setMovieSynopsis NOTIFY movieSynopsisChanged)
    Q_PROPERTY(QUrl imageSource READ imageSource WRITE setImageSource NOTIFY imageSourceChanged)
    Q_PROPERTY(QUrl videoSource READ videoSource WRITE setVideoSource NOTIFY videoSourceChanged)

public:
    explicit MovieInfo(QObject *parent = nullptr);

    int movieIndex() const;
    QString movieName() const;
    QString movieSynopsis() const;
    QUrl imageSource() const;
    QUrl videoSource() const;

    void setMovieIndex(int &movieIndex);
    void setMovieName(QString &movieName);
    void setMovieSynopsis(QString &movieSynopsis);
    void setImageSource(QUrl &imageSource);
    void setVideoSource(QUrl &videoSource);

signals:
    void movieIndexChanged(int movieIndex);
    void movieNameChanged(QString movieName);
    void movieSynopsisChanged(QString movieSynopsis);
    void imageSourceChanged(QUrl imageSource);
    void videoSourceChanged(QUrl videoSource);

private:
    int m_movieIndex;
    QString m_movieName;
    QString m_movieSynopsis;
    QUrl m_imageSource;
    QUrl m_videoSource;
};

#endif // MOVIEINFO_H
