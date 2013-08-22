import bb.cascades 1.0
Page{
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
}

       
    

