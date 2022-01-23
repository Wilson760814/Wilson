({
	invoke : function(component, event, helper) {
		var fname = component.find("fname").get("v.value");
        console.log('First Name'+fname);
        
        var lname = component.find("lname").get("v.value");
        console.log('Last Name'+lname);
        
        var phone = component.find("ph").get("v.value");
        console.log('Phone'+phone); 
	}
})