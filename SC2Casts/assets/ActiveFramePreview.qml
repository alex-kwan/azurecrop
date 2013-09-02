import bb.cascades 1.0

ImageView{
    property variant choice
    function getImage(str){
        var image = "";
        if ( str == "P")
            imageSource = "asset:///images/protoss_icon_white_200x200.png";
        else if (str == "Z")
            imageSource = "asset:///images/zerg_icon_white_200x200.png";
        else if ( str == "T"){
            imageSource = "asset:///images/terran_icon_white_200x200.png";
        }
    }
    
    onChoiceChanged:{
       getImage(choice);
    }
}
