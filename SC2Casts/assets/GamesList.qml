import bb.cascades 1.0


ListView {
    
    property alias data : dataModel.source
    property variant nav
    
    attachedObjects: [
        ComponentDefinition {
            id: gameDetail
            source: "GameDetailSheet.qml"
        }
    ]
    
    
    dataModel: XmlDataModel {
        id: dataModel
        source: "models/topgamedescriptions.xml"
    }

    listItemComponents: [
        ListItemComponent {
            type: "listItem"
            content: GameDescription {
                minWidth:720
                maxWidth:1280
                title : ListItemData.title.replace("vs", "\n");
                description: {
                    var desc = ListItemData.description
                    var end = desc.indexOf("/");
                    return desc.substring(0, end);
                }
                race1: ListItemData.race1
                race2: ListItemData.race2
                
                contextActions: [
                    ActionSet {
                        title: "Share"
                        
                        ActionItem {
                            title: "Share on BBM"
                        }
                        ActionItem {
                            title: "Share on Facebook"
                        }
                        ActionItem {
                            title: "Share on Whatsapp"
                        }
                    }
                ]
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
            }
        }
    ]
    
    onTriggered: {
        var chosenItem = dataModel.data(indexPath);
        var page = gameDetail.createObject();
        page.nav = nav;
        page.title = chosenItem.title
        page.description = chosenItem.description
        nav.push(page);
    }
    
    onDataChanged :  {
        console.log("Data has changed", source)
    }
    
    minWidth:720
    maxWidth:1280
    verticalAlignment: VerticalAlignment.Fill
    horizontalAlignment: HorizontalAlignment.Fill
}

 