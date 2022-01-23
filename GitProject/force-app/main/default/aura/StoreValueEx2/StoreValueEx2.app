<aura:application extends="force:slds">
    <aura:attribute name="fname" type="string" />
    <aura:attribute name="lname" type="string" />
    <aura:attribute name="email" type="string" />
    <aura:attribute name="phone" type="string" />
    <aura:attribute name="age" type="integer" />
    
	<div style="width:600px;margin:100px;padding:40px;border:2px solid black;">
        <lightning:input label="First Name" type="text" value="{!v.fname}"/>
        <lightning:input label="Last Name" type="text" value="{!v.lname}"/>
        <lightning:input label="Email" value="{!v.email}"/>
        <lightning:input label="Phone" value="{!v.phone}"/>
        <lightning:input label="Age" value="{!v.age}"/> <br/>
        <center>
            <lightning:button label="Show Data" onclick="{!c.showdata}"/>
            <lightning:button label="Clear Data" onclick="{!c.cleardata}"/>
        </center>
    </div>
</aura:application>