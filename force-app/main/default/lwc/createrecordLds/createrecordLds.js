import { LightningElement, api, wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

// Schema imports
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';

// Dynamic Picklist Wires
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';

export default class WireAdapterCreateRec extends NavigationMixin(LightningElement) {

    @api recordId;
    error;
    accRecord = {};

    // Store dynamic picklist options
    typeOptions = [];
    industryOptions = [];

    // STEP 1: Get object metadata
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfo;

    // STEP 2: Get Type Picklist Values
    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.data.defaultRecordTypeId',
        fieldApiName: TYPE_FIELD
    })
    typePicklistHandler({ data, error }) {
        if (data) {
            this.typeOptions = data.values;
        }
        if (error) {
            console.error(error);
        }
    }

    // STEP 3: Get Industry Picklist Values
    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.data.defaultRecordTypeId',
        fieldApiName: INDUSTRY_FIELD
    })
    industryPicklistHandler({ data, error }) {
        if (data) {
            this.industryOptions = data.values;
        }
        if (error) {
            console.error(error);
        }
    }

    // Input Handlers
    handleNameChange(event) {
        this.accRecord.Name = event.target.value;
    }
    handlePhoneChange(event) {
        this.accRecord.Phone = event.target.value;
    }
    handleTypeChange(event) {
        this.accRecord.Type = event.detail.value;
    }
    handleIndustryChange(event) {
        this.accRecord.Industry = event.detail.value;
    }

    // Save Account
    handleSave() {
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.accRecord.Name;
        fields[PHONE_FIELD.fieldApiName] = this.accRecord.Phone;
        fields[INDUSTRY_FIELD.fieldApiName] = this.accRecord.Industry;
        fields[TYPE_FIELD.fieldApiName] = this.accRecord.Type;

        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields
        };

        createRecord(recordInput)
            .then(result => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!!',
                        message: 'Account Created Successfully!!',
                        variant: 'success'
                    })
                );

                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: result.id,
                        objectApiName: ACCOUNT_OBJECT.objectApiName,
                        actionName: 'view'
                    }
                });

            })
            .catch(error => {
                this.error = JSON.stringify(error);
            });
    }
}