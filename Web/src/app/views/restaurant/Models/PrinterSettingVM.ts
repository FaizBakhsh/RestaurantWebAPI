export class PrinterSettingVM {
    id: number = 0
    clientId: number = 0
    categoryId: number = 0
    subCategoryId: number = 0
    printerId: number = 0
    printer!: string;
    category!: string;
    subCategory!: string;
    noofPrints!: number;
    isActive: boolean;
}