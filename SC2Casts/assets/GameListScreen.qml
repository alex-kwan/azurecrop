import bb.cascades 1.0
Page {
    attachedObjects: [
        
    ]
    actions: [
        ActionItem {
            id: sort
            title: "Sort"
            //imageSource:
            ActionBar.placement : ActionBarPlacement.OnBar

        },
        ActionItem {
            id: sort1
            title: "Sort1"
            //imageSource:
            ActionBar.placement: ActionBarPlacement.OnBar

        },
        ActionItem {
            id: sort2
            title: "Sort2"
            //imageSource:
            ActionBar.placement: ActionBarPlacement.OnBar

        },
        ActionItem {
            id: sort3
            title: "Sort3"
            //imageSource:
            ActionBar.placement: ActionBarPlacement.OnBar

        },
        ActionItem {
            id: sort4
            title: "Sort4"
            //imageSource:
            ActionBar.placement: ActionBarPlacement.OnBar

        }
    ]
    
    property alias gameData: gameList3.data
    
    content: Container {
     //   background: Color.Black

        GamesList {
            id: gameList3
            data: "models/items.xml"
        }
    }
}
