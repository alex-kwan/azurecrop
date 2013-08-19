import bb.cascades 1.0


    Container {
        maxWidth: 334.0
        maxHeight: 400
        background: Color.Black

		layout : DockLayout{
		    
		}
    translationY: 0.0
    Container{
		    layout:DockLayout{
		        
		    }

        translationY: 40.0
        ImageView {
                imageSource: "asset:///0.jpg"
                horizontalAlignment: HorizontalAlignment.Right
            translationY: -20.0

        }
            Container {
                layout: DockLayout {
                }
                horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
                translationY: -20.0
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
                translationY: 0.0

            }
            }

        }
		
		Container {
        translationY: 10.0
        //  background: Color.create("#d85a5764")
            Label {

                text: "Recent Games"
                maxHeight: 50
                minWidth:344
                textStyle.color: Color.White
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.textAlign: TextAlign.Left
            translationX: 20.0

        }
        }
		
		
		
    }

