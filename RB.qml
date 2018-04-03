
        import QtQuick 2.0
       
        Item {
            id: raiz
            width: app.fs*3+txt.contentWidth
            height: app.fs
            property bool cheched: false
            property alias text: txt.text
            Row{
                spacing: app.fs
                height: raiz.height
                Text {
                    id: txt
                    font.pixelSize: app.fs
                    anchors.verticalCenter: parent.verticalCenter
                }
                Rectangle{
                    width: raiz.height
                    height: width
                    radius: width*0.5
                    border.width: 1
                    Rectangle{
                        width: parent.width*0.8
                        height: width
                        anchors.centerIn: parent
                        visible: raiz.cheched
                        radius: width*0.5
                        color: 'black'
       
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: raiz.cheched=true
                    }
                }
            }
       
       
        }
     