
        import QtQuick 2.0
        import QtQuick.Controls 1.4
       
       
        Rectangle {
            id: xModInfo
            anchors.fill: parent
            width: 100
            height: 62
       
            Text{
                id: labelInfo
                text: appSettings.idioma==='Español'? 'NAVI <br> Versión 1.0 <br> Derechos de autor reservados. <br><br> Natalia Andrea Gutierrez Rodriguez <br> Telefono: +57 (1) 2020399 <br> Celular: +57 3214930258 Correo: natagutierrezr@live.com':'NAVI <br> Version 1.0 <br> All rights reserved. <br><br> Natalia Andrea Gutierrez Rodriguez <br> Phone: +57 (1) 2020399 <br> Cell phone: +57 3214930258 Email: natagutierrezr@live.com'
       
            }
            Button{
                id: botCerrar
                width: xCrearInforme.width*0.3
                height: 30
                text:appSettings.idioma==='Español'?'Cerrar':'Quit'
                anchors.right: parent.right
                onClicked: {
                    xModInfo.quit()
                }
            }
        }
     