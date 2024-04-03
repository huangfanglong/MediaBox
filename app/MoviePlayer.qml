/*
This project is created by:
Long Fang Huang / Long Phuong Huynh
*/

import QtQuick 2.0
import QtQml 2.12
import QtMultimedia 5.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import com.llr.PlayerController 1
import com.llr.MovieInfo 1

Window {
    id: moviePlayerScreen

    property alias mediaSource: mediaplayer.source
    property int currentDuration: 0

    color: "black"

    MediaPlayer {
        id: mediaplayer
    }

    VideoOutput {
        id: videooutput
        anchors.fill: parent
        source: mediaplayer
    }

    MouseArea {
        id: playArea
        anchors.fill: parent

        onDoubleClicked: {
            if (PlayerController.playing == true) {
                PlayerController.playPause();
            }
            currentDuration = mediaplayer.position;
            mediaplayer.pause();
            moviePlayerScreen.close();
        }

        onClicked: {
            if (playbackControl.opacity === 0) {
                playbackControl.opacity = 0.7;
            } else {
                playbackControl.opacity = 0;
            }
        }
    }

    ////////////////////////
    // Playback Controls///
    //////////////////////
    Rectangle {
        id: playbackControl

        color: "grey"
        width: parent.width

        Behavior on opacity { NumberAnimation {duration: 300} }

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: mediaTime
            Layout.minimumWidth: 50
            Layout.minimumHeight: 18
            horizontalAlignment: Text.AlignRight
            color: "white"
            anchors.right: parent.right
            anchors.rightMargin: 10
            text: {
                    var m = Math.floor(mediaplayer.position / 60000) // Calculates the minutes by dividing the position by 60,000 milliseconds then round down
                    var ms = (mediaplayer.position / 1000 - m * 60).toFixed(1) // Calculates the seconds (ms) by subtracting the whole minutes (multiplied by 60 seconds) from the total position, converting the result to seconds, and formatting it to have one decimal place using toFixed(1).
                    return `${m}:${ms.padStart(4, 0)}` // Returns the formatted playtime string in the format m:ss.s. padStart(4, 0) padded the string with leading zeroes
            }
        }

        Slider {
            id: mediaSlider
            Layout.fillWidth: true
            width: parent.width

            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.bottom: parent.bottom

            enabled: mediaplayer.seekable
            to: 1.0
            value: mediaplayer.position / mediaplayer.duration
            onMoved: {
                mediaplayer.seek(value * mediaplayer.duration);
            }
        }

        Row {
            id: playbackControlButtons

            anchors.bottom: mediaSlider.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: mediaSlider.horizontalCenter

            spacing: 10

            InteractiveButtons {
                id: playPauseButton2

                width: 45
                height: 45
                icon: PlayerController.playing ? "qrc:/assets/images/buttons/pause.svg" : "qrc:/assets/images/buttons/play.svg"

                onButtonClicked: {
                    if (PlayerController.playing == false) {
                        PlayerController.playPause();
                        if (currentDuration > 0) {
                            mediaplayer.seek(currentDuration);
                        }
                        mediaplayer.play();
                    } else {
                        currentDuration = mediaplayer.position;
                        PlayerController.playPause();
                        mediaplayer.pause();
                    }
                }
            }

            InteractiveButtons {
                id: stopButton

                width: 45
                height: 45
                icon: "qrc:/assets/images/buttons/stop.svg"

                onButtonClicked: {
                    if (PlayerController.playing == true) {
                        PlayerController.playPause();
                    }
                    currentDuration = mediaplayer.position;
                    mediaplayer.pause();
                    moviePlayerScreen.close();
                }
            }
        }

        InteractiveButtons {
            id: maximizeButton

            width: 35
            height: 35
            icon: "qrc:/assets/images/buttons/maximize.svg"

            anchors.bottom: mediaSlider.bottom
            anchors.bottomMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 5

            onButtonClicked: {
                if (moviePlayerScreen.visibility !== "FullScreen") {
                    moviePlayerScreen.visibility = "FullScreen";
                } else if (moviePlayerScreen.visibility === "FullScreen") {
                    moviePlayerScreen.visibility = "Maximized";
                }
            }
        }
    }
    //////////////////////

    function playMovie() {
        mediaplayer.play()
    }

    function pauseMovie() {
        mediaplayer.pause()
    }
}

