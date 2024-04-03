/*
This project is created by:
Long Fang Huang / Long Phuong Huynh
*/

import QtQuick 2.0
import QtQml 2.12
import QtMultimedia 5.12
import QtGraphicalEffects 1.0
import com.llr.PlayerController 1
import com.llr.MovieInfo 1

Item {
  id: movieInfoBoxRoot

    readonly property MovieInfo infoProvider: MovieInfo {}

    visible: PlayerController.currentMovieIndex == infoProvider.movieIndex

    x: (parent.width / 2 - width / 2) - 300
    y: 100

    Image {
        id: moviePosterImage
        source: infoProvider.imageSource

        width: 270
        height: 400

        anchors {
            top: parent.top
            left: movieInfoBoxRoot.left
        }
    }

    LinearGradient {
        id: mask
        anchors.fill: moviePosterImage

        start: Qt.point((moviePosterImage.width/2), 0)
        end: Qt.point((moviePosterImage.width/2), moviePosterImage.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.15; color: "transparent" }
            GradientStop { position: 0.85; color: "transparent" }
            GradientStop { position: 1.0; color: "black" }
        }
    }

    LinearGradient {
        id: mask2
        anchors.fill: moviePosterImage
        start: Qt.point(0,  (moviePosterImage.height/2))
        end: Qt.point(moviePosterImage.width,  (moviePosterImage.height/2))
        gradient: Gradient {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.15; color: "transparent" }
            GradientStop { position: 0.80; color: "transparent" }
            GradientStop { position: 0.9; color: "black" }
        }
    }

    Text {
        id: movieNameText
        text: infoProvider.movieName

        color: "white"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

    anchors {
        left: moviePosterImage.right
        leftMargin: 10
        right: movieInfoBoxRoot.right
    }

    font {
        pixelSize: 26
        bold: true
    }
  }

    Text {
        id: movieSynopsisText
        text: infoProvider.movieSynopsis

        color: "white"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        width: 450
        height: 140
        clip: true

        anchors {
            top: movieNameText.bottom
            topMargin: 5
            left: moviePosterImage.right
            leftMargin: 10
        }

    font {
        pixelSize: 15
    }
  }

  Row {
    id: interactiveButtons

    anchors {
        top: movieSynopsisText.bottom
        topMargin: 10
        left: moviePosterImage.right
        leftMargin: 10
        right: moviePosterImage.left
    }

    spacing: 20

    InteractiveButtons {
        id: previousButton

        width: 50
        height: 50
        icon: "qrc:/assets/images/buttons/backward.svg"

        onButtonClicked: PlayerController.switchToPrevious()

        Text {
            text: "Previous"
            color: "white"
            font {
                pixelSize: 13
                bold: true
            }

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
                topMargin: 2
            }
        }
    }

    InteractiveButtons {
        id: playPauseButton

        width: 50
        height: 50
        icon: PlayerController.playing ? "qrc:/assets/images/buttons/pause.svg" : "qrc:/assets/images/buttons/play.svg"

        onButtonClicked: {
            if (PlayerController.playing == false) {
                PlayerController.playPause();
                moviePlayer.visible = true;
                moviePlayer.playMovie();
                moviePlayer.visibility = "Maximized";
            } else {
                PlayerController.playPause();
                moviePlayer.visible = false;
                moviePlayer.pauseMovie();
            }
        }

        Text {
            text:  PlayerController.playing ? "Pause" : "Play"
            color: "white"
            font {
                pixelSize: 13
                bold: true
            }

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
                topMargin: 2
            }
        }
    }

    InteractiveButtons {
        id: nextButton

        width: 50
        height: 50
        icon: "qrc:/assets/images/buttons/forward.svg"

        onButtonClicked: PlayerController.switchToNext()

        Text {
            text: "Next"
            color: "white"
            font {
                pixelSize: 13
                bold: true
            }

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
                topMargin: 2
            }
        }
    }

    MoviePlayer {
        id: moviePlayer
        visible: false
        mediaSource: infoProvider.videoSource
    }
  }
}
