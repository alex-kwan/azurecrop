import bb.cascades 1.0

NavigationPane{
    property alias type : titlebar.title
    property alias gamemodel : gamelist.data
    property variant menu
    Menu.definition: menu
    id : nav
    Page {
        
        GamesList{
            id:gamelist
            nav : nav
        
        }
    
        titleBar: TitleBar {
            id : titlebar
            title: "Top Games"
        
        }
    }
}
