import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

export default class CreateRecord extends LightningElement {
accountObject  = ACCOUNT_OBJECT;
myFields = [NAME_FIELD,WEBSITE_FIELD];
handleAccountCreate(event){
    this.dispatchEvent(
        new ShowToastEvent({
        title:'Record is created successfully',
        message:event.detail.message,
        variant:'success'
    }),
);
}
}