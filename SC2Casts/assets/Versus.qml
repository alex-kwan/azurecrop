import bb.cascades 1.0

Container {
    
    property string race1
    property string race2
    
    layout: AbsoluteLayout {
    	
    }
    
   
    ImageView {
        id :raceOne
        imageSource: getImage("P");
        
        translationX: 0.0 + raceOffset("P");
    }
    ImageView {
        id : raceTwo
        imageSource: getImage("T");
        horizontalAlignment: HorizontalAlignment.Right
        translationX: 200 + raceOffset("T");
    }
    
    onRace1Changed : {
        raceOne.imageSource = getImage(race1);
        raceOne.translationX = 0 + raceOffset(race1);
    }
    
    onRace2Changed : {
        raceTwo.imageSource = getImage(race2);
        raceTwo.translationX = 200 + raceOffset(race2);
        
    }

    maxHeight: 200
    maxWidth: 400
    
    background: Color.Black
    
    function raceOffset(str){
        if( str == "P"){
            return 50;
        }
        return 0;
    }
    
    function getImage(str){
        var image = "";
        if ( str == "P")
        	image = "asset:///images/protoss_icon_white_200x200.png";
        else if (str == "Z")
            image = "asset:///images/zerg_icon_white_200x200.png";
        else if ( str == "T")
            image = "asset:///images/terran_icon_white_200x200.png";
        return image;
    }
    


}