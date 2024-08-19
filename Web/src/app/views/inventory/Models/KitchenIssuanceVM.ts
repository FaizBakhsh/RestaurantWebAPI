export class KitchenIssuanceVM {
    id!: number
    kitchenId: number = 0
    storeId: Number = 0
    branchId: number = 0
    date: Date = new Date
    keyWord?: string
    branch?: string
    store?: string
    kitchen?: string
    isActive: boolean = true
}