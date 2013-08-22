import bb.cascades 1.0

Page {
    property alias title: titlebar.title
    titleBar: TitleBar{
        id:titlebar
        title: "Not Played"
    }
    Container {
        
        layout:DockLayout{}
        background: Color.Black
        Label{
            text: "Game not played"
            textStyle.color: Color.White
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
}
