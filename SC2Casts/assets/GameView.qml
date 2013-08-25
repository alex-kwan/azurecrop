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
            minWidth: 640
            minHeight: 480
            maxWidth: 640
            maxHeight: 480
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
        	
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
                data = "Check out this game! \n\n "+webplayer.url+"\n\n shared by SC2 Observer";
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

       
    

