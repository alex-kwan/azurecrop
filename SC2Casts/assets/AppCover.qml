import bb.cascades 1.0


    Container {
      
        background: Color.Black

		layout : DockLayout{
		    
		}
    	ImageView
    	{
    	    id: imageView
	        imageSource: "asset:///images/zerg_icon_white_200x200.png"
	        horizontalAlignment: HorizontalAlignment.Center
	        verticalAlignment: VerticalAlignment.Center

    	}
    	
onVisibleChanged: {
    var race = _store.get("activeFrameChooserObjectName", null);
    console.log("111This is the current active frame race -> " + race);
    if( race == "P"){
        imageView.imageSource = "asset:///images/protoss_icon_white_200x200.png"
    } else if ( race == "Z" ) {
        imageView.imageSource = "asset:///images/zerg_icon_white_200x200.png"
    } else {
        imageView.imageSource = "asset:///images/terran_icon_white_200x200.png"
    }

}
    onLayoutChanged: {
        var race = _store.get("activeFrameChooserObjectName", null);
        console.log("111This is the current active frame race -> " + race);
        if( race == "P"){
            imageView.imageSource = "asset:///images/protoss_icon_white_200x200.png"
        } else if ( race == "Z" ) {
            imageView.imageSource = "asset:///images/zerg_icon_white_200x200.png"
        } else {
            imageView.imageSource = "asset:///images/terran_icon_white_200x200.png"
        }
    
    }
 }

