import bb.cascades 1.0

	
TabbedPane{
    property variant menu
    Menu.definition: menu
    attachedObjects: [
        
        ComponentDefinition {
            id: sc2castmenu
            source: "GameMenu.qml"
        }
    ]
    
    tabs: [
        Tab{
            content:CategoryList{
                type: "Recent Games"
                gamemodel: "models/recentgamedescriptions.xml"
                //gamemodel: "asset:///models/recentgamedescriptions.xml";
            }
            title: "Recent Games"
            imageSource: "asset:///images/1377631251_224360-folder-recent.png"
            //   s   imageSource: "asset:///images/recentgames_icon_60x60.png"
        },
        Tab{
          content:CategoryList{
              type:"Top Games"
              gamemodel: "models/topgamedescriptions.xml"
              //gamemodel: "asset:///models/topgamedescriptions.xml";
          }
            title: "Top Games"
            imageSource: "asset:///images/1377631302_MB__Champions_League.png"
            //  imageSource: "asset:///images/protoss-icon.png"
        }
    ]
    showTabsOnActionBar: true
    sidebarState: SidebarState.VisibleFull
    
    onCreationCompleted: {
        menu = sc2castmenu.createObject();
        Application.thumbnail.connect(onThumbnail)  
        if ( _app.get("activeFrameChooserObjectName","") == ""){
        	_app.set("activeFrameChooserObjectName","T")
        }
        if ( _app.get("alertToggleObjectName","false") == "false"){
        _app.set("alertToggleObjectName", "false");
        }
    }
    function onThumbnail() {
        _activeFrame.update(getImage(_app.get("activeFrameChooserObjectName","T")));
    }
    
    function getImage(str){
        var image = "";
        
        if ( str == "P")
            return "asset:///images/protoss_icon_white_200x200.png";
        else if (str == "Z")
            return "asset:///images/zerg_icon_white_200x200.png";
        else if ( str == "T"){
            return "asset:///images/terran_icon_white_200x200.png";
        }
    }
    
}