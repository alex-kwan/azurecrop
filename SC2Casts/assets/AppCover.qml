import bb.cascades 1.0


    Container {
        maxWidth: 334.0
        maxHeight: 396.0
        background: Color.Black

		layout : DockLayout{
		    
		}
		Container{
		    layout:DockLayout{
		        
		    }
           
            ImageView {
                imageSource: "asset:///0.jpg"
                horizontalAlignment: HorizontalAlignment.Right

            }
            Container {
                layout: DockLayout {
                }
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
                translationY: -40.0
                minWidth : 334
                background: Color.create("#c15d5454")
                Label {
                    text: "12 new games"
                    textStyle.color: Color.White
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Bottom
                    translationX: 0.0
                    textStyle.fontStyle: FontStyle.Normal
                    textStyle.fontWeight: FontWeight.Normal

                }
            }

        }
		
		Container {
            background: Color.create("#d85a5764")
            Label {

                text: "Recent Games"
                maxHeight: 35
                minWidth:344
                textStyle.color: Color.White
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.textAlign: TextAlign.Left

            }
        }
		
		
		
    }

