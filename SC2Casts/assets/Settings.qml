import bb.cascades 1.0
Sheet {
    onOpened: {
        alertToggleID.checked = _app.get("alertToggleObjectName", "false")=="true"?true:false;
    }
    id:settingssheet
    content : Page{
        titleBar: TitleBar {
            title: "Settings"
            dismissAction: ActionItem {
                title: "Back"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {settingssheet.close();}
            }//dismissAction
        }//TitleBar
        Container {
	        layout:StackLayout {orientation: LayoutOrientation.TopToBottom}
            Container{
                preferredWidth : 1280
                topPadding: 25
                rightPadding: 25
                layout:DockLayout{}
                horizontalAlignment: HorizontalAlignment.Fill
                leftMargin: 50.0
                leftPadding: 50
                Label{
                    maxWidth: 500
                    leftMargin: 50
                    id: networkWarningTitle
                    
                    text: "Don't display alert when viewing games on Mobile Data"
                    multiline: true
                    autoSize.maxLineCount: 5
                    verticalAlignment: VerticalAlignment.Center
                }//Label
                CheckBox {
                    id:alertToggleID
                    objectName: "alertToggleObjectName"
                    checked: _app.get("alertToggleObjectName","false") == "true"?true:false;
                    horizontalAlignment: HorizontalAlignment.Right
                    onCheckedChanged: {
                        _app.set("alertToggleObjectName", alertToggleID.checked ? "true" : "false");
                    }
                    

                }//ToggleButton
            }//Container
	        Divider{
                topMargin: 25
	        }//Divider
	        Container{
	            preferredWidth: 1280
	            rightPadding: 50
                leftPadding: 50
	            layout:DockLayout{}
                horizontalAlignment: HorizontalAlignment.Fill
                Label{
	                text: "Active Frame Preview"
                    horizontalAlignment: HorizontalAlignment.Left
                    verticalAlignment: VerticalAlignment.Center
                }//Label
                ActiveFramePreview{
                    id:activeFramePreview
                    horizontalAlignment: HorizontalAlignment.Right
                    verticalAlignment: VerticalAlignment.Center
                    rightMargin: 500.0
                    rightPadding:200
                    choice : activeFrameChooser.selectedValue
                }//ActiveFramePreview
	        }//Container
	        Container{
                topMargin: 25
	    	    preferredWidth : 1280
                rightPadding: 25
	    	    layout:DockLayout{}
	            horizontalAlignment: HorizontalAlignment.Fill
	            leftMargin: 50.0
	            leftPadding: 50
                Label{
	                maxWidth: 500
	                leftMargin: 50
	    	        id: favoriteRace
	    	        text: "Active Frame Race"
	                multiline: true
	                autoSize.maxLineCount: 5
                    horizontalAlignment: HorizontalAlignment.Left
                }//Label
                DropDown {
                	id: activeFrameChooser
                    maxWidth: 300
                    objectName:"activeFrameChooserObjectName"
                    horizontalAlignment: HorizontalAlignment.Right
                    onSelectedValueChanged: {
                        activeFramePreview.choice = selectedValue;
                        _app.set("activeFrameChooserObjectName", selectedValue);
                    }
                    Option{
                        text:"Protoss"
                        value:"P"
                        selected: _app.get("activeFrameChooserObjectName",null) == "P"
                    }//Option
                    Option{
                        text:"Zerg"
                        value:"Z"
                        selected: _app.get("activeFrameChooserObjectName",null) == "Z"
                    }//Option
                    Option{
                        text:"Terran"
                        value:"T"
                        selected: _app.get("activeFrameChooserObjectName",null) == "T"
                    }//Option
                }//DropDown
            }//Container   
        }//Container
    }//Page
}//Sheet
 
