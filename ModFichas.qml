
       
                import QtQuick 2.0
                import QtQuick.Controls 2.0
         
                Item {
                    id: raiz
                    width: parent.width*0.8
                    height: parent.height
                    anchors.centerIn: parent
                    Rectangle{
                        id: xTabBar
                        width: raiz.width
                        height: tabBar.height
                        TabBar {
                                id: tabBar
                                currentIndex: swipeView.currentIndex
                                TabButton {
                                    text: "Viscocidad"
                                    width: app.fs*10
                                }
                                TabButton {
                                    text: "Torques"
                                }
                                TabButton {
                                    text: "Otros datos"
                                }
                                TabButton {
                                    text: "Survey"
                                }
                            }
                    }
         
                    SwipeView{
                        id: swipeView
                        anchors.bottom: xTabBar.bottom
                        //width: raiz.width-app.fs*1.20
                        //height: raiz.height
                        currentIndex: tabBar.currentIndex
                        onCurrentIndexChanged: {
                            if(currentIndex===3){
                                modSurvey.getDatosSurvey()
                            }
                        }
                        Rectangle{//Area de Viscocidad
                            width: raiz.width
                            height: raiz.height-tabBar.height
                            color: '#D8D8D8'
                            ModViscocidad{
                                id:modViscosidad
                                onModoCambiado: modIngresarDatos.modoViscocidad=m
                            }
                        }
                        Rectangle{
                            width: raiz.width
                            height: raiz.height-tabBar.height
                            color: '#D8D8D8'
                            ModIngresarDatos{
                                id:modIngresarDatos
                                //objViscocidad: modViscocidad
                            }
        //                    Timer{
        //                        running: true
        //                        repeat: true
        //                        interval: 500
        //                        onTriggered: {
        //                            console.log('Modo Viscocidad: '+modViscocidad.modo)
        //                            //modIngresarDatos.datoTRE = modViscocidad.getTRE()
        //                        }
        //                    }
       
       
                        }
                        Rectangle{
                            width: raiz.width
                            height: raiz.height-tabBar.height
                            color: '#D8D8D8'
                            ModOtros{id:modOtros}
       
       
                        }
                        Rectangle{
                            width: raiz.width
                            height: raiz.height-tabBar.height
                            color: '#D8D8D8'
                            ModSurvey{id:modSurvey}
       
       
       
                        }
       
         
                    }
                }
           