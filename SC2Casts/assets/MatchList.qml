import bb.cascades 1.0
import bb.system 1.0
Container {
    
    attachedObjects: [
   
    	ComponentDefinition{
    	    id:networkDialog
    	    source: "NetworkRequiredDialog.qml"
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
            var b = !_app.onWifiConnection();
            console.log(b);
            var data = chosenItem.url;
            if (page != null) {
                delete page;
            }
            var actual = isWifiActive() || isMobileDataCheck();
            console.log('this is actual ' +actual);
            if ( isWifiActive() || !isMobileDataCheck()){
                console.log("LOADING!!!");
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
            }
            else {
                page = networkDialog.createObject();
                page.open();
            }
        }

        minWidth: 720
        maxWidth: 1280
        horizontalAlignment: HorizontalAlignment.Fill
        function createURL(str) {
            return 'http://www.youtube.com/embed/' + str + '?rel=0&controls=0&autoplay=1';
        }
    
    }
    function isWifiActive(){
        console.log("Wifi - "+ _app.onWifiConnection());
        return _app.onWifiConnection();
    }
    function isMobileDataCheck(){
        console.log("Mobile check = " + _app.get("alertToggleObjectName", true));
        return !_app.get("alertToggleObjectName", true);
    }
    
}


