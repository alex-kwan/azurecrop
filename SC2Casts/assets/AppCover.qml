import bb.cascades 1.0

Container{
    background: Color.Black
    layout : DockLayout{
    
    }
    Container {
	
			layout : DockLayout{
			    
			}
	background: Color.Black
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        ImageView
	    	{
                objectName:"TheLabel"
	    	    id: appCoverImg
                imageSource: "asset:///images/zerg_icon_white_200x200.png"
		        horizontalAlignment: HorizontalAlignment.Center
		        verticalAlignment: VerticalAlignment.Center
            scalingMethod: ScalingMethod.Fill
            loadEffect: ImageViewLoadEffect.FadeZoom

        }
	        function getImage(str){
	            var image = "";
	            if ( str == "P")
	                return "asset:///images/protoss_icon_white_200x200.png";
	            else if (str == "Z")
	                return "asset:///images/zerg_icon_white_200x200.png";
	            else if ( str == "T"){
	                return"asset:///images/terran_icon_white_200x200.png";
	            }
	        }
	    
	 }
}