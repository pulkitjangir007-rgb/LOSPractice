import { LightningElement } from 'lwc';

export default class Scenario7 extends LightningElement {
result;

getvalues(){
    let input1 = this.template.querySelector('.input1').value;
    let input2 = this.template.querySelector('.input2').value;
    let input3 = this.template.querySelector('.input3').value;
    return {input1, input2, input3};
}
totalmarks(){
    let {input1, input2, input3} = this.getvalues();
    this.result = Number(input1) + Number(input2) + Number(input3);
}
average(){
    let {input1, input2, input3} = this.getvalues();
    this.result = parseFloat((Number(input1) + Number(input2) + Number(input3)) / 3);
}
percentage(){
    let {input1, input2, input3} = this.getvalues();
    this.result = parseFloat(((Number(input1) + Number(input2) + Number(input3)) / 300 * 100));
}
}