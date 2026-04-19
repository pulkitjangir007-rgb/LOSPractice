import { LightningElement } from 'lwc';


export default class Simple3 extends LightningElement {
    mailingAdd;
    billingAdd;
    handleChangeValue(event){
        this.billingAdd=event.target.value;
    }
    handleBtnClick(){
              this.mailingAdd=this.billingAdd;
    }
}