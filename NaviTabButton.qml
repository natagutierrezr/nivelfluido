import QtQuick 2.0
import QtQuick.Controls 2.0
TabButton {
    id: raiz
    enabled: false
    property color bg: "black"
    property color c: "white"
    background: Rectangle{
        implicitWidth: parent.width
        implicitHeight: parent.parent.height
        border.width: 1
        border.color: raiz.c
        color:raiz.bg
    }
    contentItem: Text {
        text: parent.text
        font: parent.font
        opacity: enabled ? 1.0 : 0.3
        color: raiz.c
        //color: parent.down ? "yellow" : "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //elide: Text.ElideRight
    }
}
