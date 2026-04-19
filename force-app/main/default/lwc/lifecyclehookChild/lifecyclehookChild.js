import { LightningElement } from 'lwc';

export default class LifecyclehookChild extends LightningElement {
connnectedCallback(){
    console.log('Connected Callback Log');
}
disconnectedCallback(){
console.log('Disconnected Callback Log');
}
}