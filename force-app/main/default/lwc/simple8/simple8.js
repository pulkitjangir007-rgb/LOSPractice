import { LightningElement } from 'lwc';
export default class Bill extends LightningElement {
    item1Quantity = 0;
     item2Quantity = 0;
     item3Quantity = 0;
     item4Quantity = 0;
     item5Quantity = 0;


     item1Price = 0;
     item2Price = 0;
     item3Price = 0;
     item4Price = 0;
     item5Price = 0;
     totalBill;    
     totalBillTax;


     handleQuantity1Change(event) {
        this.item1Quantity = event.target.value;
    }


    handlePrice1Change(event) {
       this.item1Price=event.target.value;
    }
    handleQuantity2Change(event) {
            this.item2Quantity = event.target.value;
    }


    handlePrice2Change(event) {
       this.item2Price=event.target.value;
    }
    handleQuantity3Change(event) {
        this.item3Quantity = event.target.value;
    }


    handlePrice3Change(event) {
       this.item3Price=event.target.value;
    }
    handleQuantity4Change(event) {
        this.item4Quantity = event.target.value;
    }


    handlePrice4Change(event) {
       this.item4Price=event.target.value;
    }
    handleQuantity5Change(event) {
        this.item5Quantity = event.target.value;
    }


    handlePrice5Change(event) {
       this.item5Price=event.target.value;
    }


    handletotalBill() {
        try{
        this.totalBill = Number(this.item1Quantity) * Number(this.item1Price) +      Number(this.item2Quantity) * Number(this.item2Price) +
        Number(this.item3Quantity) * Number(this.item3Price) +
        Number(this.item4Quantity) * Number(this.item4Price) +
        Number(this.item5Quantity) * Number(this.item5Price);
        this.totalBillTax = this.totalBill + (this.totalBill * 0.18);// Applying 18% tax
        }
        catch(error){
            console.log('error',error);
        }
    }
}