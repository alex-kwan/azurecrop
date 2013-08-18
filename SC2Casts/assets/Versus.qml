import bb.cascades 1.0

Container {
    
    property string race1
    property string race2
    
    layout: DockLayout {
    	
    }

   // background: Color.create("#ff59ffff")
    maxWidth: 300
  //  maxHeight: 100
    leftMargin: 210.0
    leftPadding: -30
    rightPadding: -30
    topPadding: -30
    bottomPadding: -30
    ImageView {
        id :raceOne
        imageSource: "asset:///images/protoss-icon.png"
        scaleX: 0.6
        scaleY: 0.6
        horizontalAlignment: HorizontalAlignment.Left
        //verticalAlignment: VerticalAlignment.Center
        

    }
    ImageView {
        id : raceTwo
        imageSource: "asset:///images/protoss-icon.png"
        scaleX: 0.6
        scaleY: 0.6
        horizontalAlignment: HorizontalAlignment.Right
       // verticalAlignment: VerticalAlignment.Center
    }
    
    onRace1Changed : {
        raceOne.imageSource = getImage(race1);
    }
    
    onRace2Changed : {
        raceTwo.imageSource = getImage(race2);
    }
    
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