import bb.cascades 1.0
import bb.system 1.0
Container {
    
    attachedObjects: [
        ComponentDefinition{
            id:networkRequiredDialog
            source: "NetworkRequiredDialog.qml"
        },
    	ComponentDefinition{
    	    id:wifiRequiredDialog
    	    source: "WifiRequiredDialog.qml"
    	},
        ComponentDefinition {
            id: gameNotPlayed
            source: "NotPlayed.qml"
        },
        ComponentDefinition {
         	id: gameView
         	source: "GameView.qml"   
        }
    ]
    
    property alias data : dataModel.source
    property variant page
    property variant nav
    property alias path : view.rootIndexPath
    
    background: Color.Black
    layout:StackLayout{
        orientation: LayoutOrientation.TopToBottom
    }

    ListView{
        id : view
        rootIndexPath: [1]
        dataModel: XmlDataModel {
            id: dataModel
            source: "models/recentgamedescriptions.xml"
        }
        
        
        listItemComponents: [
          
            ListItemComponent {
                type: "game"
                
                content: Container {
                    minWidth: 720
                    maxWidth: 1280
                    horizontalAlignment: HorizontalAlignment.Fill
                    layout:DockLayout{
                    
                    }
                    Container{
                        
                        minWidth: 1280
                        maxWidth: 1280
                        topPadding: 5
                        horizontalAlignment: HorizontalAlignment.Fill
                        
                        layout:StackLayout{
                            orientation: LayoutOrientation.TopToBottom

                        }
                        Label{
	                        text: ListItemData.title
	                        textStyle.color: Color.White
                            horizontalAlignment: HorizontalAlignment.Fill
                            textStyle.fontSize: FontSize.XLarge
                            textStyle.fontSizeValue: 3.0
                            topMargin: 50.0
                        }
                        Container{
                            background: Color.White
                            maxHeight: 50
                            minHeight: 2
                            minWidth:720
                            maxWidth:1280
                            horizontalAlignment: HorizontalAlignment.Fill
                        }
                }
                
                }
            
            }
        ]
        
        onTriggered: {
            var chosenItem = dataModel.data(indexPath);
          
            var data = chosenItem.url;
            if (page != null) {
                delete page;
            }
            if ( !doesNetworkExist()){
                page = networkRequiredDialog.createObject();
                page.open();
                return;
            }
            var connection = isWifiActive() || _app.get("alertToggleObjectName", "true") == "true";
            if ( connection ){	
                if (data == "not played") {
                    page = gameNotPlayed.createObject();
                    page.title = chosenItem.title 
                } else {
                    page = gameView.createObject();
                    page.navPane = nav;
                    page.title = chosenItem.title;
                    page.url = createURL(data);
                }
                nav.push(page);
                return;
            }
            else if( connection == false) {
            	page = wifiRequiredDialog.createObject();
                page.open();
                return;
            }
        }

        minWidth: 720
        maxWidth: 1280
        horizontalAlignment: HorizontalAlignment.Fill
        function createURL(str) {
            return 'http://www.youtube.com/embed/' + str + '?rel=0&controls=0&autoplay=1';
        }
    
    }

    function doesNetworkExist(){
        console.log("Network - " +_app.isNetworkAvailable());
        return _app.isNetworkAvailable();
    }
    function isWifiActive(){
        console.log("Wifi - "+ _app.onWifiConnection());
        return _app.onWifiConnection();
    }
    function isMobileDataCheckNotSet(){
        console.log("Mobile check = " + _app.get("alertToggleObjectName", "true"));
        return !_app.get("alertToggleObjectName", "true") == "true"?true:false;
    }
    
}


