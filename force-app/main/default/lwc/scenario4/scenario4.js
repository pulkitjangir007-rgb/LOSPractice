import { LightningElement } from 'lwc';

export default class Scenario4 extends LightningElement {
    feet;
    inches;
    handlefeet(event){
        this.feet = event.target.value;
    }
    handleinches(){
        this.inches = this.feet * 12;
    }

}