import bb.cascades 1.0
Container{
    
    property alias title : title.text
    property alias description : description.text
    property alias race1 : versus.race1
    property alias race2 : versus.race2
    
    minHeight: 220	
    maxHeight: 220
    
    attachedObjects:[
        TextStyleDefinition {
            id: tsd
            base: SystemDefaults.TextStyles.BodyText
            fontSize: FontSize.Large
           // color: Color.create("#f4ffa200")
           color:Color.White
            fontFamily: "helvetica"
        }
    ]
    layout:DockLayout{}

   
    
    
    Container{

        minWidth: 1280
        layout: StackLayout{
            orientation: LayoutOrientation.LeftToRight

        }
        background: Color.Black
        leftPadding: 50.0
        Versus {
            
            id : versus
            minHeight: 200
            minWidth: 385
            horizontalAlignment: HorizontalAlignment.Right
            verticalAlignment: VerticalAlignment.Center
            preferredWidth: 300.0
        
        }
        Label {
            id: title
            text: "Scarlett \nJaedong"
            multiline: true
            textStyle{
                base: tsd.style
            }
            
            minHeight: 200.0
            maxHeight: 200.0
            preferredHeight: 200.0
            translationY: 40.0
            translationX: 40.0
            horizontalAlignment: HorizontalAlignment.Left
            verticalAlignment: VerticalAlignment.Center
        }
        
    }
    
    Container{
        background: Color.Black
        verticalAlignment: VerticalAlignment.Bottom
        minWidth: 1280
        Label {
	        id : description
	        text : "2013 WCS America S2 random custom description Semi Finals / Caster: RotterdaM & MrBitter - Aug 16, 2013 @ YouTube"
	        textStyle.color: Color.White
            textStyle.fontStyle: FontStyle.Italic
	        textStyle.fontSizeValue: 5
	        textStyle.fontSize: FontSize.PointValue
	        multiline: true
	        verticalAlignment: VerticalAlignment.Bottom
	        horizontalAlignment: HorizontalAlignment.Left
	        textFormat: TextFormat.Html
            translationX: 20.0

        }
    }
    
    
}
