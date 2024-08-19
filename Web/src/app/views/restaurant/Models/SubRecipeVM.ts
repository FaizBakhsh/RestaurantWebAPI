export class SubRecipeVM {
    id!: number;
    groupId: number = 0;
    itemId: number = 0
    subItemId: number = 0;
    flavorSizeId: number = 0
    group!: string
    item!: string
    subItem!: string
    size?: string
    qty?: number
}