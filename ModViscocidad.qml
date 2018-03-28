
        import QtQuick 2.0
        import QtQuick.Controls 1.4
        import QtQuick.Layouts 1.3
       
        Item {
            id:xModViscocidad
            width: parent.width*0.7
            height: parent.height*0.9
            anchors.centerIn: parent
            onVisibleChanged: {
                if(visible){
                    setearUI()
                }
            }
            GroupBox {
                title: appSettings.idioma==='Español'? "Torque resistivo" : "Restitivo Torque"
                width: parent.width*0.7
                height: parent.height*0.9

       
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
                        Layout.preferredHeight: 150+app.fs
                        color: '#D8D8D8'
                        clip: true
                        Row{
                            spacing: 7
                            Column{
                                spacing: 16.5
                                Text{
                                    id:labelVDstring
                                    text: appSettings.idioma==='Español'? 'Diametro de <br> la Varilla': 'String Diameter'
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter

                                }
                                Text{
                                    id:labelVDi
                                    text: appSettings.idioma==='Español'? 'Diametro Interno': 'Internal Diameter'
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter

                                }
                                Text{
                                    id:labelV
                                    text: appSettings.idioma==='Español'? 'Viscosidad': 'Viscosity'
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter

                                }
                                Text{
                                    id:labelVTVD
                                    text: 'TVD'
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter

                                }
                                Text{
                                    id:labelVRPM
                                    text: 'RPM'
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter

                                }
                            }
                            Column{
                                spacing: 8
                                ComboBox{
                                    id: cbDstring
                                    model: [ '1 1/4', '1 1/8','1','5/8','7/8', 'Otro']
                                    width: xCrearInforme.width*0.7-labelLanguaje.contentWidth
                                    height: 30

                                }
                                ComboBox{
                                    id: cbDi
                                    model: [ '1.867','1.995','2.041','2.259','2.323','2.441','2.75','2.992','3.068','Otro']
                                    width: xCrearInforme.width*0.7-labelLanguaje.contentWidth
                                    height: 30

                                }
                                Rectangle{
                                      id:xV
                                      width: xVDstring.width-labelV.width
                                      height: 20
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
                                Rectangle{
                                   id:xTi4
                                   width: xVDstring.width-labelVTVD.width
                                   height: 20
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
                                Rectangle{
                                    id:xTi3
                                    width: xVDstring.width-labelVRPM.width
                                    height: 20
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
                            Column{
                                spacing: 12
                                Text{
                                    id:labelUnityDstring
                                    height:15
                                    font.pixelSize: 10
                                    verticalAlignment: Text.AlignVCenter

                                }
                                Text{
                                    id:labelUnityDi
                                    height:15
                                    font.pixelSize: 15
                                    verticalAlignment: Text.AlignVCenter

                                }
                                Text{
                                    id:labelUnityViscosity
                                    text: 'cp'
                                    height:15
                                    font.pixelSize: 15
                                    verticalAlignment: Text.AlignVCenter

                                }
                                Text{
                                    id:labelUnityTVD
                                    height:15
                                    font.pixelSize: 15
                                    verticalAlignment: Text.AlignVCenter

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
function setearUI(){
    if(appSettings.idioma==='Español'){
        labelSistemaActual.text='<b>Sistema Actual de Unidades: </b>'+appSettings.unidades
        labelUnityDstring.text = appSettings.unidades==='Sistema Ingles'? 'in': 'mm'
        labelUnityDi.text=appSettings.unidades==='Sistema Ingles'? 'in': 'mm'
        labelUnityTVD.text=appSettings.unidades==='Sistema Ingles'? 'ft': 'm'

    }else{
        labelSistemaActual.text='<b>Unity Current System: </b>'+appSettings.unidades
        labelUnityDstring.text = appSettings.unidades==='English System'? 'in': 'mm'
        labelUnityDi.text=appSettings.unidades==='English System'? 'in': 'mm'
        labelUnityTVD.text=appSettings.unidades==='English System'? 'ft': 'm'

    }
}
        }


     
