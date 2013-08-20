import bb.cascades 1.0

Container {
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight

    }
    property alias firstLabel : gameDescription.title
    property alias secondLabel : gameDescription.description
    property alias race1   : gameDescription.race1
    property alias race2   : gameDescription.race2
    
    
    
    Container{
        layout:StackLayout{}
    }
    
    GameDescription{
        id : gameDescription
       
    }

}