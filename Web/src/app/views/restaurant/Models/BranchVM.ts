export class BranchVM {
    id?: number;
    name?: string;
    branchId: number = 0
    chartAccountId?: number;
    type?: string;
    location?: string;
    branchCode?: string;
    isActive: boolean;
    uploadStatus?: boolean = false;
    branchEnumTypeId!: number
    clientId:number=0
}