import { LightningElement, api } from 'lwc';

export default class AccountRecordForm70 extends LightningElement {
    @api recordId;
    @api objectApiName;
    

    handleSuccess(event){
        this.recordId = event.detail.id;
    }
}