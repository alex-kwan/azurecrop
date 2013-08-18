import bb.cascades 1.0
import bb.system 1.0

	
	NavigationPane{
	    property variant menu
	    Menu.definition: menu
	    id : nav
	    Page {
        titleBar: TitleBar {
            title: "Test"
            visibility: ChromeVisibility.Visible
           
        }
        GamesList{
            nav : nav

        }
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

    }
	}
