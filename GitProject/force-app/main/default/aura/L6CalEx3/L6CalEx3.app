<aura:application extends="force:slds">
    <aura:attribute name="fname" type="string" />
    <aura:attribute name="lname" type="string"/>
    <aura:attribute name="sal" type="integer"/>
    <aura:attribute name="tax" type="integer"/>
    <aura:attribute name="nsal" type="integer"/>
    
    
    <div style="border:2px solid black;margin:100px;padding:20px;width:600px;">
        <lightning:input label="First Name" type="text" value="{!v.fname}"/> 
        <lightning:input label="Last Name" type="text" value="{!v.lname}"/>
        <lightning:input label="Salary" type="number" value="{!v.sal}"/>
        <lightning:input label="Tax (%)" type="number" value="{!v.tax}" onblur="{!c.calculateNetSalary}"/>
        <lightning:input label="Net Salary" type="number" value="{!v.nsal}"/>
        <center>
            <lightning:button label="Calculate" onclick="{!c.calculateNetSalary}"/>
            <lightning:button label="Refresh" onclick="{!c.refreshData}"/> 
        </center>
    </div>
    
</aura:application>