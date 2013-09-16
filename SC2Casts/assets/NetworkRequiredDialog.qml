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
            maxHeight: 600
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            background: Color.create("#aa2c2c2c")
            Label{
	            text: qsTr("In order to view this game you will required a network connect to Wi-Fi or Cellular data to continue.")
                textStyle.color: Color.create("#ffffffff")
                autoSize.maxLineCount: 6
                multiline: true
            }
            Container{
                preferredWidth: 1280
                layout:DockLayout{
                    
                
                }
            }
            Container{
                layout:StackLayout{
                    orientation: LayoutOrientation.LeftToRight

                }
                Button{
                    text:qsTr("Cancel")
                    onClicked: {
                        dialog.close()
                    }
                }
                Button{
                    text:qsTr("Network Settings")
                    onClicked: {
                        dialog.close();
                        _app.invoke("sys.settings.target", "bb.action.OPEN","settings/view","settings://networkconnections"  )
                    }

                }
            }
	    }
	    
	    
	}   
}