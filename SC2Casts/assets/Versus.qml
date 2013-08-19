import bb.cascades 1.0

Container {
    
    property string race1
    property string race2
    
    layout: DockLayout {
    	
    }
    
   
    ImageView {
        id :raceOne
        imageSource: "asset:///images/zerg-icon.png"
    
        horizontalAlignment: HorizontalAlignment.Left
    }
    ImageView {
        id : raceTwo
        imageSource: "asset:///images/terran-icon.png"
        horizontalAlignment: HorizontalAlignment.Right
    }
    
    onRace1Changed : {
        raceOne.imageSource = getImage(race1);
    }
    
    onRace2Changed : {
        raceTwo.imageSource = getImage(race2);
    }

    maxHeight: 200
    maxWidth: 385
    
    background: Color.White
    
    function getImage(str){
        var image = "";
        if ( str == "P")
        	image = "asset:///images/protoss-icon.png";
        else if (str == "Z")
        	image = "asset:///images/zerg-icon.png";
        else if ( str == "T")
        	image = "asset:///images/terran-icon.png";
        return image;
    }
    


}