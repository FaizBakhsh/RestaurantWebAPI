export class AttachSubItemVM {
    id?: number
    clientId: number = 0
    groupId: number = 0
    itemId: number = 0
    modifierId: number = 0
    subItemId: number = 0
    group?: string
    item?: string
    modifier?: string
    subItem?: string
    qty?: number
    sizeId: number = 0
    size?: string
    isActive: boolean = true
}