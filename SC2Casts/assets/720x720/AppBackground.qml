// Application with UI adaptability support template
import bb.cascades 1.0

Container {
    // use background image of size 720x720
    background: backgroundPattern.imagePaint
    attachedObjects: [
        ImagePaintDefinition {
            id: backgroundPattern
            imageSource: "asset:///images/background.png"
        }
    ]
}
