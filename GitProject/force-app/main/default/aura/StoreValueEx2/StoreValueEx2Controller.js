({
	showdata : function(component, event, helper) {
        // get() : To get the value from the attribute
        // set() : to set the value to the attribute.
        var firstName = component.get("v.fname");
        console.log(firstName);
        var lastName = component.get("v.lname");
        console.log(lastName);
        var email = component.get("v.email");
        console.log(email);
        var phone = component.get("v.phone");
        console.log(phone);
        var age = component.get("v.age");
        console.log(age);
	}, 
    cleardata : function(component, event, helper){
        component.set("v.fname",null);
        component.set("v.lname",null);
        component.set("v.email",null);
        component.set("v.phone",null);
        component.set("v.age",null);
    }
})