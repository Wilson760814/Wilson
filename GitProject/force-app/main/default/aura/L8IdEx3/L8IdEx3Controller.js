({
	invoke : function(component, event, helper) {
		var btnParam = event.getSource(); // Event Source Information (name,Id)
        
        // to get the name of the event
        var btnName = btnParam.get("v.name");
        console.log('Button Name '+btnName);
        
        // to get the Id of the event
        var btnId = btnParam.getLocalId();
        console.log('Button Id '+btnId);
        
        
        // Add
        if(btnName == 'btn1Name'){
            // Add logic
        }
         
        
        // Mul
        if(btnName == 'btn2Name'){
            // Mul logic
        }
        
        
	}
})