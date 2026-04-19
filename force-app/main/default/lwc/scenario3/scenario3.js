import { LightningElement } from 'lwc';

export default class Scenario3 extends LightningElement {
Billingadd;
mailingadd;


handleClick(event){
this.Billingadd = event.target.value;
}
handleBtnClick(){
this.mailingadd = this.Billingadd;
}
}