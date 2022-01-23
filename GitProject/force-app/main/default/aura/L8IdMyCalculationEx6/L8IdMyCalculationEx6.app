<aura:application extends="force:slds">
    <div class="box1">
        <lightning:card iconName="utility:activity" >
            <aura:set attribute="title">
                <h1>Arithmetic Operations (+,*)</h1>
            </aura:set>
           
            <aura:set attribute="actions"> 
                 
                <lightning:button label="Add+" onclick="{!c.invoke}" class="myBtn" aura:id="btnAdd" name="btnAddName"/>
                <lightning:button label="Mul*" onclick="{!c.invoke}" class="myBtn" aura:id="btnMul" name="btnMulName"/>
                <br/>
                <lightning:button label="Min-" onclick="{!c.invoke}" class="myBtn" aura:id="btnMin" name="btnMinName"/>
                <lightning:button label="Div/" onclick="{!c.invoke}" class="myBtn" aura:id="btnDiv" name="btnDivName"/>
                <br/>
                <lightning:button label="Clr0" onclick="{!c.invoke}" class="myClr" aura:id="btnClr" name="btnClrName"/>
           
             </aura:set>
            <div class="innerDiv">
                <lightning:input label="First Value" aura:id="fv"/>
                <lightning:input label="Second Value" aura:id="sv" />
                <lightning:input label="Result" aura:id="res"/>
            </div>
            <aura:set attribute ="footer">
            	copy rights @salesforce.com
            </aura:set>
        </lightning:card>
    </div>
</aura:application>