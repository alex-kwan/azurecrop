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
    helpAction: HelpActionItem {
        onTriggered: {
            if ( _store.get("alertToggleObjectName",true) == true){
                console.log( "This is the current value " + _store.get("alertToggleObjectName",true));
            	dialog.show();
            }
        }
    }
    
    attachedObjects: [
        Settings{
          id:settings  
        },
        SystemToast {
            id: toast
            body: "Toasty"
        },
        SystemDialog{
            id: dialog
            body: "Streaming video content may incur costs additional costs from your telephone carrier. We advise you connect to Wi-Fi to continue watching. You can go to settings to disable this message in the future."
            title: "Warning Mobile Data Usage"
            returnKeyAction: SystemUiReturnKeyAction.Next
            modality: SystemUiModality.Application
            rememberMeChecked: true
            rememberMeText: "Don't show this dialog"
            defaultButton: SystemUiButton {
            	label: "hello"
            }
            dismissAutomatically: true
            buttonAreaLimit: 3
        }
       
    ]
}
