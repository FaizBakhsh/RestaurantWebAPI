export class PurchaseOrderVM {
    id!: number
    poDate : Date = new Date
    poNo : Number | undefined 
    demandNo? : Number 
    supplierId : Number = 0
    branchId : Number = 0
    itemId : Number = 0
    itemsPerPkg!: Number
    noOfPkg!: Number 
    totalQty! : Number 
    pricePerPkg?: Number 
    totalAmount?: Number 
    branch?:string
    item?: string
    supplier?:string
    poLines: PurchaseOrderLineVM[] = new Array()
}
export class PurchaseOrderLineVM{
    id!:number
    pOId?:number
    rawItemId:number
    package:string
    packageItems!:number
    totalItems!:number
    price!:number
    pricePerItem!:number
    totalAmount!:number
    description?:string
    item?:string
  dBoperation?: number
}