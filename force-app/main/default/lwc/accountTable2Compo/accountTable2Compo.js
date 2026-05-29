import { LightningElement } from 'lwc';
import typeAccount from '@salesforce/apex/AccountProvider.typeAccount';
export default class AccountTable2Compo extends LightningElement {

    objAcc={'sObjectType':'Account'}
    accList;
    totalRecords=0;

    get typeOptions(){
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Other', value: 'Other' },
    ];
    }

    typeHandleChange(event){
        this.objAcc.Type=event.detail.value;
        console.log(this.value);

        typeAccount({objAcc:this.objAcc})
        .then(result=>{
            console.log(JSON.stringify(result));
            this.accList=result;
            this.totalRecords=this.accList.length;
        })
        .catch(error=>{
            console.log(JSON.stringify(error));
        })
    }
}