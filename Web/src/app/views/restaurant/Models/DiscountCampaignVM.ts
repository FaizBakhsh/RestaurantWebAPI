export class DiscountCampaignVM {
    id!: number;
    clientId:number=0
    name!: string
    discount!: GLfloat
    startTime!: string
    endTime!: string
    startDate: Date = new Date
    endDate: Date = new Date
    tillDayEnd!: boolean
    typeId: number = 0
    menuGroupId: number = 0
    monday!: boolean
    tuesday!: boolean
    wednesday!: boolean
    thursday!: boolean
    friday!: boolean
    saturday!: boolean
    sunday!: boolean
    isActive: boolean
    weekDaysIds: number[]
    daysIds: string
    days: string
}