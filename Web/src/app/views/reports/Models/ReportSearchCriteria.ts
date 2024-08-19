import { BaseSearchCriteria } from '../../catalog/Models/BaseSearchCriteria'
export class ReportSearchCriteria extends BaseSearchCriteria {
    shiftId: number = 0
    refundTypeId: number = 0
    discountKeyId: number = 0
    isComplimentary: boolean
}