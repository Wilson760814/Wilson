({
	displayAccounts : function(component, event, helper) {
		// Columns
		var cols = [
            {label:'Account Name',fieldName:'Name',type:'text'},
            {label:'Account Phone',fieldName:'Phone',type:'text'},
            {label:'Account Industry',fieldName:'Industry',type:'text'}
        ];
        component.set("v.myColumns",cols); 
        // Data
        var action=component.get("c.getAccounts");//调用后台方法apex class 前端走到了后端
        action.setCallback(this,function(response){
           	var state = response.getState();
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                component.set("v.lstAccounts",res);
                //component.set("v.flag",true);
                var btnflag = event.getParam("flag");
               component.set("v.flag1",btnflag); 
               
            }
        });
        $A.enqueueAction(action);
	}
})

/*
({
	displayAccounts : function(component, event, helper) {
		// Columns
		var cols = [
            {label:'Account Name',fieldName:'Name',type:'text'},
            {label:'Account Phone',fieldName:'Phone',type:'text'},
            {label:'Account Industry',fieldName:'Industry',type:'text'}
        ];
        component.set("v.myColumns",cols); 
        // Data
        var action=component.get("c.getAccounts");//调用后台方法apex class 前端走到了后端
        action.setCallback(this,function(response){
           	var state = response.getState();
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                component.set("v.lstAccounts",res);
                component.set("v.flag",true);
                 
               
            }
        });
        $A.enqueueAction(action);
	}
})

({
displayAccounts : function(component, event, helper) {
// Columns
var cols = [
{label:'Account Name',fieldName:'Name',type:'text'},
{label:'Account Phone',fieldName:'Phone',type:'text'},
{label:'Account Industry',fieldName:'Industry',type:'text'}
];
component.set("v.myColumns",cols);
// Data
var action=component.get("c.getAccounts");
action.setCallback(this,function(response){
var state = response.getState();
if(state == 'SUCCESS'){
var res = response.getReturnValue();
var flg = event.getParam("flag");
if(flg){
component.set("v.lstAccounts",res);
component.set("v.flag1",true);
console.log('doSave');
console.log('v.flag1=>>'+component.get("v.flag1"));
}else{
component.set("v.flag1",flg);
console.log('doCancel');
console.log('v.flag1=>>'+component.get("v.flag1"));
}
}
});
$A.enqueueAction(action);
}
})
*/