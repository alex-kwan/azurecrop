import bb.cascades 1.0
Container {
    property variant nav
    attachedObjects: [
        ComponentDefinition {
            id: gameview
            source: "GameView.qml"
        }
    ]
    layout: DockLayout {
    }
    Container {
        layout: DockLayout {

        }
        Container {
            layout: AbsoluteLayout {

            }

            Round {
                id: image0
                image: "asset:///images/test0.jpg"
                navigator: nav
                url: "http://www.youtube.com/embed/UXbCKrqQJmU?rel=0&controls=0"
            }

            Round {
                id: image1
                image: "asset:///images/test1.jpg"
                navigator: nav
                url: "http://www.youtube.com/embed/nCVdPevt0J0?rel=0&controls=0"
            }

            Round {
                id: image2
                image: "asset:///images/test2.jpg"
                navigator: nav
                url: "http://www.youtube.com/embed/Z6zMgUOHzDg?rel=0&controls=0"

            }
            gestureHandlers: [
                TapHandler {
                    onTapped: {

                    }
                }
            ]
        }

        Container {
            id: swipe

            property int downX: 0
            property int downY: 0
            property variant component: dot0

            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 480
            background: Color.create("#a81f241f")
            verticalAlignment: VerticalAlignment.Bottom
            preferredHeight: 100.0

            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight

            }
            leftPadding: 50.0
            ImageView {
                id: dot0
                imageSource: "asset:///images/selecteddot.png"
                verticalAlignment: VerticalAlignment.Center
                leftMargin: 15.0
                rightMargin: 15.0
            }
            ImageView {
                id: dot1
                imageSource: "asset:///images/whitedog.png"
                verticalAlignment: VerticalAlignment.Center
                leftMargin: 15.0
                rightMargin: 15.0
            }
            ImageView {
                id: dot2
                imageSource: "asset:///images/whitedog.png"
                verticalAlignment: VerticalAlignment.Center
                leftMargin: 15.0
                rightMargin: 15.0
            }
            ImageView {
                id: dot3
                imageSource: "asset:///images/whitedog.png"
                verticalAlignment: VerticalAlignment.Center
                leftMargin: 15.0
                rightMargin: 15.0
            }
            ImageView {
                id: dot4
                imageSource: "asset:///images/whitedog.png"
                verticalAlignment: VerticalAlignment.Center
                leftMargin: 15.0
                rightMargin: 15.0
            }

            onTouch: {
                if (event.isDown()) {
                    downX = event.windowX;
                    downY = event.windowY;
                } else if (event.isUp()) {
                    var yDiff = downY - event.windowY;
                    // take absolute value of yDiff
                    if (yDiff < 0) yDiff = -1 * yDiff;
                    // I check if the minimum y movement is less than 200.  Don't want to move left or right if
                    // the user is actually want to move up or down.
                    if ((yDiff) < 200) {
                        if ((downX - event.windowX) > 0) {
                            dot1.imageSource = "asset:///images/whitedog.png"
                            dot0.imageSource = "asset:///images/selecteddot.png"
                            image2.toggle();
                        } else { /*if ((event.windowX - downX) > 320) { */
                            dot0.imageSource = "asset:///images/whitedog.png"
                            dot1.imageSource = "asset:///images/selecteddot.png"
                            image2.toggle();
                        }
                    }
                }
            }

        }
    }

}