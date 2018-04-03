
        import QtQuick 2.0
        import QtQuick.Controls 1.4
        import Qt.labs.settings 1.0
        import QtQuick.Dialogs 1.2
       
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
            property string usurveyid: ''
            property var objModOtros
            property var objModViscocidad
            //property var modulo1: modCrearInforme
            //property var modulo2: modModificarDatos
       
            //property alias objModViscocidad: modViscocidad
       
            Settings{
                id: appSettings
                category: 'conf-appnf'
                property string idioma: 'Español'
                property string unidades: 'Sistema Ingles'
                property string fecha: '01/01/1970'
                property string ucs: unik.getPath(3)+'/Navi'
       
       
       
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
                        text: appSettings.idioma==='Español'?"Abrir": "Open"
                        shortcut: "Ctrl+O"
                        onTriggered: fileDialogAbrir.visible=true
                    }
                    MenuItem {
                        text: appSettings.idioma==='Español'?"Guardar": "Save"
                        shortcut: "Ctrl+S"
                        onTriggered: fileDialogGuardar.visible=true
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
                Menu {
                    title: "Información"
                    MenuItem {
                        text: appSettings.idioma==='Español'?"Sobre NAVI": "About NAVI"

                        /*onTriggered: {
                            app.area=1
                        }COMO PONGO ACA PARA APRECER MODULO INFO como una ventanita
                    }*/
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
                ModFichas{id:modFichas; visible:app.area===2;}

                //ModViscocidad{id: modViscocidad;visible:app.area===3;}
                //ModIngresarDatos{id: modIngresarDatos;visible: app.area===4;}
                //ModOtros{id:modOtros;visible: app.area===5;}
       
       
       
            }
            FileDialog {
                id: fileDialogGuardar
                visible: false
                //modality: fileDialogGuardarModal.checked ? Qt.WindowModal : Qt.NonModal
                title: 'Guardar archivo Navi como'
                selectExisting: false
                folder: appSettings.ucs
                //selectMultiple: fileDialogGuardarSelectMultiple.checked
                //selectFolder: fileDialogGuardarSelectFolder.checked
                nameFilters: [ "Archivo de Json (*.json)", "Todos los archivos (*)" ]
                selectedNameFilter: "Todos los archivos (*)"
                sidebarVisible: true
                onAccepted: {
                   fileDialogGuardar.visible=false
                    var f=(''+fileUrls[0]).replace('file://','')
                    console.log('Guardando archivo como '+f)
                    guardar(f)
       
                }
                onRejected: { console.log("Rejected") }
            }
            FileDialog {
                id: fileDialogAbrir
                visible: false
                //modality: fileDialogGuardarModal.checked ? Qt.WindowModal : Qt.NonModal
                title: 'Abrir archivo Navi'
                selectExisting: true
                folder: appSettings.ucs
                //selectMultiple: fileDialogGuardarSelectMultiple.checked
                //selectFolder: fileDialogGuardarSelectFolder.checked
                nameFilters: [ "Archivo de Json (*.json)", "Todos los archivos (*)" ]
                selectedNameFilter: "Todos los archivos (*)"
                sidebarVisible: true
                onAccepted: {
                   fileDialogAbrir.visible=false
                    var f=(''+fileUrls[0]).replace('file://','')
                    console.log('Abriendo archivo como '+f)
                    abrir(f)
       
                }
                onRejected: { console.log("Rejected") }
            }
       
            Component.onCompleted: {
                unik.mkdir(unik.getPath(3)+'/Navi')
                unik.sqliteInit(unik.getPath(3)+'/Navi/navi.sqlite')
                var sql = 'CREATE TABLE IF NOT EXISTS survey('
                            +'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                            +'md VARCHAR (50),'
                            +'inclinacion VARCHAR (50),'
                            +'azimuth VARCHAR (50),'
                            +'tvd VARCHAR (50),'
                            +'ms VARCHAR (50)'
                            +');'
                unik.sqlQuery(sql)
            }
       
            function guardar(nombre){
                var c='{\n'
                c+='"idioma":"'+appSettings.idioma+'",\n'
                c+='"unidad":"'+appSettings.unidades+'",\n'
                c+='"nCampo":"'+modCrearInforme.nombreCampo+'",\n'
                c+='"nPozo":"'+modCrearInforme.nombrePozo+'",\n'
                c+='"nOperario":"'+modCrearInforme.nombreOperario+'",\n'
                c+='"nCHP":"'+objModOtros.valorCHP+'",\n'
                c+='"nTHP":"'+objModOtros.valorTHP+'",\n'
                c+='"nTVD":"'+objModOtros.valorTVD+'",\n'
                c+='"nIntake":"'+objModOtros.valorIntake+'",\n'
                c+='"nDensity":"'+objModOtros.valorDensity+'",\n'
                c+='"nDstring":"'+objModViscocidad.valorDstring+'",\n'
                c+='"nDi":"'+objModViscocidad.valorDi+'",\n'
                c+='"nTVD2":"'+objModViscocidad.valorTVD+'",\n'
                c+='"nBomba1":"'+objModOtros.valorBomba1+'",\n'
                c+='"nBomba2":"'+objModOtros.valorBomba2+'",\n'
       
                c+='"usurveyid":"'+app.usurveyid+'"\n'
       
                c +='}'
                unik.setFile(nombre, c)
            }
       
            function abrir(nombre){
                var c = unik.getFile(nombre)
                //var c ='{"idioma":"Espanol","unidad":"Sistema Ingles","nCampo":"","nPozo":"","nOperario":"","nCHP":"","nTHP":"","nTVD":"","nIntake":"","nDensity":"","nDstring":"1 1/4","nDi":"1.867","nBomba1":"6","nBomba2":"400","usurveyid":"1522531127922"}'
                //var c = '{"aaa":"111", "bbb":"222", "ccc":"333"}'
                var json=JSON.parse(c)
                console.log(JSON.stringify(json))
                console.log('Largo del Json: '+json.toString())
       
                for(var i=0;i<Object.keys(json).length;i++){
                    var n = Object.keys(json)[i]
                    var dato= json[n]
                    console.log('Seteando '+i+' de '+Object.keys(json).length+': '+dato)
                    if(i===0){
                        appSettings.idioma=dato
                    }
                    if(i===1){
                        appSettings.unidades=dato
                    }
                    if(i===2){
                        modCrearInforme.nombreCampo=dato
                    }
                    if(i===3){
                        modCrearInforme.nombrePozo=dato
                    }
                    if(i===4){
                        modCrearInforme.nombreOperario=dato
                    }
                    if(i===5){
                       objModOtros.valorCHP=dato
                    }
                    if(i===6){
                        objModOtros.valorTHP=dato
                    }
                    if(i===7){
                        objModOtros.valorTVD=dato
                    }
                    if(i===8){
                        objModOtros.valorIntake=dato
                    }
                    if(i===9){
                        objModOtros.valorDensity=dato
                    }
                    if(i===10){
                        objModViscocidad.setCB1(dato)
                    }
                    if(i===11){
                        objModViscocidad.setCB2(dato)
                    }
                    if(i===12){
                        objModViscocidad.valorTVD=dato
                    }
                    if(i===13){
                        objModOtros.setCB1(dato)
                    }
                    if(i===14){
                        objModOtros.setCB2(dato)
                    }
                    if(i===15){//Este es para el id del survey cargado
                        console.log('Seteando survey: '+dato)
                        app.usurveyid=dato
                    }
                    modCrearInforme.comoNuevo = false
                    app.area=1
                }
                //unik.setFile(nombre, d)
       
            }
       
       
       
        }
       

       
     
