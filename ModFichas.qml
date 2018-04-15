


import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: raiz
    width: parent.width*0.8
    height: parent.height
    anchors.centerIn: parent
    clip: true

    property int fichaCompletada: 0

    property string bgt1: "red"
    property string bgt2: "black"
    property string bgt3: "black"
    property string bgt4: "black"

    property bool modCompletado1: false
    property bool modCompletado2: false
    property bool modCompletado3: false
    property bool modCompletado4: false
    //property string bgt5: "black"
    Rectangle{
        id: xTabBar
        width: raiz.width
        height: tabBar.height
        TabBar {
            id: tabBar
            currentIndex:0
            //currentIndex: swipeView.currentIndex
            //enabled: false
            NaviTabButton {
                id:tb1
                text: appSettings.idioma==='Español'?"Viscocidad":'Viscosity'
            }
            NaviTabButton {
                id:tb2
                text: "Torques"
            }
            NaviTabButton {
                id:tb3
                text: appSettings.idioma==='Español'?"Otros datos":'Other data'
            }
            NaviTabButton {
                id:tb4
                text: "Survey"
            }
            NaviTabButton {
                id:tb5
                text: appSettings.idioma==='Español'?"Reportes y resultados":'reports and results'
            }
            NaviTabButton {
                id: tb6
                text: appSettings.idioma==='Español'?"Graficas":'graphics'
            }
        }
    }

    SwipeView{
        id: swipeView
        anchors.bottom: xTabBar.bottom
        //width: raiz.width-app.fs*1.20
        //height: raiz.height
        //anchors.centerIn: parent
        currentIndex: tabBar.currentIndex
        onCurrentIndexChanged: {
            if(currentIndex===3){
                modSurvey.getDatosSurvey()
            }
        }
        Rectangle{//Area de Viscocidad
            width: raiz.width
            height: raiz.height-tabBar.height
            color: '#D8D8D8'

            ModViscocidad{
                id:modViscosidad
                onModoCambiado: modIngresarDatos.modoViscocidad=m
            }
        }
        Rectangle{
            width: raiz.width
            height: raiz.height-tabBar.height
            color: '#D8D8D8'
            ModIngresarDatos{
                id:modIngresarDatos
                //objViscocidad: modViscocidad
            }
            //                    Timer{
            //                        running: true
            //                        repeat: true
            //                        interval: 500
            //                        onTriggered: {
            //                            console.log('Modo Viscocidad: '+modViscocidad.modo)
            //                            //modIngresarDatos.datoTRE = modViscocidad.getTRE()
            //                        }
            //                    }


        }
        Rectangle{
            width: raiz.width
            height: raiz.height-tabBar.height
            color: '#D8D8D8'
            clip: true
            ModOtros{id:modOtros}


        }
        Rectangle{
            width: raiz.width
            height: raiz.height-tabBar.height
            color: '#D8D8D8'
            ModSurvey{id:modSurvey}



        }


    }
    Timer{
        id:ttb
        running: raiz.visible
        repeat: true
        interval: 250
        onTriggered:  {
            tb1.bg="#ccc"
            tb1.c="#000"
            tb2.bg="#ccc"
            tb2.c="#000"
            tb3.bg="#ccc"
            tb3.c="#000"
            tb4.bg="#ccc"
            tb4.c="#000"
            tb5.bg="#ccc"
            tb5.c="#000"
            tb6.bg="#ccc"
            tb6.c="#000"
            tb1.enabled=true
            if(modCompletado1){
                tb2.enabled=true
            }
            if(modCompletado2){
                tb3.enabled=true
            }
            if(modCompletado3){
                tb3.enabled=true
            }
            if(modCompletado4){
                tb4.enabled=true
            }
            /*if(modCompletado5){
                tb5.enabled=true
            }
            if(modCompletado6){
                tb6.enabled=true
            }*/


            if(tb1.enabled){
                if(modCompletado1){
                    tb1.bg="green"
                    tb1.c="#fff"
                }else{
                    tb1.bg="red"
                    tb1.c="#fff"
                }
            }
            if(tb2.enabled){
                if(modCompletado2){
                    tb2.bg="green"
                    tb2.c="#fff"
                }else{
                    tb2.bg="red"
                    tb2.c="#fff"
                }
            }
            if(tb3.enabled){
                if(modCompletado3){
                    tb3.bg="green"
                    tb3.c="#fff"
                }else{
                    tb3.bg="red"
                    tb3.c="#fff"
                }
            }
            if(tb4.enabled){
                if(modCompletado4){
                    tb4.bg="green"
                    tb4.c="#fff"
                }else{
                    tb4.bg="red"
                    tb4.c="#fff"
                }
            }


        }
    }
    Component.onCompleted: {
            tb1.enabled=true
    }
}

