import bb.cascades 1.0

Container{
    
    property alias title : title.text
    property alias description : description.text
    
    layout:StackLayout{}
    
    Label {
    	id : title
        text : "Scarlett vs Jaedong"
        textStyle.color: Color.create("#f4ffa200")
        textStyle.fontSizeValue: 15.0
        textStyle.fontSize: FontSize.Medium
        textStyle.fontStyle: FontStyle.Default
        textStyle.fontWeight: FontWeight.Bold

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

    }
}
