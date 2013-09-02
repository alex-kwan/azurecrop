import bb.cascades 1.0

Dialog {
    id: myDialog
    
    Container {
        
        layout:StackLayout{
            orientation: LayoutOrientation.TopToBottom

        }
        Label {
            text:"Warning Mobile Data Usage"
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
            textStyle.fontWeight: FontWeight.Bold
        }
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        Label{
            text: "Streaming video content may incur costs additional costs from your telephone carrier. We advise you connect to Wi-Fi to continue watching. You can check this dialog and continue streaming through your Mobile Data connection."
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            autoSize.maxLineCount: 7
            multiline: true
        }
        Divider{
            bottomPadding: 50
        }
        CheckBox{
            id: showDialog
            horizontalAlignment: HorizontalAlignment.Center
            enabled: _store.get("alertToggleObjectName", true)
            onCheckedChanged: {
                _store.set("alertToggleObjectName", showDialog.enabled );
                if( showDialog.checked) {
                    dialogButton.text = "OK"
                } else {
                    dialogButton.text = "Back"
                }
                myDialog.close();
            }
            text: "Don't show this dialog again"
            preferredWidth : 720
            checked: true
        }
        Button {
            id: dialogButton
            horizontalAlignment: HorizontalAlignment.Center
            text: "Back"
            onClicked: {
                if ( dialogButton.text == "OK"){
                    
                } else {
                    
                }
            }
        }
        
        function foo(isEnabled){
            if( isEnabled ){
                
            } else {
                
            }
        }
    }
}