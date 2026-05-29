import { LightningElement , api} from 'lwc';

export default class AddressCompo extends LightningElement {
  
    @api adrList;

columns= [
        {label: 'Country', fieldName: 'Country__c', editable:true},
        {label: 'City', fieldName: 'City__c', editable:true},
        {label: 'State', fieldName: 'State__c', editable:true}
       
    ];




}
