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
//    helpAction: HelpActionItem {
//        onTriggered: {
//            if ( _app.get("alertToggleObjectName",true) == true){
//                console.log( "This is the current value " + _app.get("alertToggleObjectName",true));
//            	dialog.show();
//            }
//        }
//    }
    
    attachedObjects: [
        Settings{
          id:settings  
        }
       
    ]
}
