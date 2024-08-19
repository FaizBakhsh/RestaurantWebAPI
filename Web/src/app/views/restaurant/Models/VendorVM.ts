export class VendorVM {
    id: number = 0
    name!: string;
    accountId: number = 0
    area!: string;
    creditDays?: number
    code!: string;
    phone!: string;
    email!: string;
    cnic!: string;
    city!: string;
    isActive: boolean = true;
    address!: string
}