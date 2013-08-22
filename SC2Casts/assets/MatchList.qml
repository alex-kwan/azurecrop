import bb.cascades 1.0
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
    background: Color.Black
    layout:StackLayout{
        orientation: LayoutOrientation.TopToBottom
    }

    ListView{
        id : view
        
        
        dataModel: XmlDataModel {
            id: dataModel
            source: "models/match.xml"
        }
        
        
        listItemComponents: [
          
            ListItemComponent {
                type: "listItem"
                
                content: Container {
                    layout:DockLayout{
                    
                    }
                    Container{
                        leftMargin: 20.0
                        rightMargin: 20.0
                        leftPadding: 50.0
                        rightPadding: 50.0
                        minWidth: 1280
                        minHeight: 150
                        maxWidth: 1280
                        maxHeight: 150
                        topMargin: 100
                        topPadding: 5
                        Label{
	                        text: ListItemData.title
	                        textStyle.color: Color.White
                            opacity: 1.0
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            textFormat: TextFormat.Html
                            textStyle.fontSize: FontSize.XXLarge
                            textStyle.fontSizeValue: 3.0
                            topMargin: 50.0
                        }
                }
                    minHeight : 100
                    maxHeight : 100
                    minWidth : 500
                
                }
            
            }
        ]
        
        onTriggered: {
            
            var chosenItem = dataModel.data(indexPath);
            
           
            var data = chosenItem.link;
            if (page != null) {
                delete page;
            }
            if (data == "not played") {
                page = gameNotPlayed.createObject();
                page.title = chosenItem.title
               
            } else {
                page = gameView.createObject();
                page.title = chosenItem.title
                page.url = createURL(data);
                
                
            }
            nav.push(page);
        
        }

        bottomMargin: -100
        function createURL(str) {
            return 'http://www.youtube.com/embed/' + str + '?rel=0&controls=0';
        }
    
    }
    
}


