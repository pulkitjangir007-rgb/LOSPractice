import { LightningElement, wire} from 'lwc';
import getContactList from '@salesforce/apex/ApexWire1.getContactList';

export default class ApexWireMethodToProperty extends LightningElement {
    @wire(getContactList) 
    Contacts;
}