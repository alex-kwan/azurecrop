import bb.cascades 1.0

Dialog {
    id:dialog
    property variant data
    property variant title
    property variant nav
    
    
	Container{
	    preferredWidth: 768
	    preferredHeight: 1280
	        background: Color.create(0,0,0,0.5)
	    
	    layout: DockLayout{
	        
	    }
	    
	    Container{
	        bottomPadding:20
	        topPadding:20
	        leftPadding:20
	        rightPadding:20
            maxHeight: 500
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            background: Color.create("#aa2c2c2c")
            Label{
	            text: "In order to view this game there may be a significant amount of Mobile Data usage. We suggest you switch to Wi-Fi to proceed without incurring additional carrier costs."
                textStyle.color: Color.create("#ffffffff")
                autoSize.maxLineCount: 6
                multiline: true
            }
            Container{
                preferredWidth: 1280
                layout:DockLayout{
                    
                
                }
                Label{
                    text:"Don't display again"
                    horizontalAlignment: HorizontalAlignment.Left
                    verticalAlignment: VerticalAlignment.Top
                    textStyle.color: Color.create("#ffffffff")
                }
                CheckBox {
                    id:checkBoxToggle
                    checked: true
                    onCheckedChanged: {
                        _app.set("alertToggleObjectName", checkBoxToggle.checked?"true":"false");
                    }
                    horizontalAlignment: HorizontalAlignment.Right
                    verticalAlignment: VerticalAlignment.Top
                    onCreationCompleted: {
                        checkBoxToggle.checked = _app.get("alertToggleObjectName","true") == "true"? true: false;
                    }
                }

            }
            Container{
                layout:StackLayout{
                    orientation: LayoutOrientation.LeftToRight

                }
                Button{
                    text:"Close"
                    onClicked: {
                        dialog.close()
                    }
                }
                Button{
                    text:"Wi-Fi Setting"
                    onClicked: {
                        dialog.close();
                        _app.invoke("sys.settings.target", "bb.action.OPEN","settings/view","settings://wifi"  )
                    }

                }
            }
	    }
	    
	    
	}   
}