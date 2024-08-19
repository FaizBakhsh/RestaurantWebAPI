export class EmployeeSaleVM {
    id!: number
    clientId: number = 0
    employeeId: number = 0
    amount!: number
    date: Date = new Date()
    employee?: string
    isActive: boolean = true
}