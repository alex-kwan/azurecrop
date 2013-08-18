// Application with UI adaptability support template
import bb.cascades 1.0

// create application UI page
Page {
    Container {
       property alias webURL : webViewHtml.url
        layout: DockLayout {
        }
        AppBackground {
            // setup application background
            //            verticalAlignment: VerticalAlignment.Fill
            //            horizontalAlignment: HorizontalAlignment.Fill
        }
        Container {
            //    horizontalAlignment: HorizontalAlignment.Fill
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: qsTr("SC2 Casts Game")
                textStyle.base: SystemDefaults.TextStyles.TitleText
                textStyle.color: Color.Black
            }
            ImageView{
                imageSource: QUrl("http://img.youtube.com/vi/oeNNAhMEyUY/0.jpg")
            }
            WebView {

                id: webViewHtml
                url: "http://www.youtube.com/embed/gXu_SerIqr0?feature=player_embedded"
                minWidth: 500.0
                minHeight: 500.0
                settings.zoomToFitEnabled: true

            }
        }
//        attachedObjects: [
//            AppOrientationHandler {
//                // custom orientation handler
//                // the different handler is used for 720x720 in this template
//                // to disable oriantation adaptability for this kind of devices
//                id: orientationHandler
//            }
//        ]
    }
}
