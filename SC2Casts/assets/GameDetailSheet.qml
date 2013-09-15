import bb.cascades 1.0


Page {
    property alias nav : matchList.nav
    property alias title: titlebar.title
    property alias description: description.text
    property alias casters: casters.text
    property alias additional : additional.text
    property alias data : matchList.gameData
    
    titleBar: TitleBar {
        id : titlebar
        title: "Polt vs TaeJa"
    
    }
    Container {
            layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom

       		 }
            leftPadding:50
       Label{
           id : description
           leftMargin: 100
           preferredWidth:1280
           maxWidth:1280
           horizontalAlignment: HorizontalAlignment.Fill
           text:"sdasdsadasdsdasdsa"
            multiline: true

        }
       Label{
           id:casters
           text:"fdsfdfsdf"
            multiline: true
        }
       Label{
           id:additional
           text:"fsdafsdfdd"
            multiline: true
        }
        background: Color.Black
        MatchList{
            id: matchList
            horizontalAlignment: HorizontalAlignment.Center

        }
        
       
    
    }
}
