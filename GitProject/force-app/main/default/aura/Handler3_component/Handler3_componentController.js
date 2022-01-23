({
    // to initiate the attribute when a component is loaded.
    doInit : function(component){
        component.set("v.first",100);
        component.set("v.second",200);
        component.set("v.add",0);
        component.set("v.mul",0);
    },
    add : function(component, event, helper) {
		var a = component.get("v.first");
        var b = component.get("v.second");
        var result = (a+b);
        component.set("v.add",result);
        console.log(a);
        console.log(b);
        console.log(result);
	},
    mul : function(component, event, helper){
        var a = component.get("v.first");
        var b = component.get("v.second");
        var result = (a*b);
        component.set("v.mul",result);
        console.log(a);
        console.log(b);
        console.log(result);
    }
})