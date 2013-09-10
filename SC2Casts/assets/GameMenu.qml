import bb.cascades 1.0
import bb.system 1.0

MenuDefinition {
    property variant nav
    property GamesList gamelist 
    
    settingsAction: SettingsActionItem {
        onTriggered: {
            settings.open();
        }
    }
    
    attachedObjects: [
        Settings{
          id:settings  
        }
       
    ]
}
