export class UOMConversionVM {
    id: number = 0;
    clientId:number=0
    convertedUOMId: number = 0;
    uomId: number = 0;
    isActive?: Boolean = true;
    conversionRate!: string
    uom?: string
    converteduom?: string
    convertedUOM?: string
    qty?: number
}