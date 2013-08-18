import bb.cascades 1.0

Container {
    layout: DockLayout {
        
    }

    property alias icon : image.imageSource
    property alias firstLabel : gameDescription.title
    property alias secondLabel : gameDescription.description
    property alias race1   : versus.race1
    property alias race2   : versus.race2
    
    
    
    Container{
        layout:StackLayout{}
    }
    ImageView {
        id : image
        imageSource: "asset:///0.jpg"
        scaleX: 0.5
        scaleY: 0.5
        translationX: -120.0
        translationY: -100.0

    }
    
    GameDescription{
        id : gameDescription
        horizontalAlignment: HorizontalAlignment.Left
        verticalAlignment: VerticalAlignment.Center
        translationY: 60.0
    }

   
    Versus {
        id: versus
        minWidth: 300
        minHeight: 200.0
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Top

    }

}