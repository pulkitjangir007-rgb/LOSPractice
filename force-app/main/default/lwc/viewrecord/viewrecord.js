import { LightningElement } from 'lwc';

export default class Viewrecord extends LightningElement {
num1=10;
num2=20;
sum = true;
get Multiply(){
    return this.num1*this.num2;
}
 fullName  =  'John Doe';
 handlechange(event){
    this.sum = false;
 }
 Carlist = ['Bmw', 'Audi', 'Ford', 'Tesla'];

}