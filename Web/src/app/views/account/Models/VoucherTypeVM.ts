import { BaseDomainVM } from '../../catalog/Models/BaseDomainVM'
export class VoucherTypeVM extends BaseDomainVM {
    vchTypeId: number
    vchTypeCode: string
    vchTypeDesc: string
    vchTypeRemarks: string
    isAutoPosted: boolean
    vchChq: boolean
    vchPostStage: string
}