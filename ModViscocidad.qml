

import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    id:xModViscocidad
    width: parent.width*0.7
    height: parent.height*0.9
    anchors.centerIn: parent
    clip:true
    property alias valorViscosidad: tiViscosity.text
    property alias valorDstring: cbDstring.currentText
    property alias valorDi: cbDi.currentText
    property alias valorTVD: tiTVD.text
    property int modo: rb1.cheched?0:1
    //    property string urb: 'rb0'
    signal modoCambiado(int m)
    onVisibleChanged: {
        if(visible){
            setearUI()
        }
    }






    ColumnLayout {
        GroupBox {
            title: appSettings.idioma==='Español'? "Torque resistivo" : "Restitivo Torque"

            RowLayout {
                ExclusiveGroup { id: tabPositionGroup }
                RadioButton {
                    id:rb1
                    text: appSettings.idioma==='Español'? "Viscocidad < 1000 cp" : "Viscocity < 1000 cp"
                    checked: true
                    exclusiveGroup: tabPositionGroup
                }
                RadioButton {
                    id: rb2
                    text: appSettings.idioma==='Español'? "Viscocidad < 1000 cp" : "Viscocity < 1000 cp"
                    exclusiveGroup: tabPositionGroup
                }
            }
        }
        Rectangle{
            id:xVDstring
            enabled: rb2.checked
            Layout.preferredWidth: xModViscocidad.width*0.8
            Layout.preferredHeight: xModViscocidad.height
            color: '#D8D8D8'

            clip: true
            Row{
                spacing: 7
                Column{
                    spacing: app.fs
                    Text{
                        id:labelVDstring
                        text: appSettings.idioma==='Español'? 'Diametro de <br> la Varilla': 'String Diameter'
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                        height: cbDi.height

                    }
                    Item{
                        id:xEspacioTiDstringOtro
                        width: xModViscocidad.width*0.1
                        height: xTiDstringOtro.height
                        visible: xTiDstringOtro.visible
                    }
                    Text{
                        id:labelVDi
                        text: appSettings.idioma==='Español'? 'Diametro Interno': 'Internal Diameter'
                        font.pixelSize:app.fs
                        verticalAlignment: Text.AlignVCenter
                        height: cbDi.height
                    }
                    Item{
                        id:xEspacioTiCDIOtro
                        width: xModViscocidad.width*0.1
                        height: xTiCDIOtro.height
                        visible: xTiCDIOtro.visible
                    }
                    Text{
                        id:labelV
                        text: appSettings.idioma==='Español'? 'Viscosidad': 'Viscosity'
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                        height: app.fs*2
                    }
                    Text{
                        id:labelVTVD
                        text: 'TVD'
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                        height: app.fs*2
                    }
                    Text{
                        id:labelVRPM
                        text: 'RPM'
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                        height: app.fs*2
                    }
                }
                Column{
                    spacing: app.fs
                    ComboBox{
                        id: cbDstring
                        //model: [ '1 1/4', '1 1/8','1','5/8','7/8', 'Otro']
                        width: xModViscocidad.width*0.1
                        height: 30




                    }
                    Rectangle{
                        id:xTiDstringOtro
                        width: xModViscocidad.width*0.1
                        height: 0
                        border.width: 1
                        //color: 'red'
                        clip:true
                        Behavior on height {
                            NumberAnimation{
                                duration: 250//aca le cambias la velocidad en milisegundos para que aparezca
                            }
                        }
                        TextInput {
                            id: tiDstringOtro
                            font.pixelSize: parent.height*0.8
                            width: parent.width*0.96
                            height: parent.height*0.8
                            anchors.centerIn: parent
                            onTextChanged: {
                                if(text!==''){
                                    btnAddOtroDstring.visible=true
                                }else{
                                    btnAddOtroDstring.visible=false
                                }
                            }
                        }
                    }
                    ComboBox{
                        id: cbDi
                        //model: [ '1.867','1.995','2.041','2.259','2.323','2.441','2.75','2.992','3.068','Otro']
                        width: xModViscocidad.width*0.1
                        height: 30
                    }
                    Rectangle{
                        id:xTiCDIOtro
                        width: xModViscocidad.width*0.1
                        height: 0
                        border.width: 1
                        //color: 'red'
                        clip:true
                        Behavior on height {
                            NumberAnimation{
                                duration: 250//aca le cambias la velocidad en milisegundos para que aparezca
                            }
                        }
                        TextInput {
                            id: tiCDIOtro
                            font.pixelSize: parent.height*0.8
                            width: parent.width*0.96
                            height: parent.height*0.8
                            anchors.centerIn: parent
                            onTextChanged: {
                                if(text!==''){
                                    btnAddOtroCDI.visible=true
                                }else{
                                    btnAddOtroCDI.visible=false
                                }
                            }
                        }
                    }
                    Rectangle{
                        id:xV
                        width: cbDstring.width
                        height: app.fs*2
                        border.width: 1
                        border.color: xVDstring.enabled?'black':'gray'
                        clip: true
                        TextInput{
                            id: tiViscosity
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: 12
                            anchors.centerIn: parent
                            maximumLength: 5
                        }
                    }
                    Rectangle{
                        id:xTi4
                        width: cbDstring.width
                        height: app.fs*2
                        border.width: 1
                        border.color: xVDstring.enabled?'black':'gray'
                        clip: true
                        TextInput{
                            id: tiTVD
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: 12
                            anchors.centerIn: parent
                            maximumLength: 5
                        }
                    }
                    Rectangle{
                        id:xTi3
                        width: cbDstring.width
                        height: app.fs*2
                        border.width: 1
                        border.color: xVDstring.enabled?'black':'gray'
                        clip: true
                        TextInput{
                            id: tiRPM
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: 12
                            anchors.centerIn: parent
                            maximumLength: 5
                        }
                    }
                }
                Column{
                    spacing: app.fs
                    Text{
                        id:labelUnityDstring
                        height:cbDi.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter

                    }
                    Item{
                        id:xEspacioUnityTiDstringOtro
                        width: xModViscocidad.width*0.1
                        height: xTiDstringOtro.height
                        visible: xTiDstringOtro.visible
                        Row{
                            Button{
                                id:btnAddOtroDstring
                                visible: false
                                text:appSettings.idioma==='Español'? "Agregar" : "Add"
                                onClicked: {
                                    if(appSettings.numViscOtros===''){
                                        appSettings.numViscOtros+=tiDstringOtro.text
                                    }else{
                                        appSettings.numViscOtros+='@'+tiDstringOtro.text
                                    }
                                    setearUI()
                                    cbDstring.currentIndex = cbDstring.model.length-2
                                    btnAddOtroDstring.visible=false
                                    btnDeleteOtroDstring.visible=false
                                    tiDstringOtro.text=''
                                }
                            }
                            Button{
                                id:btnDeleteOtroDstring
                                visible: false
                                text:appSettings.idioma==='Español'? "Quitar" : "Remove"
                                onClicked: {
                                    var nc=''
                                    var a=appSettings.numViscOtros.split('@')
                                    for(var i=0;i<a.length;i++){
                                        if(i===0){
                                            if(a[i]!==tiDstringOtro.text){
                                                nc+=a[i]
                                            }
                                        }else{
                                            if(a[i]!==tiDstringOtro.text){
                                                nc+='@'+a[i]
                                            }
                                        }
                                    }
                                    appSettings.numViscOtros = nc
                                    setearUI()
                                    cbDstring.currentIndex = cbDstring.model.length-1
                                    btnAddOtroDstring.visible=false
                                    btnDeleteOtroDstring.visible=false
                                    tiDstringOtro.text=''
                                }
                            }
                        }
                    }
                    Text{
                        id:labelUnityDi
                        height:cbDi.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter

                    }

                    Item{
                        id:xEspacioUnityTiCDIOtro
                        width: xModViscocidad.width*0.1
                        height: xTiCDIOtro.height
                        visible: xTiCDIOtro.visible
                        Row{
                            Button{
                                id:btnAddOtroCDI
                                visible: false
                                text:appSettings.idioma==='Español'? "Agregar" : "Add"
                                onClicked: {
                                    if(appSettings.cdiViscOtros===''){
                                        appSettings.cdiViscOtros+=tiCDIOtro.text
                                    }else{
                                        appSettings.cdiViscOtros+='@'+tiCDIOtro.text
                                    }
                                    setearUI()
                                    cbDi.currentIndex = cbDi.model.length-2
                                    btnAddOtroCDI.visible=false
                                    btnDeleteOtroCDI.visible=false
                                    tiCDIOtro.text=''
                                }
                            }
                            Button{
                                id:btnDeleteOtroCDI
                                visible: false
                                text:appSettings.idioma==='Español'? "Quitar" : "Remove"
                                onClicked: {
                                    var nc=''
                                    var a=appSettings.cdiViscOtros.split('@')
                                    for(var i=0;i<a.length;i++){
                                        if(i===0){
                                            if(a[i]!==tiCDIOtro.text){
                                                nc+=a[i]
                                            }
                                        }else{
                                            if(a[i]!==tiCDIOtro.text){
                                                nc+='@'+a[i]
                                            }
                                        }
                                    }
                                    appSettings.cdiViscOtros = nc
                                    setearUI()
                                    cbDi.currentIndex = cbDi.model.length-1
                                    btnAddOtroCDI.visible=false
                                    btnDeleteOtroCDI.visible=false
                                    tiCDIOtro.text=''
                                }
                            }
                        }
                    }

                    Text{
                        id:labelUnityViscosity
                        text: 'cp'
                        height:app.fs*2
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter

                    }
                    Text{
                        id:labelUnityTVD
                        height:app.fs*2
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter

                    }


                }
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
            modCompletado1=true
            modFichas.fichaCompletada=1;
        }
        Timer{
            id: timerControlUI
            running: tabBar.currentIndex===0&&app.area===2
            repeat: true
            interval: 500
            onTriggered: {
                if(rb1.checked){
                    botOK.enabled=true
                }else{
                    if(tiRPM.text!==''&&tiTVD.text!==''&&tiViscosity.text!==''&&cbDstring.currentIndex!==cbDstring.model.length-1&&cbDi.currentIndex!==cbDi.model.length-1){
                        botOK.enabled=true
                    }else{
                        botOK.enabled=false
                    }
                }
                xTiDstringOtro.height = cbDstring.currentText==='Otro'||cbDstring.currentText==='Other'?30:0
                xTiCDIOtro.height = cbDi.currentText==='Otro'||cbDi.currentText==='Other'?30:0

                btnAddOtroDstring.visible = xTiDstringOtro.height===30
                btnAddOtroCDI.visible = xTiCDIOtro.height===30

                var arrayCDStringOtros = appSettings.numViscOtros.split('@')
                var datoExiste=false;
                for(var i=0;i<arrayCDStringOtros.length;i++){
                    if(arrayCDStringOtros[i]===tiDstringOtro.text){
                        datoExiste=true
                    }
                }
                btnDeleteOtroDstring.visible = datoExiste

                var arrayCDIOtros = appSettings.cdiViscOtros.split('@')
                var datoExiste2=false;
                for(var i=0;i<arrayCDIOtros.length;i++){
                    if(arrayCDIOtros[i]===tiCDIOtro.text){
                        datoExiste2=true
                    }
                }
                btnDeleteOtroCDI.visible = datoExiste2


            }

        }

    }
    Component.onCompleted: app.objModViscocidad = xModViscocidad




    function calcular(){
        //console.log('Calculando...')
        var v1 = cbDi.currentText.replace('EW','')
        console.log('P1: '+v1)
        var v2 = cbDstring.currentText.replace('EW','')
        console.log('P2: '+v2)
        var datoTiDi = parseFloat(v1)
        console.log('P3: '+datoTiDi)
        var datoTiDstring = parseFloat(v2)
        console.log('P4: '+datoTiDstring)
        var datoTiViscosity = parseFloat(tiViscosity.text)
        var datoTiRPM = parseFloat(tiRPM.text)
        var datoTiTVD = parseFloat(tiTVD.text)
        var resTRe = ((2.39*10^-8)*datoTiViscosity*datoTiTVD*datoTiRPM*datoTiDstring^3)/(datoTiDi-datoTiDstring)
        return resTRe
        //return 555;
    }
    function setearUI(){
        var otros
        if(appSettings.idioma==='Español'){
            labelSistemaActual.text='<b>Sistema Actual de Unidades: </b>'+appSettings.unidades
            labelUnityDstring.text = appSettings.unidades==='Sistema Ingles'? 'in': 'mm'
            labelUnityDi.text=appSettings.unidades==='Sistema Ingles'? 'in': 'mm'
            labelUnityTVD.text=appSettings.unidades==='Sistema Ingles'? 'ft': 'm'
            otros='Otro'


        }else{
            labelSistemaActual.text='<b>Unity Current System: </b>'+appSettings.unidades
            labelUnityDstring.text = appSettings.unidades==='English System'? 'in': 'mm'
            labelUnityDi.text=appSettings.unidades==='English System'? 'in': 'mm'
            labelUnityTVD.text=appSettings.unidades==='English System'? 'ft': 'm'
            otros='Other'
        }
        //console.log("------------------->>>"+appSettings.numViscOtros)
        var arrayCDString = [ '1 1/4', '1 1/8','1','5/8','7/8']
        var arrayCDStringOtros = appSettings.numViscOtros.split('@')
        for(var i=0;i<arrayCDStringOtros.length;i++){
            if(arrayCDString[i]!==''){
                arrayCDString.push(arrayCDStringOtros[i])
            }
        }
        arrayCDString.push(otros)

        console.log("------------------->>>"+appSettings.cdiViscOtros)
        var arrayCBDI=[ '1.867','1.995','2.041','2.259','2.323','2.441','2.75','2.992','3.068']
        var arrayCDIOtros = appSettings.cdiViscOtros.split('@')
        for(var i=0;i<arrayCDIOtros.length;i++){
            if(arrayCDIOtros[i]!==''){
                arrayCBDI.push(arrayCDIOtros[i])
                //console.log("------------------->>>+++"+arrayCDIOtros[i])
            }

        }
        arrayCBDI.push(otros)
        cbDstring.model=arrayCDString
        cbDi.model=arrayCBDI
    }

    function setCB1(t){
        for(var i=0;i<cbDstring.count;i++){
            if(cbDstring.model[i] === t){
                cbDstring.currentIndex = i
                break
            }
        }
    }
    function setCB2(t){
        for(var i=0;i<cbDi.count;i++){
            if(cbDi.model[i] === t){
                cbDi.currentIndex = i
                break
            }
        }
    }

    function getTRE(){
        var r = -1
        if(rb1.checked){
            r= 0;
            //console.log('-------------------------')
        }else{
            r = calcular()
        }
        return r
    }
    function getModo(){
        var r = -1
        if(rb1.checked){
            r= 0;
            //console.log('-------------------------')
        }else{
            r = 1
        }
        return r
    }
    function getTVD(){
        return parseFloat(tiTVD.text)
    }
}




