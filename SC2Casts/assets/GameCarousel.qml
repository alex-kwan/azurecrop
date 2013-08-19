import bb.cascades 1.0

Container{
    
    property variant nav
    property variant link
    property variant page
    attachedObjects: [
        ComponentDefinition {
            id: gameview
            source: "GameView.qml"
        }
    ]
    Container{
        layout:StackLayout{
            orientation: LayoutOrientation.LeftToRight

        }

        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom

            }

            Button {
                text: "Game 1"
                onClicked: {
                    image.imageSource = "asset:///images/test0.jpg";
                    link = "http://www.youtube.com/embed/UXbCKrqQJmU?rel=0&controls=0"
                }

            }
            Button {
                text: "Game 2"
                onClicked: {
                    image.imageSource = "asset:///images/test1.jpg";
                    link = "http://www.youtube.com/embed/nCVdPevt0J0?rel=0&controls=0"
                }

            }
            Button {
                text: "Game 3"
                onClicked: {
                    image.imageSource = "asset:///images/test2.jpg";
                    link = "http://www.youtube.com/embed/WfdC2gmpXo?rel=0&controls=0"
                }

            }
            Button {
                text: "Game 4"

            }
            Button {
                text: "Game 5"

            }
        }

        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            ImageView {
                id: image
                imageSource: "asset:///0.jpg"
                onTouch: {
                    if (page != null) 
                    	delete page;
                    page = gameview.createObject();
                    page.url = link
                    nav.push(page);
                    
                }

            }
        }
        
    }
    
   
}