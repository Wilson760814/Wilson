({
	doinit : function(component, event, helper) {
		// Get Accounts
		var cols1 = [
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Account Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
        ];
        component.set("v.accountcolumns",cols1);
        
        var action1 = component.get("c.getAccounts");
        action1.setCallback(this,function(response1){
           	var state1 = response1.getState();
            if(state1 == 'SUCCESS'){
                component.set("v.lstAccounts",response1.getReturnValue());
            }
        });
        $A.enqueueAction(action1); 
		// Get Contacts
		var cols2 = [
            {label: 'Contact name', fieldName: 'LastName', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'text'}
        ];
        component.set("v.contactcolumns",cols2);
        
        var action2 = component.get("c.getContacts");
        action2.setCallback(this,function(response2){
           	var state2 = response2.getState();
            if(state2 == 'SUCCESS'){
                component.set("v.lstContacts",response2.getReturnValue());
            }
        });
        $A.enqueueAction(action2);  
	}
})