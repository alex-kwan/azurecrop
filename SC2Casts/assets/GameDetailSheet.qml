import bb.cascades 1.0


Page {
    property alias nav : matchList.nav
   
   
    Container {
            layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom

       		 }

        background: Color.Black
        MatchList{
        	data : "models/match.xml"
            id: matchList
            horizontalAlignment: HorizontalAlignment.Center

        }
        
       
    
    }
}
