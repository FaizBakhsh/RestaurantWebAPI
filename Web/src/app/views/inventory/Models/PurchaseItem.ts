export class PurchaseItemsVM {
    id: number = 0
    date: Date=new Date
    grn?:number
    branchId:number=0
    storeId:number=0
    supplierId:number=0
    groupId:number=0
    itemId:number=0
    itemsPerPkg: Number | undefined 
    noOfPkg: Number | undefined
    totalQty? : Number 
    pricePer?: Number
    totalAmount?: Number
    pricePerItem!: number
    purchaseTypeId:number=0
    invoiceNo:number | undefined
    poNo:number|undefined
    description:string | undefined
    ttlAmount:number | undefined
    expiryDate:Date=new Date
    branch?:string
    store?:string
    supplier?:string
    group?:string
    item?:string
    purchaseTypes?:string
    purchItemId!: number 
  piLines: any[]
}
export class PurchaseItemsLineVM{
    id!:number
    piId?:number
    rawItemId:number
    package:string
    packageItems!:number
    totalItems!:number
    price!:number
    pricePerItem!:number
    totalAmount!:number
    branchId?:number
    description?:string
    expiry?:string
    item?:string
    branch?:string
  dBoperation: number
}