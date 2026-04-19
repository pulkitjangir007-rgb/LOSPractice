import { LightningElement } from 'lwc';

export default class Hellobinding extends LightningElement {
    greeting = 'World';
    
    handleChange(event){
        this.greeting = event.target.value;
    }
}