({
	onSuccessAction : function(component, event, helper) {
		console.log("Account has been created successfully.");
        component.set("v.flag",false); // hide the edit form
        component.set("v.flag",true); // creates a new form
        component.set("v.confirmationMsg",true); 
	} 
})