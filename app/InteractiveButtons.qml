/*
This project is created by:
Long Fang Huang / Long Phuong Huynh
*/

import QtQuick 2.5

Image {
    id: root

    signal buttonClicked()
    property alias icon: root.source

    mipmap: true
    opacity: if (buttonMouseArea.containsMouse) {
                 return 0.75
             } else {
                 return 1
             }

    MouseArea {
        id: buttonMouseArea

        anchors.fill: parent

        hoverEnabled: true

        onClicked: {
            root.buttonClicked()
        }
    }
}
