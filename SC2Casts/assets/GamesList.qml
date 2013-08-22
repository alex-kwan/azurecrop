import bb.cascades 1.0


ListView {
    
    property alias data : dataModel.source
    property variant nav
    attachedObjects: [
        ComponentDefinition {
            id: gameDetail
            source: "GameDetailSheet.qml"
        },
        GameDetailSheet {
            id: gameSheet 
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
                
            }
        } // end of second ListItemComponent]
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

    layout: StackListLayout {

    }
   

}

 