import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/ApexWire1.getContactList';

export default class ApexWireMethodConnected extends LightningElement {
    Contacts;
    error;
    connectedCallback(){
        getContactList()
        .then(result=>{
            this.Contacts = result;
        })
        .catch(error=>{
            this.error = error;
        });  
    }
}