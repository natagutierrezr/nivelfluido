
       
       
        import QtQuick 2.0
        import QtQuick.Controls 2.0
       
        Item {
            id: xModIngresarDatos
            anchors.fill: parent
            onVisibleChanged: {
                if(visible){
                    setearUI()
                }
            }
            //property int currentIndex: 1
       
       
            Column{
       
       
                anchors.centerIn: parent
                spacing: 30
       
                Row{
                    spacing: app.fs
                    Text {
                        id: labelTorque
                        text:appSettings.idioma==='Español'? 'Torque total': 'Total Torque'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelTorque.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiTorque
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30

                        }
                    }
                    Text {
                        id: labelUnityTorque
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        //text: appSettings.unidades==='Sistema Ingles'? 'lb/ft': 'N/m'
                        height:30
                        font.pixelSize: app.fs
                    }
                }


                Row{
                    spacing: app.fs
                    Text {
                        id: labelTorqueFr
                        text:appSettings.idioma==='Español'? 'Torque de fricción':'Friction Torque'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelTorqueFr.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiTorqueFr
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                            anchors.centerIn: parent
                        }
                    }
                    Text {
                        id: labelUnityTorqueFr
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        //text: appSettings.unidades==='Sistema Ingles'? 'lb/ft': 'N/m'
                        height:30
                        font.pixelSize: app.fs
                    }
                }

                    Row{
                        spacing: app.fs
                        Text {
                            id: labelTorqueRe
                            text:appSettings.idioma==='Español'? 'Torque Resistivo':'Resistive Torque'
                            height:30
                            font.pixelSize: app.fs

                        }
                        Rectangle{
                            width: xModIngresarDatos.width*0.5-labelTorqueRe.contentWidth
                            height: 30
                            border.width: 1
                            clip: true
                            TextInput{
                                id: tiTorqueRe
                                width: parent.width*0.96
                                height: app.fs
                                font.pixelSize: app.fs
                                maximumLength: 30
                                anchors.centerIn: parent
                            }
                        }


                        Text {
                            id: labelUnityTorqueRe
                            //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                            //text: appSettings.unidades==='Sistema Ingles'? 'lb/ft': 'N/m'
                            height:30
                            font.pixelSize: app.fs
                        }
                    }
                    Row{
                        spacing: app.fs
                        Text {
                            id: labelTorqueHi
                            text:appSettings.idioma==='Español'? 'Torque Hidráulico':'Hydraulic Torque'
                            height:30
                            font.pixelSize: app.fs

                        }
                        Rectangle{
                            width: xModIngresarDatos.width*0.5-labelTorqueHi.contentWidth
                            height: 30
                            border.width: 1
                            clip: true
                            TextInput{
                                id: tiTorqueHi
                                width: parent.width*0.96
                                height: app.fs
                                font.pixelSize: app.fs
                                maximumLength: 30
                                anchors.centerIn: parent
                            }
                        }


                        Text {
                            id: labelUnityTorqueHi
                            //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                            //text: appSettings.unidades==='Sistema Ingles'? 'lb/ft': 'N/m'
                            height:30
                            font.pixelSize: app.fs
                        }
                    }


}

            //FALTA TIPO DE BOMBA
            /*Row{
                                        spacing: app.fs
                                        Button{
                                            id: btnCalcular
                                            text:appSettings.idioma==='Español'? 'Calcular': 'Calculate'
                                            height:30
                                            font.pixelSize: app.fs
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            onClicked: calcular()
                                        }
  
                                    }
                                }
                                Row{
                                    spacing: app.fs
                                    Text {
                                        id: txtResultadoProvisorio
                                        text: "Sin datos"
                                        height:30
                                        font.pixelSize: app.fs
                                    }
                                }
  
  
                            }
  
                            function calcular(){
                                //water/100*(fluido cm3*2)-(longitud1-longitud2)
                                var datoTiCHP = parseFloat(tiCHP.text)
                                var datoTiTHP = parseFloat(tiTHP.text)
                                var res1 = datoTiCHP+datoTiTHP
  
                                var resultadoFinal = res1//calcular todos los otros res1*( res2)/ res3
                                txtResultadoProvisorio.text='Se calculo CHP+THP='+resultadoFinal
                            }*/
       
            function setearUI(){
                if(appSettings.idioma==='Español'){
                    labelSistemaActual.text='<b>Sistema Actual de Unidades: </b>'+appSettings.unidades
                    labelUnityTorque.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                    labelUnityTorqueFr.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                    labelUnityTorqueRe.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                     labelUnityTorqueHi.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                }else{
                    labelSistemaActual.text='<b>Unity Current System: </b>'+appSettings.unidades
                    labelUnityTorque.text=appSettings.unidades==='English System'? 'Lb/ft': 'N/m'
                    labelUnityTorqueFr.text=appSettings.unidades==='English System'? 'Lb/ft': 'N/m'
                    labelUnityTorqueRe.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                    labelUnityTorqueHi.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                }
            }
        }
       
