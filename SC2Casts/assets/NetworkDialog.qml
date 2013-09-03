import bb.cascades 1.0

Dialog {
    id: myDialog
    onOpened: {
        showDialog.checked = _store.get("alertToggleObjectName", true);
    }
    Container {
        layout:StackLayout{ orientation: LayoutOrientation.TopToBottom }
        background: Color.create("#ff000000")
        Label {
            text:"Warning Mobile Data Usage"
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
            textStyle.fontWeight: FontWeight.Bold
        }//Label
        Label{
            text: "Streaming video content may incur costs additional costs from your telephone carrier. We advise you connect to Wi-Fi to continue watching. You can uncheck this dialog and continue streaming through your Mobile Data connection."
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            autoSize.maxLineCount: 7
            multiline: true
        }//Label
        Divider{  bottomPadding: 50 }//Divider
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
            }
            text: "Don't show this dialog again"
            preferredWidth : 720
            checked: true
        }//CheckBox
        Button {
            id: dialogButton
            horizontalAlignment: HorizontalAlignment.Center
            text: "Back"
            onClicked: {
                if ( dialogButton.text == "OK"){
                    myDialog.close();
                } else {
                    myDialog.close();
                }
            }
        }//Button
    }//Container
}//Dialog