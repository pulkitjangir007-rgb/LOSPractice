import { LightningElement , api} from 'lwc';

export default class CompactLayout extends LightningElement {
    @api recordId;
    @api objectApiName;
}