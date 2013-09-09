import bb.cascades 1.0

NavigationPane{
    property alias type : titlebar.title
    property alias gamemodel : gamelist.dataSrc
    id : nav
    Page {
        content: Container{
            layout:StackLayout {
            
            }
            
                GamesList{
                    id:gamelist
                    
                    nav : nav
                
                }
                
        }
            titleBar: TitleBar {
                id : titlebar
                title: "Top Games"
            }
            onCreationCompleted: {
                gamelist.searchText = "";
            } 
        }
    
      
    
}
