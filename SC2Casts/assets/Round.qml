import bb.cascades 1.0

Container{
    property alias image:imageView.imageSource
    property bool hidden : false
    property variant navigator
    property variant url
    property variant page
    attachedObjects: [
        ComponentDefinition {
            id: gameview
            source: "GameView.qml"
        }
    ]
    ImageView{
    	id : imageView
       
        imageSource: "asset:///0.jpg"

        animations: [
            TranslateTransition {
                id: showRoundInternal
                toX:  -500
                duration: 500
            },
            TranslateTransition {
                id: hideRoundInternal
                toX: 500
                duration: 500
            }
        ]
//        gestureHandlers: [
//            TapHandler {
//                onTapped: {
//                    // The gesture state is a local property used to try one
//                    // gesture at the time, the first one is tap.
//                   // if (imageView.gestureState == "tap") {
//                        if (page != null) delete page;
//                        page = gameview.createObject();
//                        page.url = url
//                        navigator.push(page);
//                  //  }
//                }
//            }
//        ]
    }
    
    
    
    function showRound(){
        if ( hidden ){
            showRoundInternal.play();
            hidden = false;
        }
    }
    
    function hideRound(){
        if ( !hidden ) {
            hideRoundInternal.play();
            hidden = true;
        }
    }
    
    function isHidden(){
        return hidden;
    }
    
    function toggle(){
        if ( hidden ){
            showRound();
        } else {
            hideRound();
        }
    }
}