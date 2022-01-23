({
	doinit : function(component, event, helper) {
		// Get Accounts
		var cols1 = [
            {label: 'Account Id', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Account Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Website', fieldName: 'Website', type: 'text'}
        ];
        
        component.set("v.accountcolumns",cols1);
    
        var action1 = component.get("c.getAccounts");
        action1.setCallback(this,function(response1){
           	var state1 = response1.getState();
            if(state1 == 'SUCCESS'){
                
                component.set("v.lstAccounts",response1.getReturnValue());
                component.set("v.flag",true);
            }
        });
        $A.enqueueAction(action1); 
		 
	}
})