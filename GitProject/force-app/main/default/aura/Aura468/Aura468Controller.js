({
	doinit : function(component, event, helper) {
		// Get Contacts
		var cols1 = [
            {label: 'First Name', fieldName: 'FirstName', type: 'text'},
            {label: 'Last Name', fieldName: 'LastName', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'text'},
                    ];
        component.set("v.Contactcolumns",cols1);
        
        var action1 = component.get("c.getContacts");
        var id =component.get("v.recordId");
            console.log(id);
        action1.setParams({idclass:id});
        action1.setCallback(this,function(response){
           	var state = response.getState();
            var result = response.getReturnValue();
            var AccName = result.Name;
            var contacts = result.Contacts;
            console.log('result:  '+ result);
            console.log('state+result:  '+ state+'    '+result);
            console.log('AccName：  '+AccName);
            console.log('contacts:   '+contacts);
            console.log('contactssize:   '+contacts.length);
            if(state == 'SUCCESS'){
                component.set("v.lstconts",contacts);
                component.set("v.Contactsize",contacts.length);
                component.set("v.AccName",AccName);
            
            }
            
        });
        $A.enqueueAction(action1); 
		 
	}
})