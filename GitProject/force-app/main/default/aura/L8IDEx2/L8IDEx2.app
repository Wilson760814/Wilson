<aura:application extends="force:slds">
    <div class="box1">
        <lightning:card iconName="utility:activity" >
            <aura:set attribute="title">
                <h1>Arithmetic Operations (+,*)</h1>
            </aura:set>
              <aura:set attribute ="footer">
            	copy rights @salesforce.com
            </aura:set>
            <aura:set attribute="actions">
                <lightning:button label="Add" onclick="{!c.add}"/>
                <lightning:button label="Mul" onclick="{!c.mul}"/>
            </aura:set>
            <div class="innerDiv">
                <lightning:input label="First Value" aura:id="fv"/>
                <lightning:input label="Second Value" aura:id="sv" />
                <lightning:input label="Result" aura:id="res"/>
            </div>
          
        </lightning:card>
    </div>
</aura:application>