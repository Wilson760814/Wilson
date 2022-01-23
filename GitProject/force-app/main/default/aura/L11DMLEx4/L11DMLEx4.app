<aura:application extends="force:slds" controller="CustomerDetailsController2">
    <!-- attribute declaration for the wrapper -->
    <aura:attribute name="accountRecord" type="CustomerDetailsController2.customerInfo"/>
    <aura:attribute name="strKey" type="string"/>
    <aura:attribute name="flag" type="boolean" default="false"/>
    
    <div style="margin-left:100px;margin-top:100px;height:100px;width:500px;">
        <lightning:input label="Industry" value="{!v.strKey}"/> <br/> 
        <lightning:button label="Search" onclick="{!c.searchData}"/>
    </div> 
    
    <aura:if isTrue="{!v.flag}"> 
    	<div style="margin-left:100px;margin-top:20px;height:400px;width:500px;">
            <lightning:card title="Customer Information" iconName="standard:account">
                <div style="padding:20px;border:1px solid green;">
                    <b>Name</b> 	:	{!v.accountRecord.accName} <br/>
                    <b>Phone</b>	:	{!v.accountRecord.accPhone} <br/>
                    <b>Industry</b>	:	{!v.accountRecord.accIndustry}
                </div>
            </lightning:card>
        </div>
    </aura:if>
    
</aura:application>