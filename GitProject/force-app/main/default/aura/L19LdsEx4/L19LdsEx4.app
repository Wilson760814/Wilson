<aura:application extends="force:slds">
    <aura:attribute name="flag" type="boolean" default="true"/>
    <aura:attribute name="confirmationMsg" type="boolean" default="false" />
    
    <aura:if isTrue="{!v.flag}"> 
        <div style="margin-left:100px;margin-top:100px;width:500px;border:1px solid;">
            <lightning:recordEditForm  objectApiName="Account" onsuccess ="{!c.onSuccessAction}"> 
                <lightning:card title="Edit Customer" iconName="standard:account">
                    <div style="padding:20px;">
                        <lightning:inputField fieldName="Name" />  
                        <lightning:inputField fieldName="Phone" />
                        <lightning:inputField fieldName="Industry"/>
                    </div>
                    <aura:set attribute="actions">
                        <lightning:button label="Save" type="submit" />
                    </aura:set>
                    </lightning:card> 
            </lightning:recordEditForm>
        </div> 
    </aura:if>
    
    
    <aura:if isTrue="{!v.confirmationMsg}">
    	<div style="margin-left:100px;margin-top:20px;width:500px;">
        	<p style="color:green;font-size:20px;">Account has been created successfully.</p>
        </div>
    </aura:if>
</aura:application>