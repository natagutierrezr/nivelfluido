
        import QtQuick 2.0
        import QtQuick.Controls 2.0
        import Qt.labs.settings 1.0
       
        //unik.AppImage
       
        //La Sintàxis es la forma o la norma en que se deben escribir las lineas de còdigo para que sean vàlidas o funcionen.
        //Todo lo que se encuentra entre dos llaves lo podemos denominar o llamar BLOQUE DE CÒDIGO
        //QML està basado en el lenguaje de programaciòn JavaScript
        //Programaciòn Orientada a Objetos (POO)
        ApplicationWindow {
            id:app
            visible: true//El parametro de ApplicationWindow llamado visible espera un valor del tipo booleano: true o false
            width: 500
            height: 400
            title: 'Nivel de Fluidos'
            visibility: 'Maximized'
            onClosing: Qt.quit()
       
            property int fs: 14
       
            Settings{
                id: appSettings
                category: 'conf-appnf'
                property string idioma: 'Español'
                property string unidades: 'Sistema Ingles'
            }
       
            Rectangle{
                id: xApp
                width: 500
                height: 500
                //border.width: 1
                anchors.centerIn: parent
                clip: true
       
                Column{
                    width: parent.width
                    height: 80
                    spacing: 20

                    Row{
                    width: parent.width
                    //height: 30
                    Text {
                        id: elTexto
                        text:  !appSettings.idioma==='Español' ? 'Seleccionar Idioma' : 'Select Languaje'
                        height: cbIdioma.height
                        font.pixelSize: app.fs
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    ComboBox{
                        id: cbIdioma
                        model: ["Español", "English"]
                        width: parent.width-elTexto.contentWidth
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        onCurrentTextChanged: {
                              appSettings.idioma = currentText
                        }
                    }
                }
                    Text {
                        id: labelIdiomaActual
                        text:   appSettings.idioma==='Español' ?  'Idioma actual: <b>'+appSettings.idioma+'</b>' :  'Current Lanjuage: <b>'+appSettings.idioma+'</b>'
                        height: cbIdioma.height
                        font.pixelSize: app.fs
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Row{
                    width: paren.widht

                    Text {
                        id: elTextoU
                        text: 'seleccionar unidades'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        }
                    ComboBox {
                        id: cbUnidades
                        model: ['Sistema Ingles', 'Sistema Internacional']
                        width: parent.width-elTextoU.contentWidth
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        onCurrentTextChanged: {
                            appsettings.unidades = currentText
                        }
                    }
                    }

                }
            }
       
       
            MouseArea{//Cuando quieras lo borras y listo
                width: 300
                height: 300
                anchors.bottom: parent.bottom
                onDoubleClicked: Qt.quit()
            }
       
            Component.onCompleted: {
               if(appSettings.idioma==='Español'){
                    cbIdioma.currentIndex=0
               }else{
                    cbIdioma.currentIndex=1
               }
            }
        }
       
       
       
     
