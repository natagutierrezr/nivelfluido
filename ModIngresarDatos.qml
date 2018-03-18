
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
            property int currentIndex: 1
//QUIERO QUE EL USUARIO SOLO PUEDA PRESIONAR UN BOTON
       Column{
           Column{
           spacing: 1
           RadioButton{
               id: buttonViscosity
               text: appSettings.idioma==='Español'? 'Viscosidad': 'Total Viscosity'
              /* onClicked: {

               }*/

           }
           /* QUIERO QUE SALGA ESTO AL PRESIONAR EL PRIMER BOTON
           Rectangle{
               width: xModIngresarDatos.width*0.5-buttonViscosity.contentWidth
               height: 30
               border.width: 1
               clip: true
               TextInput{
                   id: tiViscosity
                   width: parent.width*0.96
                   height: app.fs
                   font.pixelSize: app.fs
                   maximumLength: 3
                  }
             }

      }*/

      Column{
           RadioButton{
               id: buttonFindViscosity
               text: appSettings.idioma==='Español'? 'Hallar Viscosidad': 'Find Viscosity'
           }
           /*QUIERO QUE SALGA ESTO AL PRESIONAR EL SEGUNDO BOTON
           Row{
           Text {
               id: labelAPI
               text: "API"
               height:30
               font.pixelSize: 0

           }
                   Rectangle{
                       width: xModIngresarDatos.width*0.5-labelAPI.contentWidth
                       height: 30
                       border.width: 1
                       clip: true
                       TextInput{
                           id: tiAPI
                           width: parent.width*0.96
                           height: app.fs
                           font.pixelSize: app.fs
                           maximumLength: 30
                           anchors.centerIn: parent
                       }
                   }
           }
           Row{
                   Text {
                       id: labelTemperature
                       text: appSettings.idioma==='Español'? 'Temperature': 'Temperature'
                       height:30
                       font.pixelSize: app.fs

                   }
                           Rectangle{
                               width: xModIngresarDatos.width*0.5-labelTemperature.contentWidth
                               height: 30
                               border.width: 1
                               clip: true
                               TextInput{
                                   id: tiAPI
                                   width: parent.width*0.96
                                   height: app.fs
                                   font.pixelSize: app.fs
                                   maximumLength: 30
                                   anchors.centerIn: parent
                               }
                           }
              }

       }*/
       }
           }
       }


            Column{
       
       
                anchors.centerIn: parent
                spacing: 30

                Row{
                    spacing: app.fs
                    Text {
                        id: labelCHP
                        text: "CHP"
                        height:30
                        font.pixelSize: app.fs
       
                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelCHP.contentWidth
                        //width: 300
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiCHP
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                            anchors.centerIn: parent
                        }
                    }
                    Text {
                        id: labelUnityCHP
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        //text: appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                        height:30
                        font.pixelSize: app.fs
                    }
                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelTHP
                        text: "THP"
                        height:30
                        font.pixelSize: app.fs
       
                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelTHP.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiTHP
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                            anchors.centerIn: parent
                        }
                    }
                    Text {
                        id: labelUnityTHP
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        //text: appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                        height:30
                        font.pixelSize: app.fs
                    }
                }
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
                            anchors.centerIn: parent
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
                        text:appSettings.idioma==='Español'? 'Torque de fricción':'friction torque'
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
                        id: labelDensity
                        text:appSettings.idioma==='Español'? 'Densidad': 'Density'
                        height:30
                        font.pixelSize: app.fs
       
                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelDensity.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiDensity
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                            anchors.centerIn: parent
                        }
                    }
                    Text {
                        id: labelUnityDensity
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        text: appSettings.unidades==='Sistema Ingles'? 'lb/gal': 'kg/m3'
                        height:30
                        font.pixelSize: app.fs
                    }
                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelTVD
                        text: "TVD"
                        height:30
                        font.pixelSize: app.fs
       
                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelTVD.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                        }
                    }
                    Text {
                        id: labelUnityTVD
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        //text: appSettings.unidades==='Sistema Ingles'? 'ft': 'm'
                        height:30
                        font.pixelSize: app.fs
                    }
                }
       
                Row{
                    spacing: app.fs
                    Text {
                        id: labelCaudal
                        text:appSettings.idioma==='Español'? 'Caudal': 'Flow Rate'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelCaudal.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                        }
                    }

                    Text {
                        id: labelUnityCaudal
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        text: 'BFPD'
                        height:30
                        font.pixelSize: app.fs
                    }
                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelRPM
                        text:'RPM'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelRPM.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                        }
                    }

                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelBSW
                        text:'BSW'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xModIngresarDatos.width*0.5-labelBSW.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                        }
                    }
                    Text {
                        id: labelUnityBSW
                        //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                        text: '%'
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
                    labelUnityCHP.text = appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                    labelUnityTHP.text=appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                    labelUnityTVD.text=appSettings.unidades==='Sistema Ingles'? 'ft': 'm'
                    labelUnityTorque.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                     labelUnityTorqueFr.text=appSettings.unidades==='Sistema Ingles'? 'Lb/ft': 'N/m'
                }else{
                    labelSistemaActual.text='<b>Unity Current System: </b>'+appSettings.unidades
                    labelUnityCHP.text = appSettings.unidades==='English System'? 'Psi': 'Pa'
                    labelUnityTHP.text=appSettings.unidades==='English System'? 'Psi': 'Pa'
                    labelUnityTVD.text=appSettings.unidades==='English System'? 'ft': 'm'
                    labelUnityTorque.text=appSettings.unidades==='English System'? 'Lb/ft': 'N/m'
                    labelUnityTorqueFr.text=appSettings.unidades==='English System'? 'Lb/ft': 'N/m'
                }
            }
        }

