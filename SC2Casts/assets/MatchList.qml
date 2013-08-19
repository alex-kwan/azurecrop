import bb.cascades 1.0

ListView{
    property variant page
    property variant nav
    dataModel: XmlDataModel {
    	id: dataModel
        source: "models/match.xml"
    }
    attachedObjects: [
        ComponentDefinition {
            id: gameview
            source: "GameView.qml"
        },
        ComponentDefinition {
            id: gameNotPlayed
            source: "NotPlayed.qml"
        }
    ]

    listItemComponents: [
        ListItemComponent {
            type: "header"
            content: Container{
                layout:StackLayout{
                    
                }
                Label{
                    text: ListItemData.title
                    
                }
            }
        }
        ,ListItemComponent {
            type: "listItem"

            content: Container {
                layout:DockLayout{
                    
                }
                Label{
                    text: ListItemData.title
                }
              
            
                minHeight : 100
                maxHeight : 100
                minWidth : 500
           
            }
              
        }
    ]

    onTriggered: {

        var chosenItem = dataModel.data(indexPath);
        
        if (page != null) {
            delete page;
        }

        var data = chosenItem.link;
        if (data == "not played") {
            page = gameNotPlayed.createObject();
        } else {
            page = gameview.createObject();
            page.url = createURL(data);
        }
        nav.push(page);

    }
    
    function createURL(str) {
        return 'http://www.youtube.com/embed/' + str + '?rel=0&controls=0';
    }

}

