({
	calculateNetSalary : function(component, event, helper) {
		var salaryVal = component.get("v.sal");
        var taxVal = component.get("v.tax");
        var netSalary = (salaryVal)-(salaryVal*taxVal/100);
        component.set("v.nsal",netSalary);
	},
    refreshData : function(component, event, helper) {
		component.set("v.fname",null);
        component.set("v.lname",null);
        component.set("v.sal",null);
        component.set("v.tax",null);
        component.set("v.nsal",null);
	} 
})