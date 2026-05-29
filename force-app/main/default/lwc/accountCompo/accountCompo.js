
import { LightningElement } from 'lwc';
import createNewAccount from '@salesforce/apex/AccountProvider.createNewAccount';
export default class AccountCompo extends LightningElement {
    objAcc= {'sObjectType':'Account'};

    get selectOption(){
        return[
            {label:'Hot',value:'Hot'},
            {label:'Cold',value:'Cold'},
            {label:'Warm',value:'Warm'},
        ];
    }

   dataHandler(event){
    this.objAcc.Rating=event.detail.value;
   }

    accountHandler(){
        console.log('you are inside js');

        this.objAcc.Name=this.template.querySelector('lightning-input[data-formfield="Acc"]').value;
        console.log(this.objAcc.Name);

        createNewAccount({accData:this.objAcc})
        .then(result=>{
            console.log('data saved');
        })
        .catch(error=>{
            console.log('something went wrong');
            console.log(error);
        })
    }
}
