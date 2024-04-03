import QtQuick 2.5
import QtTest 1.12
import QtQml 2.12
import QtMultimedia 5.12
import QtGraphicalEffects 1.0
import com.llr.PlayerController 1.0
import com.llr.MovieInfo 1.0

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

  TestCase {
    name: "MovieBoxTest"
    when: windowShown
    SignalSpy {
      id: nextButtonSpy
      target: nextButton
      signalName: "buttonClicked"
    }

    SignalSpy {
      id: previousButtonSpy
      target: previousButton
      signalName: "buttonClicked"
    }

    SignalSpy {
      id: playPauseButtonSpy
      target: playPauseButton
      signalName: "buttonClicked"
    }

    function test_nextButtonClickedSignal() {
      compare(nextButtonSpy.count, 0)
      nextButton.buttonClicked()
      compare(nextButtonSpy.count, 1)
    }

    function test_previousButtonClickedSignal() {
      compare(previousButtonSpy.count, 0)
      previousButton.buttonClicked()
      compare(previousButtonSpy.count, 1)
    }

    function test_playPauseButtonClicked() {
      compare(playPauseButtonSpy.count, 0)
      verify(playPauseButton.icon == "qrc:/assets/images/buttons/play.svg")
      verify(PlayerController.playing == false)
      playPauseButton.buttonClicked()
      compare(playPauseButtonSpy.count, 1)
      verify(playPauseButton.icon == "qrc:/assets/images/buttons/pause.svg")
      verify(PlayerController.playing == true)
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
          PlayerController.playPause()
          moviePlayer.visible = true
          moviePlayer.playMovie()
          moviePlayer.visibility = "Maximized"
        } else {
          PlayerController.playPause()
          moviePlayer.visible = false
          moviePlayer.pauseMovie()
        }
      }

      Text {
        text: PlayerController.playing ? "Pause" : "Play"
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
  }
}
