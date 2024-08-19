import { BaseDomainVM } from "../../catalog/Models/BaseDomainVM"

export class FiscalYearVM extends BaseDomainVM {
   
    yearCode?: string
    yearDesc?: string
    yearDateFrom: Date
    yearDateTo: Date
    isActiveYear:boolean
    
 
}