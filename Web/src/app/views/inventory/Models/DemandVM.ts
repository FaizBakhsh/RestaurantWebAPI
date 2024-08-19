export class DemandVM {
    id!: number;
    branchId: number = 0
    itemId: number = 0
    date!: Date
    branch!: string
    item!: string
    isActive: boolean = true
}