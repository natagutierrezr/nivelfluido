
        import QtQuick 2.0
        import QtQuick.Controls 2.0
        import QtQuick.Dialogs 1.2
        Item {
            id:raiz
            anchors.fill: parent
            onVisibleChanged: {
                if(visible){
                    //getDatosSurvey()
                }
            }
            Column{
                spacing: 1
                Row{
                    Repeater{
                        model: ['MD', 'INCLINACION', 'AZIMUTH', 'TVD']
                        Rectangle{
                            width:lv.width*0.25
                            height: app.fs*1.4
                            clip:true
                            color: 'black'
                            Rectangle{width: parent.width;height: 1}
       
                            Text {
                                id: txt1
                                text: '<b>'+modelData+'</b>'
                                anchors.centerIn: parent
                                font.pixelSize: app.fs
                                color: 'white'
                            }
                        }
                    }
                }
                ListView{
                    id:lv
                    width: raiz.width
                    height: raiz.height-botCargarTxt.height-app.fs*3-app.fs*1.4
                    delegate: delFila
                    model: lm
                    clip: true
                    spacing:2
                }
                Button{
                    id: botCargarTxt
                    text:'Cargar Archivo'
                    height: app.fs*2.4
                    onClicked: fileDialog.visible=true
                    background: Rectangle{
                        border.color: 'black'
                        border.width: 1
                        radius: app.fs*0.5
                    }
                }
            }
            ListModel{
                id:lm
                function add(p1, p2,p3,p4){
                    return{
                        d1:p1,
                        d2:p2,
                        d3:p3,
                        d4:p4
                    }
                }
            }
            Component{
                id: delFila
                Rectangle{
                    id:xrow
                    width: raiz.width
                    height: app.fs*1.4
                    border.width: 1
                    Row{
                        Rectangle{
                            width:xrow.width*0.25
                            height: xrow.height
                            clip:true
       
                            Text {
                                id: txt1
                                text: d1
                                anchors.centerIn: parent
                                font.pixelSize: app.fs
                            }
                        }
                        Rectangle{
                            width:xrow.width*0.25
                            height: xrow.height
                            clip:true
                            Rectangle{width: 1;height: parent.height;color:'black'}
                            Text {
                                id: txt2
                                text: d2
                                anchors.centerIn: parent
                                font.pixelSize: app.fs
                            }
                        }
                        Rectangle{
                            width:xrow.width*0.25
                            height: xrow.height
                            clip:true
                            Rectangle{width: 1;height: parent.height;color:'black'}
                            Text {
                                id: txt3
                                text: d3
                                anchors.centerIn: parent
                                font.pixelSize: app.fs
                            }
                        }
                        Rectangle{
                            width:xrow.width*0.25
                            height: xrow.height
                            clip:true
                            Rectangle{width: 1;height: parent.height;color:'black'}
                            Text {
                                id: txt4
                                text: d4
                                anchors.centerIn: parent
                                font.pixelSize: app.fs
                            }
                        }
                    }
                }
            }
            FileDialog {
                id: fileDialog
                visible: false
                //modality: fileDialogModal.checked ? Qt.WindowModal : Qt.NonModal
                title: 'Seleccionar archivo de texto para Survey'
                selectExisting: true
                folder: appSettings.ucs
                //selectMultiple: fileDialogSelectMultiple.checked
                //selectFolder: fileDialogSelectFolder.checked
                nameFilters: [ "Archivo de texto (*.txt)", "Todos los archivos (*)" ]
                selectedNameFilter: "Todos los archivos (*)"
                sidebarVisible: true
                onAccepted: {
                   fileDialog.visible=false
                    lm.clear()
                    var ms0 = new Date(Date.now())
                    var ms1 = ''+ms0.getTime()
                    app.usurveyid = ms1
                    var f=(''+fileUrls[0]).replace('file:///','')
                    var mcarp0 = (''+fileUrls[0]).split('/')
                    var carp=''
                    for(var i2=0;i2<mcarp0.length-1;i2++){
                        carp+=''+mcarp0[i2]+'/'
                    }
                    console.log('Ultima carpeta de survey: '+carp)
                    appSettings.ucs = carp
                    fileDialog.folder = carp
                    var d=''+unik.getFile(f)
                    var m0=d.split('TVD')
                    if(m0.length===1){
                        return
                    }
                    var m1=''+m0[1]
                    var m2=m1.split('\n')
                    for(var i=0;i<m2.length;i++){
                        //console.log('--------->>>>>>>>'+m2[i])
                        var l =''+m2[i]
                        var cols=l.split('	')
                        if(cols[1]!==undefined){
                            var sql = 'insert into survey (id, md, inclinacion, azimuth, tvd, ms)values(null, \''+cols[0]+'\', \''+cols[1]+'\', \''+cols[2]+'\', \''+cols[3]+'\',  \''+app.usurveyid+'\')'
                            unik.sqlQuery(sql)
                        }
                    }
                    getDatosSurvey()
                    //console.log(d)
                }
                onRejected: { console.log("Rejected") }
            }
            function getDatosSurvey(){
                var sql = 'select * from survey where ms=\''+app.usurveyid+'\''
                console.log('Actualizando survey: '+sql)
                var rows = unik.getSqlData('survey', sql, 'sqlite')
                for(var i=0;i<rows.length;i++){
                    lm.append(lm.add(rows[i].col[1],rows[i].col[2],rows[i].col[3],rows[i].col[4] ))
                }
            }
       
        }
     
