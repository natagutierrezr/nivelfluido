
       
       
        import QtQuick 2.0
        import QtQuick.Controls 1.4
        import Qt.labs.settings 1.0
       
       
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
                        text: appSettings.idioma==='Español'?"Nuevo": "New"
                        shortcut: "Ctrl+N"
                        onTriggered: {
                            app.area=1
                        }
                    }
                    MenuItem {
                        text: appSettings.idioma==='Español'?"Guardar": "Save"
                        shortcut: "Ctrl+S"
                        // para guardar datos al final ontriggered: ?
                    }
                    MenuItem {
                        text: appSettings.idioma==='Español'?"Exportar": "Export"
                        shortcut: "Ctrl+E"
                        // para exportar datos al final ontriggered: ?
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
            Rectangle{
                id: xFondoApp
                anchors.fill: parent
                color: "white"//Aqui le cambias el color al fonde de toda la aplicación.
       
       
                Row{
                    x:app.fs
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: app.fs
                    spacing: 20
                    Text {
                        id: labelIdiomaActual
                        text:   appSettings.idioma==='Español' ?  'Idioma actual: <b>'+appSettings.idioma+'</b>' :  'Current Lanjuage: <b>'+appSettings.idioma+'</b>'
                        height: 30
                        font.pixelSize: 10
       
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
       
       
            }
            Rectangle{
                id: xApp
                width: app.width
                height: app.height*0.8
                //visible: false
                anchors.centerIn: parent
                clip: true
                ModCrearInforme{id: modCrearInforme;visible: app.area===1;}
                ModFichas{id:modFichas;visible:app.area===2;}
                //ModViscocidad{id: modViscocidad;visible:app.area===2;}
                ModIngresarDatos{id: modIngresarDatos;visible: app.area===3;}
       
       
       
            }
       
       
       
        }
       
       
       
       
       
       
     
