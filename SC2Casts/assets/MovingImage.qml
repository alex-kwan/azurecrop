import bb.cascades 1.0

ImageView {
    property alias source : view.imageSource
    
    id : view
    onTouch: {
        
        if( event.touchtype == TouchType.Move && event.x ){
        }
        parallel.play();
    }

    animations: [
        ParallelAnimation {
            id: parallel
            TranslateTransition {
                duration: 1000
                fromX: 0
                toX: 100
            }
            FadeTransition {
                id: fade
                duration: 1000
                easingCurve: StockCurve.CubicOut
                fromOpacity: 1.0
                toOpacity: 0.2
            }
        }

    ]
    imageSource: "asset:///2.jpg"

}
