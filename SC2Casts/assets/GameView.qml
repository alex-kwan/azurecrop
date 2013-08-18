import bb.cascades 1.0

Page {
    property alias url : webplayer.url
    Container {
        background: Color.Black
        WebView{
            id : webplayer
            minWidth: 200
            minHeight: 200
            maxWidth: 1280.0
            maxHeight: 80.0
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
}
