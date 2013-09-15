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
        
        ,GroupDataModel{
                    id: dataModel
                    sortingKeys: ["title"]
                    sortedAscending: true
                    grouping: ItemGrouping.None
        }
    ]
    
    property variant gameData
    property variant page
    property variant nav
    
    background: Color.Black
    layout:StackLayout{
        orientation: LayoutOrientation.TopToBottom
    }
     
    onGameDataChanged : {
        //dataModel.insertList(data.game)
        console.log("GameData -> " + JSON.stringify(gameData.game));
        var size = gameData.game.length;
        if( gameData.game.length == undefined ){
            dataModel.insert(gameData.game)
        }
        else {
            dataModel.insertList(gameData.game)
        }
//        console.log("the length is "+data.game.length);
//        for( var i = 0; i < size; i++){
//            dataModel.insert(data.game[i]);
//        }
        
    }

    ListView{
        
        id : view
        dataModel: dataModel
        listItemComponents: [
          
            ListItemComponent {
                type: "item"
                
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
            var chosenElement = (gameData.game.length == undefined ) ? gameData.game : gameData.game[indexPath];
            var chosenItem = chosenElement
            console.log(JSON.stringify(chosenItem));
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


