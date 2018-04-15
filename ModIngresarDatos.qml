

import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: xModIngresarDatos
    anchors.fill: parent
    clip:true
    property string datoTRE: '?'
    property int modoViscocidad: -1
    property var objViscocidad

    //property alias datoTRE: tiTorqueRe.text

    onVisibleChanged: {
        if(visible){
            setearUI()
        }
    }



    Row{
        anchors.centerIn: parent
        spacing: 30

        Column{
            spacing: 15
            Text {
                id: labelTorque
                text:appSettings.idioma==='Español'? 'Torque total': 'Total Torque'
                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter

            }
            Text {
                id: labelTorqueFr
                text:appSettings.idioma==='Español'? 'Torque de fricción':'Friction Torque'
                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter

            }
            Text {
                id: labelTorqueRe
                text:appSettings.idioma==='Español'? 'Torque Resistivo':'Resistive Torque'
                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter

            }
            Text {
                id: labelTorqueHi
                text:appSettings.idioma==='Español'? 'Torque Hidráulico':'Hydraulic Torque'
                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter

            }
        }
        Column{
            spacing: 15
            Rectangle{
                width: xModIngresarDatos.width*0.5
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
            Rectangle{
                width: xModIngresarDatos.width*0.5
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
            Rectangle{
                width: xModIngresarDatos.width*0.5
                height: 30
                border.width: 1
                clip: true
                Text{
                    text: xModIngresarDatos.datoTRE
                    id: tiTorqueRe
                    width: parent.width*0.96
                    height: app.fs
                    font.pixelSize: app.fs
                    anchors.centerIn: parent
                    enabled: false
                    Timer{
                        running: true
                        repeat: true
                        interval: 500
                        onTriggered: {
                            //console.log('Modo Viscocidad Detectado: '+objViscocidad.modo)
                            tiTorqueRe.text=''+modViscosidad.getTRE()
                        }
                    }
                }
            }
            Rectangle{
                width: xModIngresarDatos.width*0.5
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
                    enabled: false
                }
            }
        }
        Column{
            spacing: 15
            Text {
                id: labelUnityTorque
                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                id: labelUnityTorqueFr
                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: labelUnityTorqueRe

                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                id: labelUnityTorqueHi

                height:30
                font.pixelSize: app.fs
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Button{
        id: botOK
        text:'OK'
        anchors.right: parent.right
        anchors.rightMargin: app.fs
        anchors.bottom: parent.bottom
        anchors.bottomMargin: app.fs
        onClicked: {
            modCompletado2=true
            modFichas.fichaCompletada=2;
        }

        Timer{
            id: timerControlUI
            running: tabBar.currentIndex===0&&app.area===2
            repeat: true
            interval: 500
            onTriggered: {

                    if(tiTorque.text!==''&&tiTorqueFr.text!==''){
                        botOK.enabled=false
                    }else{
                        botOK.enabled=true
                    }

            }
        }

    }

    Component.onCompleted: xModIngresarDatos

    Timer{
        id:timerHI
        running: true
        repeat: true
        interval: 250//Tu tienes un microprocesador de 2.6Ghz puede ejecutar 2.600.000 de funciones por segundo.
        onTriggered: {//Eventos, cosas que suceden. Accion o reaccion. Dispara un evento. disparo, trigger.
            calcular()
        }
    }

    /*Button{
        id: botOK
        text:'OK'
        anchors.right: parent.right
        anchors.rightMargin: app.fs
        anchors.bottom: parent.bottom
        anchors.bottomMargin: app.fs

    }*/

    function calcular(){
        var datoTiTorque = parseFloat(tiTorque.text)
        var datoTiTorqueRe = parseFloat(tiTorqueRe.text)
        var datoTiTorqueFr = parseFloat(tiTorqueFr.text)

        var resTHi = datoTiTorque - datoTiTorqueFr - datoTiTorqueRe
        tiTorqueHi.text =resTHi

    }
    function getTHi(){
        return parseFloat(tiTorqueHi.text)
    }
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


