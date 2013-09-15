import bb.cascades 1.0
import bb.data 1.0
NavigationPane{
    property alias type : titlebar.title
    property alias gamemodel : gamelist.dataSrc
    id : nav
    Page {
        content: Container {
            layout: StackLayout {

            }

            GamesList {
                id: gamelist
                nav: nav

            }
            TextField {
                id:text
                inputMode: TextFieldInputMode.Text
                autoFit: TextAutoFit.FitToBounds
                input.submitKey: SubmitKey.Search
                
                onTextChanging: {
                    gamelist.searchText = text
                }
            }
        }
        
        titleBar: TitleBar {
            id: titlebar
            title: "Top Games"
        }
        
      
      actions: [
          ActionItem{
              title:"Ascending"
              onTriggered: {
                  gamelist.ascending = true;
              }
          }
          ,
          ActionItem{
              title : "Descending"
              onTriggered: {
                  gamelist.ascending = false;
              }
          }
          
      ]
    }
    
    
}
