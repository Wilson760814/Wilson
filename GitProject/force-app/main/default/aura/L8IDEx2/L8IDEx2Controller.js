({
	add : function(component, event, helper) {
		var a = component.find("fv").get("v.value");
        console.log(a);
        var b = component.find("sv").get("v.value");
        console.log(b);
        var res = parseInt(a) + parseInt(b);
        console.log(res);
        component.find("res").set("v.value",res);
	},
    mul : function(component, event, helper){
        var a = component.find("fv").get("v.value");
        console.log(a);
        var b = component.find("sv").get("v.value");
        console.log(b);
        var res = parseInt(a) * parseInt(b); 
        console.log(res);
        component.find("res").set("v.value",res);
    }
})