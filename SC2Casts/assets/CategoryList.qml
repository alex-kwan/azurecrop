import bb.cascades 1.0
import bb.data 1.0
NavigationPane{
    property alias type : titlebar.title
    property alias gamemodel : gamelist.dataSrc
    id : nav
    Page {
        content: Container {
            layout: DockLayout {

            }
            ActivityIndicator {
                
                id: myIndicator
                preferredWidth: 100
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
            GamesList {
                id: gamelist
                indicator: myIndicator
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
                verticalAlignment: VerticalAlignment.Bottom
                hintText: "Search (player, caster, event)"
            }
        }
        
        titleBar: TitleBar {
            id: titlebar
            title: "Top Games"
        }
        
      
//      actions: [
//          ActionItem{
//              title:"Ascending"
//              onTriggered: {
//                  gamelist.ascending = true;
//              }
//          }
//          ,
//          ActionItem{
//              title : "Descending"
//              onTriggered: {
//                  gamelist.ascending = false;
//              }
//          }
//          
//      ]
    }
    
    
}
