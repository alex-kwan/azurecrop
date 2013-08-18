import bb.cascades 1.0

Container {
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    
    property alias text: label.text
    property alias checked: checkBox.checked
    	
    
    CheckBox{
        id : checkBox
        checked: false
    }
    Label{
        id: label
        leftMargin: 10
        text: "Check Box"
    }
    
    onTextChanged:{
        console.log("Text has changed to:", text)
    }
    onCheckedChanged: {
        console.log("Check has changed to:", checked)
    }
}

