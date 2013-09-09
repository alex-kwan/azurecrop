import bb.cascades 1.0
Page{
    property variant navPane
    property alias title: titlebar.title
    property alias url : webplayer.url
    
    titleBar: TitleBar{
        id:titlebar
        title:"Game 7"
    }
    content:Container{

        WebView{
            
            id : webplayer
            preferredHeight: 1280
            preferredWidth: 1280
            verticalAlignment: VerticalAlignment.Fill
            horizontalAlignment: HorizontalAlignment.Fill

        }
    }
    
    actions: [
        InvokeActionItem {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: "Share"
            query {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: {
                data = "Check out this game! \n	\n "+webplayer.url+"\n\n shared by Watcher of the Void";
            }
        }
    ]
    
    
    paneProperties: NavigationPaneProperties {
        
        backButton:ActionItem{
        	onTriggered:{
        	   
        	    webplayer.stop();
                webplayer.destroy()
                navPane.pop();
        	    
        	}    
        }
        
    }
   
}

       
    

