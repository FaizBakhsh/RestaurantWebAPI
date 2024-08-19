import { BaseDomainVM } from "../../catalog/Models/BaseDomainVM";


export class VoucherDetailsVM extends BaseDomainVM {
    coaId: number = 0
    vchNarration?: string
    product?: string
    vchCreditAmt?: any;
    vchDebitAmt?: any;
    vchChqNo: string
    vchChqDate: Date = new Date
    coaCode: string
    coaDesc: string
    override isActive: boolean = true;
    dBoperation?: number;
    vchId?: number;
    addMode: boolean = false
    editMode: boolean = false
    from: Date = new Date
    to: Date = new Date
}
export class VoucherVM extends BaseDomainVM {
    vchMonth: string
    vchYear: string
    vchYearId: number
    vchKey: string
    vchDate: Date = new Date;
    vchTypeId: number = 0;
    vchType?: string
    vchNo?: string;
    vchPaidTo?: string;
    vchNarration?: string;
    approvalStatusId: number
    approvalStatus: string
    statusId?: number;
    status?: string
    override isActive: boolean;
    qty: number = 1;
    description?: string
    isPosted: boolean = false;
    voucherDetails?: VoucherDetailsVM[] = new Array();
    isEdit = false;
    isView = false;
}
