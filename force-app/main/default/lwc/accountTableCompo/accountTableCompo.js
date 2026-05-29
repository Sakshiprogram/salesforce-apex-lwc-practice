import { LightningElement } from 'lwc';
import searchAccount from '@salesforce/apex/AccountProvider.searchAccount';
export default class AccountTableCompo extends LightningElement {

    objAccount ={'sObjectType':'Account'}
    showTableFlag=false;
    
    searchAccountHandler(){

        this.objAccount.Name=this.template.querySelector('lightning-input[data-formfield="Acc"]').value;

        searchAccount({objAccount:this.objAccount})
        .then(result=>{
            console.log(JSON.stringify(result));
            this.objAccount=result;
            if(JSON.stringify(result).length>0){
                this.showTableFlag=true;
            }
            else{
                this.showTableFlag=false;
            }
        })
        .catch(error=>{
            console.log(JSON.stringify(error));
            this.showTableFlag=false;
        })
    }
}