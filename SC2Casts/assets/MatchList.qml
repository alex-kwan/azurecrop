import bb.cascades 1.0
import bb.system 1.0
Container {
    
    attachedObjects: [
        
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
            
            var onWifi = true;
            var data = chosenItem.url;
            if (page != null) {
                delete page;
            }
            if (data == "not played") {
                page = gameNotPlayed.createObject();
                page.title = chosenItem.title
               
            } else {
                page = gameView.createObject();
                page.navPane = nav;
                page.title = chosenItem.title;
                page.url = createURL(data, onWifi);
            }
            nav.push(page);
            if( onWifi == false ) {
                dialog.show();
            }
           
        
        }

        minWidth: 720
        maxWidth: 1280
        horizontalAlignment: HorizontalAlignment.Fill
        function createURL(str, onMobileData) {
	        var url = 'http://www.youtube.com/embed/' + str + '?rel=0&controls=0';
	        if( onMobileData == true ){
	        	url += '&autoplay=1';
	        }
            return url
        }
    
    }
    
}


