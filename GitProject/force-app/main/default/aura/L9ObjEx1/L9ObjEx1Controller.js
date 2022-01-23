({
	invoke : function(component, event, helper) {
		var name = component.get("v.acc.Name");
        console.log(name);
        var ph = component.get("v.acc.Phone");
        console.log(ph);
        var industry = component.get("v.acc.Industry");
        console.log(industry);
	}
})