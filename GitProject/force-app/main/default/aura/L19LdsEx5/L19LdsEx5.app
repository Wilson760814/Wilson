<aura:application extends="force:slds">
    <aura:attribute name="flag" type="boolean" default="true"/>
    <aura:attribute name="confirmationMsg" type="boolean" default="false" />
    
    <aura:if isTrue="{!v.flag}"> 
        <div style="margin-left:100px;margin-top:100px;width:500px;border:1px solid;">
            <lightning:recordEditForm aura:id="rec"  objectApiName="Account"  onsuccess ="{!c.onSuccessAction}" onsubmit="{!c.onsubmitAction}"> 
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
        	<ui:message title="Confirmation" severity="confirm" closable="true">
                Account has been created successfully.
			</ui:message>
        </div>
    </aura:if>
</aura:application>