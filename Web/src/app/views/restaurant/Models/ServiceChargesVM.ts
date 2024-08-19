export class ServiceChargesVM {
    id: number
    clientId:number=0
    name: string
    description: string
    percentage: number
    isActive: boolean
    orderTypeId: number = 0
    orderType: string
    paymentTypeId: number = 0
    paymentType: string
}