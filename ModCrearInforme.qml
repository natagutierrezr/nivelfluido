
        import QtQuick 2.0
        import QtQuick.Controls 1.4
       
        Rectangle{
            id: xCrearInforme
            color: "#CCD4FF"
            width: 650
            height: 500
            border.width: 1
            anchors.centerIn: parent
            clip: true
            onVisibleChanged: {
                if(visible){
                    setearUI()
                }
            }
            Row{
                spacing: 20
                anchors.centerIn: parent

                Column{
                    spacing: 20

                    Text {
                        id: labelLanguaje
                        text:  !appSettings.idioma==='Español' ? 'Seleccionar Idioma' : 'Select Languaje'
                        height: cbIdioma.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: labelUnity
                        text: appSettings.idioma==='Español'? 'Unidades': 'Units'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: labelNameField
                        text: appSettings.idioma==='Español'? 'Nombre del Campo': 'Field Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: labelNameWell
                        text: appSettings.idioma==='Español'? 'Nombre del Pozo': 'Well Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: labelNameOperator
                        text: appSettings.idioma==='Español'? 'Nombre Operario': 'Operator Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: labelFecha
                        text: appSettings.idioma==='Español'? 'Fecha': 'Date'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Column{
                    spacing: 20

                    ComboBox{
                        id: cbIdioma
                        model: ["Español", "English"]
                        width: xCrearInforme.width*0.7-labelLanguaje.contentWidth
                        height: 30
                        onCurrentTextChanged: {
                            appSettings.idioma = currentText
                        }
                    }
                    ComboBox {
                        id: cbUnidades
                        model: appSettings.idioma==='Español'? ['Sistema Ingles', 'Sistema Internacional']:['English System', 'International System']
                        width: xCrearInforme.width*0.7-labelUnity.contentWidth
                        height: 30
                        onCurrentTextChanged: {
                            appSettings.unidades = currentText
                        }
                    }
                    Rectangle{
                        width: xCrearInforme.width*0.7-labelNameField.contentWidth
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
                    Rectangle{
                        width: xCrearInforme.width*0.7-labelNameWell.contentWidth
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
                    Rectangle{
                        width: xCrearInforme.width*0.7-labelNameOperator.contentWidth
                        height: 30
                        border.width: 1
                        clip: true
                        TextInput{
                            width: parent.width*0.96
                            height: app.fs
                            font.pixelSize: app.fs
                            anchors.centerIn: parent
                            maximumLength: 30

                    Button{
                        id: botFecha
                        width: xCrearInforme.width*0.7-labelFecha.contentWidth
                        height: 30
                        text:appSettings.fecha
                        onClicked: calendario.visible = true


                    }
                }
            }


            /*Column{
                spacing: 30
                anchors.centerIn: parent
                Row{
                    spacing: 40
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
                        width: xCrearInforme.width*0.7-labelLanguaje.contentWidth
                        height: 30
                        onCurrentTextChanged: {
                            appSettings.idioma = currentText
                        }
                    }
                }
       
                Row{
                    spacing: 40
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
                        width: xCrearInforme.width*0.7-labelUnity.contentWidth
                        height: 30
                        onCurrentTextChanged: {
                            appSettings.unidades = currentText
                        }
                    }
                }
                Row{
                    spacing: 40
                    Text {
                        id: labelNameField
                        text: appSettings.idioma==='Español'? 'Nombre del Campo': 'Field Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Rectangle{
                        width: xCrearInforme.width*0.7-labelNameField.contentWidth
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
                    spacing: 40
                    Text {
                        id: labelNameWell
                        text: appSettings.idioma==='Español'? 'Nombre del Pozo': 'Well Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Rectangle{
                        width: xCrearInforme.width*0.7-labelNameWell.contentWidth
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
                    spacing: 40
                    Text {
                        id: labelNameOperator
                        text: appSettings.idioma==='Español'? 'Nombre Operario': 'Operator Name'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
                    Rectangle{
                        width: xCrearInforme.width*0.7-labelNameOperator.contentWidth
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
                    spacing: 40
                    Text {
                        id: labelFecha
                        text: appSettings.idioma==='Español'? 'Fecha': 'Date'
                        height:cbUnidades.height
                        font.pixelSize: app.fs
                        verticalAlignment: Text.AlignVCenter
                    }
       
                    Button{
                        id: botFecha
                        width: xCrearInforme.width*0.7-labelFecha.contentWidth
                        height: 30
                        text:appSettings.fecha
                        onClicked: calendario.visible = true
       
       
                    }
       
       
                }*/
       
       
                Button{
                    id: botCrear
                    width: xCrearInforme.width*0.3-labelFecha.contentWidth
                    height: 40
                    text:appSettings.idioma==='Español'?'CREAR':'CREATE'
                    anchors.right: parent.right
                    onClicked: {
                        app.area=2
                    }
                }
            }
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
       
            function setearUI(){//Graphic User Interface - Interfaz Gràfica de Usuario
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
/*Component.onCompleted: {
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
                                    }*/

       
       
