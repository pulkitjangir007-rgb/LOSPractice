import { LightningElement } from 'lwc';
export default class Simple3 extends LightningElement {
    Maths;
    hindi;
    Eng;
    totalmarks;
    percentage;
    division;
    roundoff;
    hadleChangeMathValue(event){
        this.Maths=event.target.value;
    }
    hadleChangeHinValue(event){
        this.hindi=event.target.value;
    }
    hadleChangeEngValue(event){
        this.Eng=event.target.value;
    }
    handleBtnClick(){
     this.totalmarks=Number(this.Maths)+ Number(this.hindi)+ Number(this.Eng);
     this.percentage= (this.totalmarks/600)*100;
     this.roundoff = this.percentage.toFixed(2);
     console.log(this.roundoff);
     if(this.roundoff>=60){
        this.division='1st';
     }
     else if(this.roundoff>=50){
        this.division='2nd';
           }
     else{
        this.division='3rd';
     }
    }
}