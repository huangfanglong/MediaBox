/*
This project is created by:
Long Fang Huang / Long Phuong Huynh

This file is created with the help of Richard Taylor
*/

import QtQuick 2.12
import QtQuick.Layouts 1.1
import com.llr.PlayerController 1.0

Rectangle {
  id: movieSelectorFlowRoot
  property alias firstMovieImage: firstMovie.source
  property alias secondMovieImage: secondMovie.source
  property alias thirdMovieImage: thirdMovie.source
  property alias fourthMovieImage: fourthMovie.source
  property alias fifthMovieImage: fifthMovie.source
  property alias sixthMovieImage: sixthMovie.source
  property alias seventhMovieImage: seventhMovie.source
  property alias eighthMovieImage: eighthMovie.source
  property alias ninthMovieImage: ninthMovie.source
  color: "black"

  x: (parent.width / 2 - width / 2) - 1600
  y: -10

  Flow {
    x: 575
    y: 600
    visible: true

    spacing: 20
    Image {
      id: firstMovie

      width: 202
      height: 300
    }
    Image {
      id: secondMovie

      width: 202
      height: 300
    }
    Image {
      id: thirdMovie

      width: 202
      height: 300
    }
    Image {
      id: fourthMovie

      width: 202
      height: 300
    }
    Image {
      id: fifthMovie

      width: 202
      height: 300
    }
    Image {
      id: sixthMovie

      width: 202
      height: 300
    }
    Image {
      id: seventhMovie

      width: 202
      height: 300
    }
    Image {
      id: eighthMovie

      width: 202
      height: 300
    }
    Image {
      id: ninthMovie

      width: 202
      height: 300
    }
  }
}
