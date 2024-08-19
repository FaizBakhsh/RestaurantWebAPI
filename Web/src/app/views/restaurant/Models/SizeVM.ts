export class SizeVM {
    id!: number;
    clientId:number=0
    sizeName?: string;
    groupId: number = 0
    kdsId?: string
    itemId?: number = 0;
    item: string
    attribute: string
    attributeValue: string
    price!: GLfloat;
    tax?: GLfloat;
    cost?: GLfloat;
    actualPrice!: GLfloat;
    suggestedMargin?: GLfloat;
    currentMargin?: GLfloat;
    suggestedPrice?: GLfloat;
    isActive: boolean = true;
    inclusiveTax: boolean = true
}