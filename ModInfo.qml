
        import QtQuick 2.0
        import QtQuick.Controls 1.4
       
ApplicationWindow {
    id:app
    visible: true //El parametro de ApplicationWindow llamado visible espera un valor del tipo booleano: true o falso
    width: 400
    height: 300
    title: appSettings.idioma==='Español'?'Sobre NAVI':'About NAVI'


        Rectangle {
            id: xModInfo
            //anchors.fill: parent
            //width: 100
            //height: 62
            anchors.centerIn: parent
            width: 400
            height: 300
            border.width: 0
            color: '#F3E2A9'

            Text{
                id: labelInfo
                text: appSettings.idioma==='Español'? '<b>NAVI</b> <br> Versión 1.0 <br> Derechos de autor reservados. <br><br> Natalia Andrea Gutierrez Rodriguez - Viviana Rojas <br> Telefono: +57 (1) 2020399 <br> Celular: +57 3214930258 <br> Correo: natagutierrezr@live.com':'NAVI <br> Version 1.0 <br> All rights reserved. <br><br> Natalia Andrea Gutierrez Rodriguez - Viviana Rojas <br> Phone: +57 (1) 2020399 <br> Cell phone: +57 3214930258 <br> Email: natagutierrezr@live.com'
       
                anchors.centerIn: parent
            }
            Button{
                id: botCerrar                
                text:appSettings.idioma==='Español'?'Cerrar':'Quit'
                anchors.right: parent.right
                anchors.rightMargin: app.fs
                anchors.bottom: parent.bottom
                anchors.bottomMargin: app.fs
                onClicked: {
                    app.mostrarInfo = false
                    unik.log('Mensaje desde info...')
                }
            }
        }
}
     
