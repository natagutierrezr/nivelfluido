
        import QtQuick 2.0
        import QtQuick.Controls 1.4
       
        Rectangle{
            id: xCrearInforme
            width: 500
            height: 500
            //border.width: 1
            anchors.centerIn: parent
            clip: true
       
            Column{
                spacing: 20
                Row{
                    spacing: 20
                    Text {
                        id: labelLanguaje
                        text:  !appSettings.idioma==='Español' ? 'Seleccionar Idioma' : 'Select Languaje'
                        height: cbIdioma.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    ComboBox{
                        id: cbIdioma
                        model: ["Español", "English"]
                        width: xCrearInforme.width*0.5-labelLanguaje.contentWidth
                        height: 30
                        onCurrentTextChanged: {
                            appSettings.idioma = currentText
                        }
                    }
                }
                Text {
                    id: labelIdiomaActual
                    text:   appSettings.idioma==='Español' ?  'Idioma actual: <b>'+appSettings.idioma+'</b>' :  'Current Lanjuage: <b>'+appSettings.idioma+'</b>'
                    height: cbIdioma.height
                    font.pixelSize: app.fs
                    verticalAlignment: Text.AlignVCenter
                }
                Row{
                    spacing: 20
                    Text {
                        id: labelUnity
                        text: appSettings.idioma==='Español'? 'Unidades': 'Units'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    ComboBox {
                        id: cbUnidades
                        model: appSettings.idioma==='Español'? ['Sistema Ingles', 'Sistema Internacional']:['English System', 'International System']
                        width: xCrearInforme.width*0.5-labelUnity.contentWidth
                        height: 30
                        onCurrentTextChanged: {
                            appSettings.unidades = currentText
                        }
                    }
                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelNameField
                        text: appSettings.idioma==='Español'? 'Nombre del Campo': 'Field Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Rectangle{
                        width: xCrearInforme.width*0.5-labelNameField.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            anchors.centerIn: parent
                            maximumLength: 30
                        }
                    }
                }
                Row{
                    spacing: app.fs
                    Text {
                        id: labelNameWell
                        text: appSettings.idioma==='Español'? 'Nombre del Pozo': 'Well Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Rectangle{
                        width: xCrearInforme.width*0.5-labelNameWell.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            anchors.centerIn: parent
                            maximumLength: 30
                        }
                    }
                }
       
                Row{
                    spacing: app.fs
                    Text {
                        id: labelNameOperator
                        text: appSettings.idioma==='Español'? 'Nombre Operario': 'Operator Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Rectangle{
                        width: xCrearInforme.width*0.5-labelNameOperator.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            anchors.centerIn: parent
                            maximumLength: 30
                        }
                    }
                }
       
       
                Row{
                    spacing: app.fs
                    Text {
                        id: labelFecha
                        text: appSettings.idioma==='Español'? 'Fecha': 'Date'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
       
                    Button{
                        id: botFecha
                        width: xCrearInforme.width*0.5-labelFecha.contentWidth
                        height: 30
                        text:appSettings.fecha
                        onClicked: calendario.visible = true
       
       
                    }
       
       
                }
       
            }
            Button{
                id: botCrear
                width: xCrearInforme.width*0.5-labelFecha.contentWidth
                height: 30
                text:appSettings.idioma==='Español'?'Crear':'Create'
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    //Aqui hay que crear un bloque de còdigo para que junte todos los datos
                    //de este formulario y hay que decidir a donde van a ir.
       
       
                    xCrearInforme.visible=false
                }
            }
       
            Boton{
                id:cerrarApp
                onClicking: xCrearInforme.visible = false
                t:"X"
                b: "#ccc"
                w:app.fs*2
                h:w
                anchors.top: parent.top
                anchors.right: parent.right
            }
       
            Calendar{
                id: calendario
                width: xCrearInforme.width
                height: xCrearInforme.height
                visible: false
                onSelectedDateChanged:  {
                    var objetoDate = selectedDate
                    const dia = objetoDate.getDate();
                    const mes = objetoDate.getMonth() + 1;
                    const anio = objetoDate.getFullYear();
       
                    var cdia;
                    if(dia<10){
                        cdia = "0"+dia;
                    }else{
                        cdia = dia;
                    }
                    var cmes;
                    if(mes<10){
                        cmes = "0"+mes;
                    }else{
                        cmes = mes;
                    }
                    var fechaCorregida = ""+cdia+"/"+cmes+"/"+anio;
                    botFecha.text = fechaCorregida
                    calendario.visible = false
                }
            }
            Component.onCompleted: {
                if(appSettings.idioma==='Español'){
                    cbIdioma.currentIndex=0
                    if(appSettings.unidades==='Sistema Ingles'){
                        cbUnidades.currentIndex=0
                    }else{
                        cbUnidades.currentIndex=1
                    }
                }else{
                    //Estamos en Ingles
                    cbIdioma.currentIndex=1
                    if(appSettings.unidades==='English System'){
                        cbUnidades.currentIndex=0
                    }else{
                        cbUnidades.currentIndex=1
                    }
                }
            }
        }
       
     
