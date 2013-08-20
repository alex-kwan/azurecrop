import bb.cascades 1.0
import bb.system 1.0

MenuDefinition {
    
    property GamesList gamelist 
    settingsAction: SettingsActionItem {
        onTriggered: {
            toast.body = "Settings"
            toast.show();
        }
    }
    helpAction: HelpActionItem {
        onTriggered: {
            toast.body = "Help"
            toast.show();
        }
    }
    actions: [
        ActionItem {
            title: "Top Games"
           // imageSource: "asset:///images/salt_icon.png"
            onTriggered: {
                //gamelist.resetDataModel();
            gamelist.data = "asset:///models/topgamedescriptions.xml";
            
            }
        },
        ActionItem {
            title: "Recent Games"
            // imageSource: "asset:///images/salt_icon.png"
            onTriggered: {
             //   gamelist.resetDataModel();
                gamelist.data = "asset:///models/recentgamedescriptions.xml";
                
            }
        }
    ]

    attachedObjects: [
        SystemToast {
            id: toast
            body: "Toasty"
        }
    ]
}
