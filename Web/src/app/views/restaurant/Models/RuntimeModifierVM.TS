export class RuntimeModifierVM {
    clientId: number = 0
    id!: Number
    menuItemId: number = 0
    rawItemId: number = 0
    typeId: number = 0
    kdsId: number = 0
    kdS2Id: number = 0
    qty?: number
    stageId?: number = 0
    stageQtyAllowed?: number
    price?: number
    modifierName?: string
    imageBase64Path?: string
    isActive: boolean
    kds?: string
    kds2?: string
    menuItem?: string
    rawItem?: string
    type?: string
}