

import { LightningElement, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import USER_ID from '@salesforce/user/Id'; //this is how you will retreive the USER ID of current in user.
import NAME_FIELD from '@salesforce/schema/User.Name';
import USERNAME_FIELD from '@salesforce/schema/User.Username';
import USERROLE_FIELD from '@salesforce/schema/User.UserRole.Name';
import PROFILE_FIELD from '@salesforce/schema/User.Profile.Name';
import USERTYPE_FIELD from '@salesforce/schema/User.UserType';
export default class userDetails extends LightningElement {
    @track error ;
    @track name;
    @track username;
    @track userrole;
    @track profile;
    @track usertype;
    @track userid;
    @wire(getRecord, {
        recordId: USER_ID,
        fields: [NAME_FIELD, USERNAME_FIELD,USERROLE_FIELD,PROFILE_FIELD,USERTYPE_FIELD]
    }) wireuser({
        error,
        data
    }) {
        if (error) {
           this.error = error ; 
        } else if (data) {
            
            this.name = data.fields.Name.value;
            this.username = data.fields.Username.value;
            this.userrole = data.fields.UserRole.value.fields.Name.value;
            this.profile = data.fields.Profile.value.fields.Name.value;
            this.userid=USER_ID;
            this.usertype = data.fields.UserType.value;
            
            console.log('0');
            console.log(this.profile);
            console.log(this.name);
            console.log(this.username);
            console.log(this.usertype);
            console.log('1');


        }
    }

}