import bb.cascades 1.0
Container {
    
    attachedObjects: [
        
        ComponentDefinition {
            id: gameNotPlayed
            source: "NotPlayed.qml"
        }
    ]
    
    property alias data : dataModel.source
    property variant page
    property variant nav
    background: Color.Black
    layout:StackLayout{
        orientation: LayoutOrientation.TopToBottom
    }
    
    WebView{
        id: game
        topMargin : -100
        minWidth: 720.0
        minHeight: 720.0
        maxHeight: 720.0
        maxWidth: 720.0
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        translationX: 0.0
        translationY: -20.0
        
        onUrlChanged: {
            
        }
        
        
    }
    ListView{
        id : view
        
        
        dataModel: XmlDataModel {
            id: dataModel
            source: "models/match.xml"
        }
        
        
        listItemComponents: [
            ListItemComponent {
                type: "header"
                content: Container{
                    layout:StackLayout{
                    
                    }
                    Label{
                        text: ListItemData.title
                        textStyle.color: Color.White
                        textStyle.fontStyle: FontStyle.Normal
                        textStyle.fontWeight: FontWeight.W400
                        textStyle.fontSizeValue: 55.0
                        textStyle.fontSize: FontSize.XXLarge
                        

                    }
                   
                    // WebView{
                    
                    //}
                    Divider {

                    }

                }
            }
            ,ListItemComponent {
                type: "listItem"
                
                content: Container {
                    layout:DockLayout{
                    
                    }
                    Container{
                        background: Color.DarkMagenta
                        leftMargin: 20.0
                        rightMargin: 20.0
                        leftPadding: 50.0
                        rightPadding: 50.0
                        opacity: 0.7
                        minWidth: 1280
                        minHeight: 150
                        maxWidth: 1280
                        maxHeight: 150
                        Label{
	                        text: ListItemData.title
	                        textStyle.color: Color.White
                            opacity: 1.0
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            textFormat: TextFormat.Html
                            textStyle.fontSize: FontSize.XLarge

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
            if (data == "not played") {
                if (page != null) {
                    delete page;
                }
                
                page = gameNotPlayed.createObject();
                nav.push(page);
            } else {
                game.url = createURL(data);
                
            }
          
        
        }

        bottomMargin: -100
        function createURL(str) {
            return 'http://www.youtube.com/embed/' + str + '?rel=0&controls=0';
        }
    
    }
    
}


