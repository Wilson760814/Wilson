<aura:application extends="force:slds">
    <div style="padding:50px;margin-left:50px;width:600px;border:1px solid black;">
        <center><p style="font-size:20px;">Employee Registration Form</p></center>
        <lightning:input label="FirstName"/> <!-- Text -->
        <lightning:input label="LastName" required="true" type="text"/>
        <lightning:input label="Email Address" type="email" />
        <lightning:input label="Phone Number" type="phone"/>
        <lightning:input label="Age" type="number" value="30"/>
        <lightning:input label="Married?" type="checkbox" />
        <lightning:input label="Date of Birth" type="datetime"/>
        <lightning:input label="Date of Joining" type="date" />
        <lightning:input label="Most like color" type="color"/>
        <lightning:input label="Password" type="password"/>
        <lightning:input label="Time" type="time"/>
    </div>
</aura:application>