({
	doInvoke : function(component, event, helper) { 
		// From here we need to invoke server side methods.
		
        // It invokes the server-side controller method.
        var method = component.get("c.DisplayName");//调用
    
        // This will add the action to the queue.
       $A.enqueueAction(method); //执行
	}
})