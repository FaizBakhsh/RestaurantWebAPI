export class PurchaseReturnVM {
    id!: number;
    branchId: number = 0
    supplierId: number = 0
    invoiceNo!: number
    returnDate: Date = new Date()
    branch!: string
    supplier!: string
    isActive: boolean = true
    prLines: PurchaseReturnLineVM[] = new Array()
}
export class PurchaseReturnLineVM {
    id!: number
    pRId?: number
    itemId?: Number = 0
    uOMId?: Number = 0
    totalItems!: number
    pricePerItem!: number
    totalAmt!: number
    returnQty?: number
    date: Date = new Date()
    dBoperation?: number;
    item?: string
    uom?: string
    isActive: boolean = true
}