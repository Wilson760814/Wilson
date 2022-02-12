import { LightningElement, wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi'
import Id from '@salesforce/user/Id'
import NAME_FIELD from '@salesforce/schema/User.Name'
import EMAIL_FIELD from '@salesforce/schema/User.Email'
const fields = [NAME_FIELD, EMAIL_FIELD]
export default class WireDemoUserDetail extends LightningElement {
    userId = Id

    userDetail
    @wire(getRecord, {recordId:'$userId', fields})
    userDetailHandler({data, error}){
        if(data){
            this.userDetail = data.fields
            console.log("aaa")
            console.log(JSON.stringify(data))
            console.log("aaa")
        }
        if(error){
            console.error(error)
        }
    }

    @wire(getRecord, {recordId:'$userId', fields})
    userDetailProperty;
   
    // console.log("bbb")
    // console.log(this.userDetailProperty);
    // console.log("bbb")
}