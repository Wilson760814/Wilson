<aura:application extends="force:slds">
    <aura:attribute name="fname" type="string" />
    <aura:attribute name="lname" type="string"/>
    <aura:attribute name="sal" type="integer"/>
    <aura:attribute name="tax" type="integer"/>
    <aura:attribute name="nsal" type="integer"/> 
    <br/><br/>
    
        <div style="width:600px;margin-left:200px;">
            <lightning:card iconName="standard:individual" title="">
            	<aura:set attribute="title">
                	<h1>Employee Salary Form</h1>
                </aura:set> 
				<aura:set attribute="footer">
                	copy rights @nara.dotnet
                </aura:set>
                <aura:set attribute="actions">
                	<lightning:button label="Calculate" onclick="{!c.calculateNetSalary}"/>
                    <lightning:button label="Refresh" onclick="{!c.refreshData}"/>
                </aura:set>
                <div style="padding:10px;">
                	<lightning:input label="First Name" type="text" value="{!v.fname}"/> 
                    <lightning:input label="Last Name" type="text" value="{!v.lname}"/>
                    <lightning:input label="Salary" type="number" value="{!v.sal}"/>
                    <lightning:input label="Tax (%)" type="number" value="{!v.tax}" />
                    <lightning:input label="Net Salary" type="number" value="{!v.nsal}"/>
               </div>
            </lightning:card>
        </div>
    
</aura:application>