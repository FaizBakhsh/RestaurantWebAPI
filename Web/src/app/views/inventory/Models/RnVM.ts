import { BaseDomainVM } from "../../catalog/Models/BaseDomainVM";

export class RNVM extends BaseDomainVM {

    title: string = '';
    requiredBefore: Date = new Date();
    typeId: number = 0;
    categoryId: number = 0;
    reason: string = '';
    requesterTypeId: number = 0;
    requester: string
    requesterId: number = 0;
    statusId: number = 0;
    description: string = '';
    category: string = '';
    requesterType: string = '';
    status: string = '';
    type: string = '';
    rnLines: RNLineVM[] = new Array();


}

export class RNLineVM extends BaseDomainVM {
    rNId?: number;
    itemId: number = 0;
    requestedQty: number = 0;
    uomId: number = 0;
    dBoperation?: number;
    item?: string;
    uom?: string;
}
