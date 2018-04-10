
       
         
         
         
                import QtQuick 2.0
                import QtQuick.Controls 1.4
         
                Item {
                    id: xModOtros
                    anchors.fill: parent
                    clip:true
         
                    property alias valorCHP: tiCHP.text
                    property alias valorTHP: tiTHP.text
                    property alias valorTVD: tiTVD.text
                    property alias valorIntake: tiIntake.text
                    property alias valorDensity: tiDensity.text
                    property alias valorBomba1: cbBomba.currentText
                    property alias valorBomba2: cbBomba2.currentText
         
                    onVisibleChanged: {
                        if(visible){
                            setearUI()
                        }
                    }
         
         
         
                Row{
                    spacing:20
                    x:30
                    y:40
         
                    Column{
                        spacing: 20
                        x: 40
                        y: 40
                        Rectangle{
                            id: xRdatos1
                            width: xModOtros.width*0.4-labelCHP.contentWidth
                            height:120
                            border.width: 2
                            border.color: '#A4A4A4'
                            color: '#D8D8D8'
         
                            Row{
                                anchors.centerIn: parent
                                spacing: 30
         
                                Column{
                                    spacing: 10
                                    Text {
                                        id: labelCHP
                                        text: "CHP"
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                    Text {
                                        id: labelTHP
                                        text: "THP"
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                }
                                Column{
                                    spacing:10
                                    Rectangle{
                                        width: xRdatos1.width*0.5-labelCHP.contentWidth
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
                                    Rectangle{
                                        width: xRdatos1.width*0.5-labelTHP.contentWidth
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
                           }
                                Column{
                                    spacing:10
                                    Text {
                                        id: labelUnityCHP
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
                }
                                    Text {
                                        id: labelUnityTHP
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            }
                       }
         
                        Rectangle{
                            id: xRdatos2
                            width: xModOtros.width*0.4-labelCHP.contentWidth
                            height:170
                            border.width: 2
                            border.color: "#A4A4A4"
                            color: '#D8D8D8'
         
                            Row{
                                anchors.centerIn: parent
                                spacing: 30
         
                                Column{
                                    spacing: 20
                                    Text {
                                        id: labelTVD
                                        text: "TVD"
                                        height:30
                                        font.pixelSize: 12
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                    Text {
                                        id: labelIntake
                                        text: appSettings.idioma==='Español'? 'Profundidad de <br> la Bomba': 'Intake'
                                        height:30
                                        font.pixelSize: 12
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                    Text {
                                        id: labelBomba
                                        text: appSettings.idioma==='Español'? 'Bomba <br>(Sistema Metrico)': 'Pump <br> (Metric System)'
                                        height:30
                                        font.pixelSize: 12
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                   }
                                Column{
                                    spacing: 20
                                    Rectangle{
                                        width: xRdatos2.width*0.3
                                        height: 30
                                        border.width: 1
                                        clip: true
                                        TextInput{
                                            id: tiTVD
                                            width: parent.width*0.96
                                            height: app.fs
                                            font.pixelSize: app.fs
                                            maximumLength: 30
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Rectangle{
                                        width: xRdatos2.width*0.3
                                        height: 30
                                        border.width: 1
                                        clip: true
                                        TextInput{
                                            id: tiIntake
                                            width: parent.width*0.96
                                            height: app.fs
                                            font.pixelSize: app.fs
                                            maximumLength: 30
                                            anchors.centerIn: parent
                                        }
                                    }
                                   Row{
                                       spacing: 2
                                       ComboBox{
                                        id: cbBomba
                                        model: ['6' ,'10' ,'15' ,'20' ,'33' ,'43' ,'64' ,'85' ,'106EW' ,'120', '125', '127EW' ,'160' ,'200' , 'Otro']
                                        width: xRdatos2.width*0.15
                                        height: 30
         
         
                                    }
                                       ComboBox{
                                               id: cbBomba2
                                               model: [ '400','600','700','750','800','900','1000','1050','1200','1250','1400','1500','1600','1750','1800','2100','2400','2700', 'Otro']
                                               width: xRdatos2.width*0.15
                                               height: 30
         
         
                                           }
         
                                  }
                                }
                                Column{
                                    spacing: 20
                                Text {
                                        id: labelUnityTVD
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
                                     }
                                Text {
                                        id: labelUnityIntake
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
                                    }
                              }
         
         
         
                            }
         
                        }
                }
                        Rectangle{
                            id: xRdatos3
                            width: xModOtros.width*0.4-labelCHP.contentWidth
                            height:170
                            border.width: 2
                            border.color: '#A4A4A4'
                            color: '#D8D8D8'
         
                            Row{
                                anchors.centerIn: parent
                                spacing: 30
         
                                Column{
                                    spacing: 10
                                    Text {
                                        id: labelCaudal
                                        text:appSettings.idioma==='Español'? 'Caudal': 'Flow Rate'
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                    Text {
                                        id: labelBSW
                                        text:'BSW'
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                    Text {
                                        id: labelDensity
                                        text:appSettings.idioma==='Español'? 'Densidad': 'Density'
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
         
                                    }
                                    Text {
                                        id: labelPwf
                                        text:appSettings.idioma==='Español'? 'Pwf': 'BHP'
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter

                                    }
                                }
                                Column{
                                    spacing: 10
                                    Rectangle{
                                        width: xRdatos3.width*0.5
                                        height: 30
                                        border.width: 1
                                        clip: true
                                        TextInput{
                                            id: tiCaudal
                                            width: parent.width*0.96
                                            height: app.fs
                                            font.pixelSize: app.fs
                                            maximumLength: 30
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Rectangle{
                                                   width: xRdatos3.width*0.5
                                                   height: 30
                                                   border.width: 1
                                                   clip: true
                                                   TextInput{
                                                       id: tiBSW
                                                       width: parent.width*0.96
                                                       height: app.fs
                                                       font.pixelSize: app.fs
                                                       maximumLength: 2
                                                       anchors.centerIn: parent
                                                   }
                                               }
                                    Rectangle{
                                          width: xRdatos3.width*0.5
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
                                    Rectangle{
                                          width: xRdatos3.width*0.5
                                          height: 30
                                          border.width: 1
                                          clip: true
                                          TextInput{
                                              id: tiPwf
                                              width: parent.width*0.96
                                              height: app.fs
                                              font.pixelSize: app.fs
                                              maximumLength: 30
                                              anchors.centerIn: parent
                                          }
                                      }
                }
                                Column{
                                    spacing: 10
                                    Text {
                                        id: labelUnityCaudal
                                        text: 'BFPD'
                                        height:30
                                        font.pixelSize: app.fs
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    Text {
                                                          id: labelUnityBSW
                                                          text: '%'
                                                          height:30
                                                          font.pixelSize: app.fs
                                                          verticalAlignment: Text.AlignVCenter
                                                      }
                                    Text {
                                            id: labelUnityDensity
                                            height:30
                                            font.pixelSize: app.fs
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    Text {
                                            id: labelUnityPwf
                                            height:30
                                            font.pixelSize: app.fs
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                }
         
         
                            }
         
                        }
                }
                Timer{
                        id:timerTVD
                        running: true
                        repeat: true
                        interval: 250.
                        onTriggered: {
                            if(modViscosidad.getModo()===0){
                                tiTVD.enabled = true
                            }else{
                                tiTVD.text = ''+modViscosidad.getTVD()
                                tiTVD.enabled = false
                            }
                        }
                    }
                Component.onCompleted: {
                    app.objModOtros = xModOtros
                }



                function setCB1(t){
                    for(var i=0;i<cbBomba.count;i++){
                        if(cbBomba.model[i] === t){
                            cbBomba.currentIndex = i
                            break
                        }
                    }
                }
                function setCB2(t){
                    for(var i=0;i<cbBomba2.count;i++){
                        if(cbBomba2.model[i] === t){
                            cbBomba2.currentIndex = i
                            break
                        }
                    }
                }
         
                function calcular(){         
                    var v1 = cbDi.currentText.replace('EW','')
                    var v2 = cbDstring.currentText.replace('EW','')
         
                    var datoTiCHP = parseFloat(v1)
                    var datoTiTHP = parseFloat(v2)
                    var datoTiIntake = parseFloat (tiIntake.text)
                    var datoTiTVD = parseFloat (tiTVD.text)
                    var datoTiPump = parseFloat (tiPump.text)
                    var datoCaudal = parseFloat (tiCaudal.text)
                    var datoBSW = parseFloat (tiBSW.text)
                    var datoDensity = paseFloat (tiDensity.text)
       
       
                    var resDeltaP = modIngresarDatos.getTHi()/(0.0897*((datoTiPump*6.28)/100))
                    var resPOil = datoTiTVD*0.433*(1-datoBSW)*(datoDensity/8.33)
                    var resPWater = datoTiTVD*0.433*datoBSW
                    var resPLiq = resPOil+resPWater
                    var resPDescarga = datoTiTHP + resPLiq
                    var resPfluid = resPDescarga - datoTiCHP - resDeltaP
                    var resSumergencia = resPfluid/(0.052*resPfluid)
       
                    var resNivelFluido = datoTiTVD - resSumergencia
       
       
                }
       
         
         
         

         
                    function setearUI(){
                        if(appSettings.idioma==='Español'){
                            labelSistemaActual.text='<b>Sistema Actual de Unidades: </b>'+appSettings.unidades
                            labelUnityCHP.text = appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                            labelUnityTHP.text=appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                            labelUnityTVD.text=appSettings.unidades==='Sistema Ingles'? 'ft': 'm'
                            labelUnityDensity.text=appSettings.unidades==='Sistema Ingles'? 'Lb/gal': 'Kg/m3'
                            labelUnityIntake.text=appSettings.unidades==='Sistema Ingles'? 'ft': 'm'
                            labelUnityPwf.text=appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                        }else{
                            labelSistemaActual.text='<b>Unity Current System: </b>'+appSettings.unidades
                            labelUnityCHP.text = appSettings.unidades==='English System'? 'Psi': 'Pa'
                            labelUnityTHP.text=appSettings.unidades==='English System'? 'Psi': 'Pa'
                            labelUnityTVD.text=appSettings.unidades==='English System'? 'ft': 'm'
                            labelUnityDensity.text=appSettings.unidades==='English System'? 'Lb/gal': 'Kg/m3'
                            labelUnityPwf.text=appSettings.unidades==='English System'? 'Psi': 'Pa'
                        }
                    }
                    Button{
                        id: botOK
                        text:'OK'
                        anchors.right: parent.right
                        anchors.rightMargin: app.fs
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: app.fs
                        /*onClicked: {
                            CHECKEAR LOS DATOS
                        }*/
                    }
                }
           
