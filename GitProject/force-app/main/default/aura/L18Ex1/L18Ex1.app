<aura:application extends="force:slds">
    <lightning:recordViewForm recordId="0015g00000XhT4vAAF" objectApiName="Account">
        <div style="margin-left:100px;margin-top:100px;width:500px;border:1px solid black;">
            <lightning:card title="Customer" iconName="standard:account">
                <div style="padding:20px;">
                	<lightning:outputField fieldName="Name"/> 
                	<lightning:outputField fieldName="Phone" />
                	<lightning:outputField fieldName="Industry" />
                </div>
            </lightning:card>
        </div>
    </lightning:recordViewForm>
</aura:application>