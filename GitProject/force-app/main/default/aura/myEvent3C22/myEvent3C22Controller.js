({
	displayData : function(component, event, helper) {
		var accRecord = event.getParam("acc");
        if(accRecord != ''){
            component.set("v.acc",accRecord);
            component.set("v.flag",true);
        }
	}
})