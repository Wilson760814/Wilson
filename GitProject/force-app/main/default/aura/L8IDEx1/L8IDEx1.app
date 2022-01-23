<aura:application extends="force:slds">
    
    <lightning:input label="First Name" type="text" aura:id="fname"/> 
    <lightning:input label="Last Name" type="text" aura:id="lname"/>
    <lightning:input label="Phone" type="phone" aura:id="ph"/>
    
    <lightning:button label="Submit" onclick="{!c.invoke}"/>  
</aura:application>