import { LightningElement } from 'lwc';
import getUserName from '@salesforce/apex/AccountProvider.getUserName';
import fetchAllAccount from '@salesforce/apex/AccountProvider.fetchAllAccount';
export default class LoadAccRecords extends LightningElement {

    userName;
    accList;
    totalRecords;

    columns=[
      {label: 'Name', fieldName: 'Name', editable: true},
      {label: 'Created By', fieldName: 'CreatedBy.Name', editable: true}
    ];

    connectedCallback(){
    getUserName()
        .then(result=>{
            this.userName=result;
        })

        .catch(error=>{
          console.log(JSON.stringify(error));
        })

        fetchAllAccount()
            .then(result=>{
                this.accList=result;
                this.totalRecords=result.length;
            })
            .catch(error=>{
                console.log(JSON.stringify(error));
            })
        }
    
    
}