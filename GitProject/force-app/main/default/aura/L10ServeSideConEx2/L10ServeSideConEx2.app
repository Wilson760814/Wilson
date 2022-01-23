<aura:application extends="force:slds" controller="Apexclass2">
    <aura:attribute name="myName" type="string" />
    <lightning:button label="Invoke" onclick="{!c.doInvoke}"/>   <br/>
    <br/>
    <p style="font-size:40px;color:blue;">{!v.myName}</p> 
</aura:application>