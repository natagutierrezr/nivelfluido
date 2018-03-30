


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
                text: appSettings.idioma==='Español'?"Abrir": "Open"
                shortcut: "Ctrl+O"
                // para exportar datos al final ontriggered: ?
            }
            MenuItem {
                text: appSettings.idioma==='Español'?"Guardar": "Save"
                shortcut: "Ctrl+S"
                onTriggered: guardar()
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

    function guardar(){
        //Para guardar los datos, los vamos a apilar u ordenar en un archivo de formato JSON
        var c='{'
        // c + = ' "nombreDeLoQueQuieresGuardar" : " ' +elDatoQueQuieresGuardar+ ' " ,\n'
        c+='"idioma":"'+appSettings.idioma+'",\n'
        c+='"unidad":"'+appSettings.unidades+'",\n'
        c+='"nCampo":"'+modCrearInforme.nombreCampo+'",\n'
        c+='"nPozo":"'+modCrearInforme.nombrePozo+'",\n'
        c+='"nOperario":"'+modCrearInforme.nombreOperario+'",\n'
        c+='"nCHP":"'+ModOtros.valorCHP+'",\n'
        c+='"nTHP":"'+ModOtros.valorTHP+'",\n'
        c+='"nTVD":"'+ModOtros.valorTVD+'",\n'
        c+='"nIntake":"'+ModOtros.valorIntake+'",\n'
        c+='"nDensity":"'+ModOtros.valorDensity+'",\n'
        c+='"nDstring":"'+ModViscocidad.valorDstring+'",\n'
        c+='"nDi":"'+ModViscocidad.valorDi+'",\n'
        c+='"nTVD":"'+ModViscocidad.valorTVD+'",\n'
        c+='"nBomba1":"'+ModOtros.valorBomba1+'",\n'
        c+='"nBomba2":"'+ModOtros.valorBomba2+'"\n'

        c +='}'

        unik.setFile(unik.getPath(3)+'/guardadoDePrueba.json', c)


    }

    function abrir(){
    var c = unik.getFile(unik.getPath(3)+'/guardadoDePrueba.json')
    var json=JSON.parse(c)
    //var d=''
    for(var i=0;i<Object.keys(json).length;i++){
    var n = Object.keys(json)[i]
    var dato= json[n]
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
    ModOtros.valorCHP=dato
    }
    if(i===5){
    ModOtros.valorTHP=dato
    }
    if(i===6){
    ModOtros.valorTVD=dato
    }
    if(i===7){
    ModOtros.valorIntake=dato
    }
    if(i===8){
    ModOtros.valorDensity=dato
    }
    if(i===9){
    ModViscocidad.valorDstring=dato
    }
    if(i===10){
    ModViscocidad.valorDi=dato
    }
    if(i===11){
    ModViscocidad.valorTVD=dato
    }
    if(i===12){
    ModOtros.valorBomba1=dato
    }
    if(i===13){
    ModOtros.valorBomba2=dato
    }
    //d+=dato+'\n';
    }
    //unik.setFile(unik.getPath(3)+'/datossssss.txt', d)

}



}



