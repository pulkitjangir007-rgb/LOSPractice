import { LightningElement } from 'lwc';

export default class LifeCycleHookDemo extends LightningElement {
test;
name = 'car';
price = 27000;
ready = false;

constructor(){
super(); //calss parent constructor
this.test = 'Hello World';  
console.log('Constructor Log');   
}
connnectedCallback(){
console.log('Connected Callback Log');
setTimeout(() => {
this.ready = true;
}, 3000);
}
renderedCallback(){
console.log('Rendered Callback Log');
setTimeout(() => {
this.rendered = true;
}, 7000);
}
}