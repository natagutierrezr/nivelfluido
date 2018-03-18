
        import QtQuick 2.0
        import QtQuick.Controls 1.4
        import Qt.labs.settings 1.0
       
//Tipos de Datos màs comunes en QML o JavaScript
//Tipo cadena de texto o tambièn llamado string. Son textos que se escriben entre comillas simples o dobles.
//Tipo nùmero entero llamado int. Son nùmero enteros desde -656350 a  656350
//Tipo float, double o real. Son tipos de nùmero con decimales
//Tipo Objeto que se llama Object. Es algo, como ser una area, un rectàngulo, un mòdulo, Su forma bàsica es algo asi {nombre:"sfs", otroNombre:312}
        ApplicationWindow {
            id:app
            visible: true //El parametro de ApplicationWindow llamado visible espera un valor del tipo booleano: true o falso
            width: 500
            height: 400
            title: 'Nivel de Fluido Dinamico'
            visibility: 'Maximized'
            //onClosing: Qt.quit()
       
            property int area: 0
            property int fs: 14//Tamaño de la letra
            //property var modulo1: modCrearInforme
            //property var modulo2: modModificarDatos
       
            Settings{
                id: appSettings
                category: 'conf-appnf'
                property string idioma: 'Español'
                property string unidades: 'Sistema Ingles'
                property string fecha: '01/01/1970'
       
                onIdiomaChanged: {
                    if(idioma==='Español'){
                        if(appSettings.unidades==='English System'){
                                appSettings.unidades='Sistema Ingles'
                        }else{
                                appSettings.unidades='Sistema Internacional'
                        }
                    }
                }
            }
            menuBar: MenuBar {
                Menu {
                    title: "NAVI"
                    MenuItem {
                        text: "Nuevo"
                        shortcut: "Ctrl+N"
                        onTriggered: {
                            app.area=1
                        }
                    }
                    MenuItem {
                        text: "Guardar"
                        shortcut: "Ctrl+S"
                        // para guardar datos al final ontriggered: ?
                    }
                    MenuItem {
                        text: appSettings.idioma==='Español'?"Salir": "Exit"
                        shortcut: "Ctrl+Q"
                        onTriggered: {
                            Qt.quit()
                        }
                    }
                }
            }
            Row{
                spacing: 20
            Text {
                id: labelIdiomaActual
                text:   appSettings.idioma==='Español' ?  'Idioma actual: <b>'+appSettings.idioma+'</b>' :  'Current Lanjuage: <b>'+appSettings.idioma+'</b>'
                height: cbIdioma.height
                font.pixelSize: 10

                //COMO PONERLO ENN LA PARTE INFERIOR IZQUIERDA (NO PUDE CON ANCHORS) IGUAL QUE SISTEMA DE UNIDADES

            }
            Row{
                spacing: 20
                Text {
                    id: labelSistemaActual
                    height:30
                    font.pixelSize: 10

                }
            }


                }

            Rectangle{
                id: xApp
                width: app.width
                height: app.height*0.8
                //visible: false
                anchors.centerIn: parent
                clip: true
                ModCrearInforme{id: modCrearInforme;visible: app.area===1;}
                ModIngresarDatos{id: modIngresarDatos;visible: app.area===2;}
       
       
       
            }
       
       
       
        }
       
       
       
       
       
     
