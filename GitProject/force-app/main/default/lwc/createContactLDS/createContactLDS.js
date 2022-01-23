import { LightningElement, track } from 'lwc';
import {createRecord} from "lightning/uiRecordApi";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CreateContactLDS extends LightningElement {
    @track contactName;
    @track contactPhone;
    @track contactEmail;
    
    contactNameChangeHandler(event)
    {
        this.contactName=event.target.value;
        console.log("1")
    }

    contactPhoneChangeHandler(event)
    {
        this.contactPhone=event.target.value;
    }
    contactEmailChangeHandler(event)
    {
        this.contactEmail=event.target.value;
    }
    createContact()
    {
        
        const fields={'LastName':this.contactName,'Phone':this.contactPhone,'Email':this.contactEmail};
        const recordInput={apiName:'Contact',fields};
        console.log("2");
       createRecord(recordInput)
       
        .then(response=>{
            this.dispatchEvent(
                            new ShowToastEvent({
                                title: 'Success',
                                message: 'Contact created',
                                variant: 'success',
                            }),
                        );
                    }).catch(error=>{
                        this.dispatchEvent(
                             new ShowToastEvent({
                            title: 'Error creating record',
                            message: error.body.message,
                            variant: 'error',
                                        }),
                                    );
                                });
            }
        }




//     //    
//     .catch(error => {
//     //     this.dispatchEvent(
//     //         new ShowToastEvent({
//     //             title: 'Error creating record',
//     //             message: error.body.message,
//     //             variant: 'error',
//     //         }),
//     //     );
//     // });
//     })
//     //    .then(response=>{
//     //         console.log('Contact has been created successfully ',response.id);
//     //         console.log("3");
//     //     }).catch(error=>{
//     //         console.log('Error in creating contact: ',error.body.message);
//     //     });
// }
// }

// createRecord(recordInput)
       
//         .then(response=>{
//                     console.log('Contact has been created successfully ',response.id);
//                     console.log("3");
//                 }).catch(error=>{
//                     console.log('Error in creating contact: ',error.body.message);
//                 });
//             }