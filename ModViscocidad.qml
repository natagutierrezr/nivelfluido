
        import QtQuick 2.0
        import QtQuick.Controls 1.4
        import QtQuick.Layouts 1.3
       
        Item {
            id:xModViscocidad
            width: parent.width*0.5
            height: parent.height*0.9
            anchors.centerIn: parent
            GroupBox {
                title: appSettings.idioma==='Español'? "Torque resistivo" : "Restitivo Torque"
       
                ColumnLayout {
                    ExclusiveGroup { id: tabPositionGroup }
                    RadioButton {
                        id: rb1
                        text: appSettings.idioma==='Español'? "Viscocidad < 1000 cp" : "Viscocity < 1000 cp"
                        checked: true
                        exclusiveGroup: tabPositionGroup
                    }

                    RadioButton {
                        id: rb2
                        text: appSettings.idioma==='Español'? "Viscocidad > 1000 cp" : "Find Viscocity > 1000 cp"
                        exclusiveGroup: tabPositionGroup
                    }
                    Rectangle{
                        id:xVDstring
                        visible: rb2.checked
                        Layout.preferredWidth: xModViscocidad.width*0.8-rb1.width
                        Layout.preferredHeight: 90+app.fs
                        //border.width: 1
                        clip: true
                        Column{
                            spacing: app.fs
                            Row{
                                spacing: 5
                                Text{
                                    id:labelVDstring
                                    text: appSettings.idioma==='Español'? 'Diametro de la Varilla': 'String Diameter'
                                    font.pixelSize: 10
                                    anchors.verticalCenter: xTi1.verticalCenter

                                }
                                ComboBox{
                                    id: cbDstring
                                    model: [ '1 1/4', '1 1/8','1','5/8','7/8', 'Otro']
                                    width: xCrearInforme.width*0.7-labelLanguaje.contentWidth
                                    height: 15
                                    onCurrentTextChanged: {
                                        appSettings.idioma = currentText
                                    }
                                }
                                Text{
                                    id:labelUnityDe
                                    height:15
                                    font.pixelSize: 10

                                }
                            }
                            Row{
                                spacing: 5
                                Text{
                                    id:labelVDi
                                    text: appSettings.idioma==='Español'? 'Diametro Interno': 'Internal Diameter'
                                    font.pixelSize: 10
                                    anchors.verticalCenter: xTi2.verticalCenter

                                }
                                Rectangle{
                                    id:xTi2
                                    width: xVDstring.width-labelVDi.width
                                    height: 15
                                    border.width: 1
                                    clip: true
                                    TextInput{
                                        id: tiDi
                                        width: parent.width*0.96
                                        height: app.fs
                                        font.pixelSize: app.fs
                                        anchors.centerIn: parent
                                        maximumLength: 5
                                    }
                                }
                            }
                            Row{
                                spacing: 5
                                Text{
                                    id:labelVRPM
                                    text: 'RPM'
                                    font.pixelSize: 10
                                    anchors.verticalCenter: xTi2.verticalCenter

                                }
                                Rectangle{
                                    id:xTi3
                                    width: xVDstring.width-labelVRPM.width
                                    height: 15
                                    border.width: 1
                                    clip: true
                                    TextInput{
                                        id: tiRPM
                                        width: parent.width*0.96
                                        height: app.fs
                                        font.pixelSize: app.fs
                                        anchors.centerIn: parent
                                        maximumLength: 5
                                    }
                                }
                            }
                            Row{
                                spacing: 5
                                Text{
                                    id:labelV
                                    text: appSettings.idioma==='Español'? 'Viscosidad': 'Viscosity'
                                    font.pixelSize: 10
                                    anchors.verticalCenter: xTi2.verticalCenter

                                }
                                Rectangle{
                                    id:xV
                                    width: xVDstring.width-labelV.width
                                    height: 15
                                    border.width: 1
                                    clip: true
                                    TextInput{
                                        id: tiViscosity
                                        width: parent.width*0.96
                                        height: app.fs
                                        font.pixelSize: app.fs
                                        anchors.centerIn: parent
                                        maximumLength: 5
                                    }
                                }
                            }
                            Row{
                                spacing: 5
                                Text{
                                    id:labelVTVD
                                    text: 'TVD'
                                    font.pixelSize: 10
                                    anchors.verticalCenter: xTi2.verticalCenter

                                }
                                Rectangle{
                                    id:xTi4
                                    width: xVDstring.width-labelVTVD.width
                                    height: 15
                                    border.width: 1
                                    clip: true
                                    TextInput{
                                        id: tiTVD
                                        width: parent.width*0.96
                                        height: app.fs
                                        font.pixelSize: app.fs
                                        anchors.centerIn: parent
                                        maximumLength: 5
                                    }
                                }
                            }
                        }
                    }
                }
            }
       

function calcular(){
            var datoTiDi = parseFloat(tiDi.text)
            var datoTiDe = parseFloat(tiDe.text)
            var datoTiViscosity = parseFloat(tiViscosity.text)
            var datoTiRPM = parseFloat(tiRPM.text)
            var datoTiTVD = parseFloat(tiTVD.text)
            var res1 = ((2.39*10^-8)*datoTiViscosity^3*datoTVD*datoTiRPM*DatoTiDe)/(DatoDi-DatoDe) //REVISAR ECUACION

            }
        }


     
