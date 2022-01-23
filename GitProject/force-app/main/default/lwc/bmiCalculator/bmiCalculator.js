import { LightningElement, track } from 'lwc';

export default class BmiCalculator extends LightningElement {
    cardTitle = 'BMI Calculator';

    //weight;
   // height;
  bmi;
   // @track bmi;
    onWeightChange(event){
        this.weight = parseFloat(event.target.value);
    }

    onHeightChange(event){
        this.height = parseFloat(event.target.value);
    }

    calculateBMI(){
        try{
        this.bmi = this.weight/(this.height*this.height);
        console.log(this.bmi);
        } catch(error){
            this.bmi = undefined;
        }
    }

    get bmiValue(){
        console.log(2);
        console.log(this.bmi);
        if(this.bmi === undefined){
            return "";
        } else
        {return `Your bmi Is: ${this.bmi}`;}
    }
}