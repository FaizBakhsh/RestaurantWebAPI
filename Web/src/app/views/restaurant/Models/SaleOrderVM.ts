export class SaleOrderVM {
    id!: number;
    clientId: number
    total!: number
    discountValue: number
    gstValue: number
    discount!: number
    gst!: number;
    netTotal!: number
    paymentMethod!: string
    service!: number
    createdOn!: Date
}