<aura:application extends="force:slds">
    <aura:attribute name="first" type="integer"  />
    <aura:attribute name="second" type="integer" />
    <aura:attribute name="add" type="integer" />
    <aura:attribute name="mul" type="integer" />
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    <div style="padding:20px;width:500px;">
        <lightning:card iconName="utility:choice">
            <aura:set attribute="title">
                <h1>ArithmeticOperations (+ / *)</h1>
            </aura:set>
            <aura:set attribute="actions">
                <lightning:button label="Add" onclick="{!c.add}"/>
                <lightning:button label="Mul" onclick="{!c.mul}"/>
            </aura:set>
            
            <div style="padding:5px;">
                First Value 			:		{!v.first} <br/>
                Second Value			:		{!v.second} <br/>
                <br/>
                Addition Result			:		{!v.add} <br/>
                Multiplication Result	:		{!v.mul} <br/> 
            </div>
        </lightning:card>
    </div>
</aura:application>