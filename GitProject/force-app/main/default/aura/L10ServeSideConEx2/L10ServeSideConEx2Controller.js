({
	doInvoke : function(component, event, helper) { 
        var action = component.get("c.DisplayName");//action 是调用，但还没有取值， component代表前面的app，app要用这个方法了
        action.setCallback(this,function(response){ //响应，后台返给前台一个结果，所有内容都在这个response里
            var state = response.getState();  //返回state，有成功或者失败等重要的值，
            console.log(state);
            if(state == 'SUCCESS'){
                var result = response.getReturnValue(); //result是class method里的返回值，那句话
                console.log(result); 
                component.set("v.myName",result);// 给前台v.myName赋值，赋的是后台返回的结果result
            }
            
            //component.set("v.myName",response.getReturnValue());
        });
        $A.enqueueAction(action);  //前面是调用，类似给了一个工作计划，这句话才是执行
	}
})