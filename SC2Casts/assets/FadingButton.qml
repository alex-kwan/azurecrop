import bb.cascades 1.0

Button {
    text: "Fade me away"
    onClicked: parallel.play();
    animations: [
        ParallelAnimation {
            id: parallel
            TranslateTransition{
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
}