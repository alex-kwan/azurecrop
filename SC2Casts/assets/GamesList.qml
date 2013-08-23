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
        source: "models/recentgamedescriptions.xml"
        
    }

    listItemComponents: [
        ListItemComponent{
          type: "date"
          content : Container {
              layout:StackLayout{
                  
              }
              preferredWidth:1280
              horizontalAlignment: HorizontalAlignment.Fill
                background: Color.create("#ff000000")
                Label{
                  text: ListItemData.title
                    textStyle.color: Color.create("#e5ffffff")
                    textStyle.fontSize: FontSize.XLarge
                }
          }  
        },
        ListItemComponent {
            type: "listItem"
            content: GameDescription {
                preferredWidth: 1280
                maxWidth:1280
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment : VerticalAlignment.Fill
                title : ListItemData.title.replace("vs", "\n");
                description: {
                    var desc = ListItemData.description
                    var end = desc.indexOf("/");
                    return desc.substring(0, end);
                }
                race1: ListItemData.race1
                race2: ListItemData.race2
                casters: {
                    var beg = ListItemData.description.indexOf(":")+1;
                    var end = ListItemData.description.indexOf("-");
                    return ListItemData.description.substring(beg,end);
                }
                
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
        }
    ]
    
    onTriggered: {
        var chosenItem = dataModel.data(indexPath);
        var page = gameDetail.createObject();
        page.nav = nav;
        page.path = indexPath;
        page.title = chosenItem.title
        page.description = getMatchInfo(chosenItem.description);
        page.casters = getCasters(chosenItem.description)
        page.additional = getAdditionalInfo(chosenItem.description);
        nav.push(page); 
    }
    
    function getMatchInfo(str){
        var desc = str
        var end = str.indexOf("/");
        return str.substring(0, end);
    }
    function getCasters(str){
        var beg = str.indexOf(":")+1;
        var end = str.indexOf("-");
        return str.substring(beg,end);
    }
    
    function getAdditionalInfo(str){
        var beg = str.indexOf("-")+1;
        return str.substring(beg);
    }
}

 