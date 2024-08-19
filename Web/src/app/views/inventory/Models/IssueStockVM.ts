export class IssueStockVM {
    id!: number;
    issuingBranchId : number = 0;
    receivingBranchId: number = 0;
    issueDate! : Date;
    categoryId : number = 0;
    keyword? : string;
    issuingBranch? : string;
    receivingBranch?:string;
    category? : string;
}