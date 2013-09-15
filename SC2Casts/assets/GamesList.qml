import bb.cascades 1.0
import bb.data 1.0

ListView {
    
    property alias ascending : dataModel.sortedAscending
    
	onCreationCompleted: {
     dataSource.load();
 }    
    property variant dataSrc
    property variant nav
    property variant searchText
    property variant dataList
    property variant indicator
    
   
    attachedObjects: [
        ComponentDefinition {
            id: gameDetail
            source: "GameDetailSheet.qml"
        }
       ,
        GroupDataModel { 
            id: dataModel
            sortingKeys: ["title"]
            sortedAscending: true
            grouping: ItemGrouping.None
            
       },
       
        DataSource {
            id: dataSource
            query: ""
            type: DataSourceType.Xml
            
            onDataLoaded: {
              // console.log("reloading!");
                dataModel.clear();
         //       console.log("theDataList -> "+data.listItem);
                dataModel.insertList(data.listItem);
                dataList = data.listItem
                myIndicator.stop();
            }
            onError: {
              //  console.log("I encounterd a data error ")
            }
            source: dataSrc
        }
    ]
    
    dataModel : dataModel


    listItemComponents: [
        ListItemComponent{
          type: "date"
          content : Container {
              
              layout:StackLayout{
                  
              }
              preferredWidth:1280
              horizontalAlignment: HorizontalAlignment.Fill
                background: Color.create("#ff242424")
                Label{
                  text: ListItemData.title
                    textStyle.color: Color.White
                    textStyle.fontSize: FontSize.XLarge
                }
          }  
        },
        ListItemComponent{
          type: "game"
          content: Container{}  
        },
        ListItemComponent {
            type: "item"
            content: GameDescription {
                preferredWidth: 1280
                maxWidth:1280
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment : VerticalAlignment.Fill
                title : ListItemData.title.replace("vs", "\n");
                description: {
                    var desc = ListItemData.description
                    var end = desc.indexOf("/");
                    return desc.substring(0, end);
                }
                race1: ListItemData.race1
                race2: ListItemData.race2
                casters: {
                    var beg = ListItemData.description.indexOf(":")+1;
                    var end = ListItemData.description.lastIndexOf("-");
                    return ListItemData.description.substring(beg,end);
                }
            }
        }
    ]
    onTriggered: {
        var index = indexPath;
        var chosenItem = dataModel.data(index);
        var page = gameDetail.createObject();
        page.nav = nav
        page.data = chosenItem
        page.title = chosenItem.title
        page.description = getMatchInfo(chosenItem.description);
        page.casters = getCasters(chosenItem.description)
        page.additional = getAdditionalInfo(chosenItem.description);
        nav.push(page); 
    }
    function getMatchInfo(str){
        var desc = str
        var end = str.indexOf("/");
        return str.substring(0, end);
    }
    function getCasters(str){
        var beg = str.indexOf(":")+1;
        var end = str.lastIndexOf("-");
        return str.substring(beg,end);
    }
    
    function getAdditionalInfo(str){
        var beg = str.lastIndexOf("-")+1;
        return str.substring(beg);
    }
    function objStr( obj ) {
        return JSON.stringify(obj);
    }
    
    function sc2log( logName, logDesc){
        return "["+logName+"]"+ " - "+ objStr(logDesc); 
    }
    onSearchTextChanged: {
        if(!myIndicator.running){
    	   myIndicator.start();     
    	}   
        var size = dataList.length;
      
        var i = 0;
        var count = 0;
        var games = new Array();
        dataModel.clear();
        var empty = true;
        for(i = 0; i < size; i++){
            var title = dataList[i].title;
            var desc = dataList[i].description;
            if(stringContains(searchText.toLowerCase(), title, desc)){
                dataModel.insert(dataList[i]);
                empty = false;
            }
        }
        if( empty == true ){
            dataModel.insert({"description":"", "race1":"", "race2":"", "title":"No matches matching \""+searchText+"\""});
            myIndicator.stop();
        }
    }
    function stringContains(str, title, desc){
        if(str == ""){
            return true;
        }
        var titleContains = ((title.toLowerCase()).indexOf(str)) != -1;
        var descContains = ((desc.toLowerCase()).indexOf(str)) != -1;
        return titleContains || descContains
    }
    
}

 