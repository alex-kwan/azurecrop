import bb.cascades 1.0


    Container {
      
        background: Color.Black

		layout : DockLayout{
		    
		}
    	ImageView
    	{
    	    id: imageView
	        imageSource: "asset:///images/terran_icon_white_200x200.png"
	        horizontalAlignment: HorizontalAlignment.Center
	        verticalAlignment: VerticalAlignment.Center

    	}
    	
   // 	onVisibleChanged: {
         
  //   }
    //	on
     onVisibleChanged: {
            var type = Math.floor(3 * Math.random());
            switch( type ){
                case 0: 
                    imageView.imageSource = "asset:///images/terran_icon_white_200x200.png"
                    break;
                case 1: 
                    imageView.imageSource = "asset:///images/protoss_icon_white_200x200.png"
                    break;
                case 2: 
                    imageView.imageSource = "asset:///images/zerg_icon_white_200x200.png"
                    break;
                default: break;
            }
          }
    }

