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
                
              
            TextField {
                id:filterSearch
                inputMode: TextFieldInputMode.Text
                autoFit: TextAutoFit.FitToBounds
            
            }
        }
            titleBar: TitleBar {
                id : titlebar
                title: "Top Games"
            } 
        }
      
    
}
