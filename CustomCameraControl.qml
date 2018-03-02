import QtQuick 2.9
import Qt3D.Core 2.0
import Qt3D.Input 2.0
import Qt3D.Render 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0
import QtQml 2.2
Entity {
    id: rootEnt
    property Camera camera
    property real lookSpeed: 200
    property real linearSpeed: 100
    QtObject{
        id: attrbutes
        property bool keyUpPressed: false
        property bool leftBtnPressed: false
        property real dx: 0.0
        property real dy: 0.0

    }

    KeyboardDevice{
        id: keyboardDevice
    }
    MouseDevice{
        id: mouseDevice
    }
    LogicalDevice{
        id: logicalDevice
        actions: [
            Action{
                inputs: [
                    ActionInput{
                        buttons: [Qt.Key_Up]
                        sourceDevice: keyboardDevice
                    }
                ]
                onActiveChanged: {
                    attrbutes.keyUpPressed = isActive
                }
            },
            Action{
                inputs: [
                    ActionInput{
                        buttons: [Qt.LeftButton]
                        sourceDevice: mouseDevice
                    }
                ]
                onActiveChanged: {
                    attrbutes.leftBtnPressed = isActive
                }
            }
        ]
    axes: [
        Axis{
            inputs: [
                AnalogAxisInput{
                    axis: MouseDevice.X
                    sourceDevice: mouseDevice
                }
            ]
            onValueChanged: {
                attrbutes.dx = value
            }
        },
        Axis{
            inputs: [
                AnalogAxisInput{
                    axis: MouseDevice.Y
                    sourceDevice: mouseDevice
                }
            ]
            onValueChanged: {
                attrbutes.dy = value
            }
        }
       ]

    }
    FrameAction{
        onTriggered: {
            if (attrbutes.leftBtnPressed == true){
                camera.panAboutViewCenter(attrbutes.dx * lookSpeed * dt * -1)
                camera.tiltAboutViewCenter(attrbutes.dy * lookSpeed * dt * -1)
            }
            if (attrbutes.keyUpPressed == true){
                camera.rollAboutViewCenter(0.5 * lookSpeed * dt)
            }

        }
    }
}
