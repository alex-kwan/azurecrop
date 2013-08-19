import bb.cascades 1.0

Page {
    property alias url : webplayer.url
    Container {
        
        layout : DockLayout{
            
        }
        background: Color.Black
        WebView{
            id : webplayer
            minWidth: 640
            minHeight: 480
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            
            
        }
    }
}
