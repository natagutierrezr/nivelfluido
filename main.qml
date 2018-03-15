
       
       
        import QtQuick 2.0
        import QtQuick.Controls 1.4
        import Qt.labs.settings 1.0
       
        ApplicationWindow {
            id:app
            visible: true//El parametro de ApplicationWindow llamado visible espera un valor del tipo booleano: true o false
            width: 500
            height: 400
            title: 'Nivel de Fluidos'
            visibility: 'Maximized'
            //onClosing: Qt.quit()
       
            property int fs: 14//Tamaño de la letra
       
            Settings{
                id: appSettings
                category: 'conf-appnf'
                property string idioma: 'Español'
                property string unidades: 'Sistema Ingles'
                property string fecha: '01/01/1970'
            }
            menuBar: MenuBar {
                Menu {
                    title: "Registros"
                    MenuItem {
                        text: "Nuevo"
                        shortcut: "Ctrl+N"
                        onTriggered: {
                            modCrearInforme.visible=true
                        }
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
                id: xApp
                width: 500
                height: 500
                //visible: false
                //border.width: 1
                anchors.centerIn: parent
                clip: true
                ModCrearInforme{id: modCrearInforme;visible: false;}


                }
//LAS VARIABLES EMPIEZAN DESDE ACA
            Column{
            Row{
                spacing: app.fs
                Text {
                    id: labelCHP
                    text: CHP
                    height:30
                    font.pixelSize: app.fs

                }
                Rectangle{
                    width: xmain.width*0.5-labelCHP.contentWidth
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
                    id: labelUnityCHP
                    //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                    text: appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
                    height:30
                    font.pixelSize: app.fs
            }
            }
            Row{
                spacing: app.fs
                Text {
                    id: labelTHP
                    text: THP
                    height:30
                    font.pixelSize: app.fs

                }
                Rectangle{
                    width: xmain.width*0.5-labelTHP.contentWidth
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
                    id: labelUnityTHP
                    //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                    text: appSettings.unidades==='Sistema Ingles'? 'Psi': 'Pa'
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
                    width: xmain.width*0.5-labelTorque.contentWidth
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
                    id: labelUnityTorque
                    //COMO PONGO ACA EL CONDICIONAL DEL IDIOMA AL TIEMPO?
                    text: appSettings.unidades==='Sistema Ingles'? 'lb/ft': 'N/m'
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
                    width: xmain.width*0.5-labelDensity.contentWidth
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
                    width: xmain.width*0.5-labelTVD.contentWidth
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
                    text: appSettings.unidades==='Sistema Ingles'? 'ft': 'm'
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
                    width: xmain.width*0.5-labelCaudal.contentWidth
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
                    text: "BFPD" //REVISAR
                    height:30
                    font.pixelSize: app.fs
            }
            }
            }
 //LAS VARIABLES TERMINAN ACA


            }

       
       
       
     
