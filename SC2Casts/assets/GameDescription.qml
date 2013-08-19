import bb.cascades 1.0

Container{
    
    property alias title : title.text
    property alias description : description.text
    property alias race1 : versus.race1
    property alias race2 : versus.race2
    
    
    layout:DockLayout{}

    minWidth: 1000
    preferredWidth: 1000
    maxWidth: 1280.0
    minHeight: 300
    maxHeight: 300
    preferredHeight: 200.0
    background: Color.White
    
    Container{

        minWidth: 700
        preferredWidth: 700
        layout:DockLayout{
         //   orientation: LayoutOrientation.LeftToRight

        }
        Label {
            id: title
            text: "Scarlett vs Jaedong"
            textStyle.color: Color.create("#f4ffa200")
            multiline: true
            textStyle.fontStyle: FontStyle.Default
            textStyle.fontWeight: FontWeight.Bold
        }
        Versus {
            id : versus
            minHeight: 200
            minWidth: 385
            horizontalAlignment: HorizontalAlignment.Right
            verticalAlignment: VerticalAlignment.Top
            preferredWidth: 300.0

        }
        
        ImageView {
            horizontalAlignment: HorizontalAlignment.Left
            verticalAlignment: VerticalAlignment.Bottom
            imageSource: "asset:///0.jpg"
            
            scaleX: 0.5
            scaleY: 0.5
            translationX: -120.0
            translationY: -20.0

        }
    }
    
    
    Label {
        id : description
        text : "2013 WCS America S2 random custom description Semi Finals / Caster: RotterdaM & MrBitter - Aug 16, 2013 @ YouTube"
        textStyle.color: Color.Black
        textStyle.fontStyle: FontStyle.Italic
        textStyle.fontSizeValue: 5
        textStyle.fontSize: FontSize.PointValue
        multiline: true
        translationX: 0.0
        translationY: -30.0
        verticalAlignment: VerticalAlignment.Bottom
        horizontalAlignment: HorizontalAlignment.Left
        textFormat: TextFormat.Html

    }
    
    
}
