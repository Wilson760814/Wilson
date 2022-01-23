({
	showData : function(component, event, helper) {
        console.log('Method started....');
		var acc1 = event.getParam("acc"); 
        console.log(JSON.stringify(acc1)); 
        component.set("v.accountData",acc1);  
        component.set("v.flag",true); 
	}
})