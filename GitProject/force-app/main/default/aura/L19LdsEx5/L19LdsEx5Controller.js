({
	onSuccessAction : function(component, event, helper) {
        event.preventDefault();// it just stops the standard submit.
		console.log("Account has been created successfully.");
        component.set("v.flag",false); // hide the edit form
        component.set("v.flag",true); // creates a new form
        component.set("v.confirmationMsg",true); 
        console.log("111");
	},
    onsubmitAction : function(component, event, helper){
       // event.preventDefault();// it just stops the standard submit.
        var evtFields = event.getParam("fields"); // list of all the fields of that objectAppiName
        evtFields["Rating"] ='Hot';
        evtFields["BillingCountry"] = 'India';
        evtFields["BillingCity"] = 'Hyderabad';
        component.find("rec").submit(evtFields); 
         console.log("222");
    }
})