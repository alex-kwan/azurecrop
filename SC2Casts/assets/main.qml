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
    
    onCreationCompleted: {
        
        // Create the app menu for the cookbook.
        menu = sc2castmenu.createObject();
    }
    tabs: [
        Tab{
          content:CategoryList{
              type:"Top Games"
              gamemodel: "asset:///models/topgamedescriptions.xml";
          }
            title: "Top Games"
          //  imageSource: "asset:///images/protoss-icon.png"
        },
        Tab{
        	content:CategoryList{
        	    type: "Recent Games"
                gamemodel: "asset:///models/recentgamedescriptions.xml";
        	}
	            title: "Recent Games"
	      //   s   imageSource: "asset:///images/recentgames_icon_60x60.png"
        }
    ]
    showTabsOnActionBar: true
    sidebarState: SidebarState.VisibleFull
}