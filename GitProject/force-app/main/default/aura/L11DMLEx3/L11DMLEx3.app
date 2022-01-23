<aura:application extends="force:slds" controller="CustomerRegistrationClass1"> 
    <aura:attribute name="accountRecord" type="Account" default="{
                                                                  'sobjectType':'Account'
                                                                 }"/>
    
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/> 
    
    <div style="margin-left:100px;margin-top:100px;height:300px;width:700px;">
    	<lightning:card title="Customer Registration Form" iconName="standard:account">
        	<aura:set attribute="actions">
            	<lightning:button label="Save" onclick="{!c.saveData}"/>
                <lightning:button label="Cancel" onclick="{!c.cancelData}"/>
            </aura:set>
            <div style="padding:20px;">
            	<lightning:input label="Name" value="{!v.accountRecord.Name}"/>
            	<lightning:input label="Phone" value="{!v.accountRecord.Phone}"/>
            	<lightning:input label="Industry" value="{!v.accountRecord.Industry}"/>
            </div>
            
        </lightning:card>
    </div>
</aura:application>