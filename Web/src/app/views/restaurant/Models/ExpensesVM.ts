export class ExpensesVM {
    id?: number;
    amount?: number;
    date: Date = new Date()
    name?: string
    isActive: boolean = true;
    supplierId?: number = 0
    clientId:number=0
}