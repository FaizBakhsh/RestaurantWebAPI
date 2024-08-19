export class RecipeVM {
    id?: number;
    clientId:number=0
    uom?: string;
    qty!: number;
    groupId: number = 0
    itemId: number = 0
    rawItemId: number = 0;
    orderTypeId?: number = 0
    sizeId?: number = 0;
    amount?: GLfloat;
    price!: GLfloat;
    isActive: boolean;
    sizeName!: string
    rawItem?: string
    dBoperation?: number;
    recipeTypeId: number
    entityId: number = 0
    itemEntity: string
    subItemEntity: string
    recipeType: string
    recipeModifierId: number = 0
    recipeModifier: string
    printKitchen: boolean
    attachRecipe: boolean
    size: string

}