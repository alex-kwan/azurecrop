import bb.cascades 1.0

Container {
    
    property string race1
    property string race2
    
    layout: AbsoluteLayout {
    	
    }
    
   
    ImageView {
        id :raceOne
        imageSource: getImage("Z");
        translationY: -50
        translationX: -48 + raceOffset("Z")
        scaleX: 0.5
        scaleY: 0.5
    }
    ImageView {
        id : raceTwo
        imageSource: getImage("P");
        translationY: -50
        translationX: 55 + raceOffset("P");
        scaleX: 0.5
        scaleY: 0.5
    }
    
    onRace1Changed : {
        raceOne.imageSource = getImage(race1);
        raceOne.translationX = 0 + raceOffset(race1);
    }
    
    onRace2Changed : {
        raceTwo.imageSource = getImage(race2);
        raceTwo.translationX = 50 + raceOffset(race2);
        
    }

    maxHeight: 100
    maxWidth: 200
    background: Color.create("#c31d1b1a")
    function raceOffset(str){
        if( str == "P"){
            return 45;
        }
        else if ( str == "Z"){
            return 10;
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