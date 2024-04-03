import QtQuick 2.5
import QtTest 1.12

Image {
    id: imageObject

    signal buttonClicked()
    property alias icon: imageObject.source

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
            imageObject.buttonClicked()
        }
    }

    TestCase {
        id: intButtonTestCase
        name: "InteractiveButtonsTest"

        when: windowShown
        function test_OpacityBehavior() {
            // Verify the default opacity
            verify(imageObject.opacity === 1)

            buttonMouseArea.pressAndHold(mousePress(buttonMouseArea))
            verify(imageObject.opacity === 0.75)
        }

        SignalSpy {
            id: spy
            target: imageObject
            signalName: "buttonClicked"
        }

        function test_ButtonClickedSignal() {
            compare(spy.count, 0)
            imageObject.buttonClicked();
            compare(spy.count, 1)
        }
    }

}
