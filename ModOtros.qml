


import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: xModIngresarDatos
    anchors.fill: parent
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
            width: xModIngresarDatos.width*0.4-labelCHP.contentWidth
            height:120
            border.width: 2
            border.color: '#A4A4A4'
            color: '#D8D8D8'

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
                    Text {
                        id: labelUnityCHP
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
                    Text {
                        id: labelUnityTHP
                        height:30
                        font.pixelSize: app.fs
                    }
                }
            }
        }
        Rectangle{
            id: xRdatos2
            width: xModIngresarDatos.width*0.4-labelCHP.contentWidth
            height:170
            border.width: 2
            border.color: "#A4A4A4"
            color: '#D8D8D8'

            Column{
                anchors.centerIn: parent
                spacing: 30

                Row{
                    spacing: app.fs
                    Text {
                        id: labelTVD
                        text: "TVD"
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xRdatos2.width*0.5-labelTVD.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiTVD
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                        }
                    }
                    Text {
                        id: labelUnityTVD
                        height:30
                        font.pixelSize: app.fs
                    }
                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelIntake
                        text: appSettings.idioma==='Español'? 'Profundidad de la Bomba': 'Intake'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xRdatos2.width*0.5-labelIntake.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiIntake
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                        }
                    }
                    Text {
                        id: labelUnityIntake
                        height:30
                        font.pixelSize: app.fs
                    }
                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelBomba
                        text: appSettings.idioma==='Español'? 'Bomba <br>(Sistema Metrico)': 'Pump <br> (Metric System)'
                        height:30
                        font.pixelSize: app.fs

                    }
                    ComboBox{
                        id: cbBomba
                        model: ['6' ,'10' ,'15' ,'20' ,'33' ,'43' ,'64' ,'85' ,'106EW' ,'120', '125', '127EW' ,'160' ,'200' , 'Otro']
                        width: xRDatos2.width*0.5-labelBomba.contentWidth
                        height: 20

                    }
                    ComboBox{
                        id: cbBomba2
                        model: [ '400','600','700','750','800','900','1000','1050','1200','1250','1400','1500','1600','1750','1800','2100','2400','2700', 'Otro']
                        width: xRDatos2.width*0.3-labelBomba.contentWidth
                        height: 20

                    }


                }
            }
        }
}
        Rectangle{
            id: xRdatos3
            width: xModIngresarDatos.width*0.4-labelCHP.contentWidth
            height:170
            border.width: 2
            border.color: '#A4A4A4'
            color: '#D8D8D8'

            Column{
                anchors.centerIn: parent
                spacing: 30

                Row{
                    spacing: app.fs
                    Text {
                        id: labelCaudal
                        text:appSettings.idioma==='Español'? 'Caudal': 'Flow Rate'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xRdatos3.width*0.5-labelCaudal.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiCaudal
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
                        id: labelBSW
                        text:'BSW'
                        height:30
                        font.pixelSize: app.fs

                    }
                    Rectangle{
                        width: xRdatos3.width*0.5-labelBSW.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            id: tiBSW
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            maximumLength: 30
                        }
                    }
                    Text {
                        id: labelUnityBSW
                        text: '%'
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
                        width: xRdatos3.width*0.5-labelDensity.contentWidth
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
                        height:30
                        font.pixelSize: app.fs
                    }
                }
            }

        }
}

function calcular(){

    var datoTiCHP = parseFloat(tiCHP.text)
    var datoTiTHP = parseFloat(tiTHP.text)
    var datoTiIntake = parseFloat (tiIntake.text)
    var datoTiTVD = parseFloat (tiTVD.text)
    var datoTiPump = parseFloat (tiPump.text)
    var datoCaudal = parseFloat (tiCaudal.text)
    var datoBSW = parseFloat (tiBSW.text)
    var datoDensity = paseFloat (tiDensity.text)
}



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
            labelUnityDensity.text=appSettings.unidades==='Sistema Ingles'? 'Lb/gal': 'Kg/m3'
            labelUnityIntake.text=appSettings.unidades==='Sistema Ingles'? 'ft': 'm'
        }else{
            labelSistemaActual.text='<b>Unity Current System: </b>'+appSettings.unidades
            labelUnityCHP.text = appSettings.unidades==='English System'? 'Psi': 'Pa'
            labelUnityTHP.text=appSettings.unidades==='English System'? 'Psi': 'Pa'
            labelUnityTVD.text=appSettings.unidades==='English System'? 'ft': 'm'
            labelUnityDensity.text=appSettings.unidades==='English System'? 'Lb/gal': 'Kg/m3'
            labelUnityIntake.text=appSettings.unidades==='English System'? 'ft': 'm'
        }
    }
}
