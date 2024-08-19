import { BaseDomainVM } from "../../catalog/Models/BaseDomainVM"

export class RFQVM extends BaseDomainVM {

    isReference: boolean
    title: string
    rfqValidity: Date
    requestNoteNo: number
    deliveryDate: Date = new Date()
    statusId: number
    status?: string
    description: string
    rfqLines: RFQLineVM[] = new Array()

}
export class RFQLineVM extends BaseDomainVM {

    rFQId?: number
    itemId?: Number = 0
    item?: string
    type: string
    group: string
    category: string
    dBoperation?: number;

}
