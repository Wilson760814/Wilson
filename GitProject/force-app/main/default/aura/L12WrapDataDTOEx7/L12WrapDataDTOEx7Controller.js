({
	doinit : function(component, event, helper) {
        //getData
        var action = component.get("c.getData");
        var cols1 = [
            {label: 'Account name', fieldName: 'accName', type: 'text'},
            {label: 'Account Phone', fieldName: 'accPhone', type: 'text'},
            {label: 'Account Industry', fieldName: 'accIndustry', type: 'text'},
            
        ];
        var cols2 = [ 
            {label: 'Contact LastName', fieldName: 'conLastName', type: 'text'},
            {label: 'Contact Email', fieldName: 'conEmail', type: 'text'}
        ];
        
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.Data",result);
                component.set("v.columns1",cols1);
                component.set("v.columns2",cols2);
            }
        });
        $A.enqueueAction(action);
    }
})