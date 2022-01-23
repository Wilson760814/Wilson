<aura:application extends="force:slds">
    <aura:attribute name="acc" type="Sobject" default="{'sobjectType':'Account'}"/>
    
    <lightning:input label="Account Name" value="{!v.acc.Name}"/>
    <lightning:input label="Account Phone" value="{!v.acc.Phone}"/> 
    <lightning:input label="Industry" value="{!v.acc.Industry}"/>
    
    <lightning:button label="Submit" onclick="{!c.invoke}"/>
</aura:application>