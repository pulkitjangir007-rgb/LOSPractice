import { LightningElement } from 'lwc';

export default class Scenario6 extends LightningElement {
result;

getvalues(){
   let input1 = this.template.querySelector('.input1').value;
let input2 = this.template.querySelector('.input2').value;
return {input1,input2};

}
handleAdd(){
let {input1,input2} = this.getvalues();
this.result = Number(input1)+Number(input2);
}

handleSubtract(){
let {input1,input2} = this.getvalues() ;
this.result = Number(input1)-Number(input2);
}

handleMultiply(){
let {input1,input2} = this.getvalues() ;
this.result = Number(input1)*Number(input2);
}
handleDivide(){
let {input1,input2} = this.getvalues() ;
   this.result = input2 !== 0 ? input1 / input2 : alert("Division by zero is not allowed");
}
}