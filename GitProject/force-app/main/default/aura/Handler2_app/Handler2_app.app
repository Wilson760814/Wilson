<aura:application extends="force:slds">
    <aura:attribute name="first" type="integer" default="10" />
    <aura:attribute name="second" type="integer" default="20"/>
    <aura:attribute name="addd" type="integer" default="0"/>
    <aura:attribute name="mull" type="integer" default="0"/>
    
    <div style="padding:20px;width:500px;">
        <lightning:card iconName="utility:choice">
            <aura:set attribute="title">
                <h1>ArithmeticOperations (+ / *)</h1>
            </aura:set>
            <aura:set attribute="actions">
                <lightning:button label="Add" onclick="{!c.add1}"/>
                <lightning:button label="Mul" onclick="{!c.mul1}"/>
            </aura:set>
            
            <div style="padding:5px;">
                First Value 			:		{!v.first} <br/>
                Second Value			:		{!v.second} <br/>
                <br/>
                Addition Result			:		{!v.addd} <br/>
                Multiplication Result	:		{!v.mull} <br/> 
            </div>
        </lightning:card>
    </div>
</aura:application>