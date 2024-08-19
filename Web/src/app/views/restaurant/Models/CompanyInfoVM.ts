export class CompanyInfoVM {
    id?: number;
    clientId: number = 0
    name?: string;
    phoneNo?: string
    address?: string
    billNote?: string;
    logoBase64Path?: string;
    isActive: boolean = true;
}