import bb.cascades 1.0


Page {
    property alias nav : matchList.nav
    property alias title: titlebar.title
    property alias description: description.text
    titleBar: TitleBar {
        id : titlebar
        title: "Polt vs TaeJa"
    
    }
    Container {
            layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom

       		 }
       Label{
           id : description
           leftMargin: 150
           minWidth:720
           maxWidth:720
           horizontalAlignment: HorizontalAlignment.Fill
           text:"sdasdsadasdsdasdsa
           fdfdsff
           sdfdsf"
            textStyle.textAlign: TextAlign.Default
            multiline: true
            textFormat:{
                
            }
            translationX: 40.0
        }
        background: Color.Black
        MatchList{
        	data : "models/match.xml"
            id: matchList
            horizontalAlignment: HorizontalAlignment.Center

        }
        
       
    
    }
}
