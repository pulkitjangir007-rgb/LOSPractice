import { LightningElement } from 'lwc';

export default class Scenario5 extends LightningElement {
result;

getvalues(){
let input1 = this.template.querySelector('.input1').value;
return {input1};
}

handleetod(){
let{input1} = this.getvalues();
this.result = Number(input1) * 2.2;
}

handleetod(){
let{input1} = this.getvalues();
this.result = Number(input1) * 0.9;
}
}