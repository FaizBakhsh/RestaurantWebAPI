import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SaleOrderVM } from '../../Models/SaleOrderVM';
import { RestaurantService } from '../../restaurant.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-sale-report',
  templateUrl: './sale-report.component.html',
  styleUrls: ['./sale-report.component.css']
})
export class SaleReportComponent {
  maxDate = new Date
  saleOrder: SaleOrderVM[] | undefined;
  displayedColumns: string[] = ['createdOn', 'total', 'discount', 'gST', 'service', 'netTotal', 'paymentMethod'];
  dataSource: any;
  fromDate = new Date();
  toDate = new Date();
  lastdate: any;
  firstdate: any;
  isReadOnly: boolean = false
  constructor(
    public datePipe: DatePipe,
    private catSvc: CatalogService,
    public resSvc: RestaurantService,
  ) {
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Salereport)
    this.fromDate = new Date();
    this.toDate = new Date();
    this.GetSaleOrder();
  }
  GetSaleOrder() {
    var sale = new SaleOrderVM
    sale.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSaleOrder(sale).subscribe({
      next: (res: SaleOrderVM[]) => {
        this.saleOrder = res;
        this.dataSource = this.saleOrder.slice();
        this.transform();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  transform() {
    this.dataSource = this.saleOrder
    this.firstdate = this.datePipe.transform(this.fromDate, 'yyyy-MM-dd');
    this.lastdate = this.datePipe.transform(this.toDate, 'yyyy-MM-dd');
    this.dataSource = this.dataSource.filter((e: { createdOn: string | number | Date; }) =>
      ((this.datePipe.transform(e.createdOn, 'yyyy-MM-dd') == this.firstdate) ||
        (this.datePipe.transform(e.createdOn, 'yyyy-MM-dd')! >= this.firstdate)) &&
      ((this.datePipe.transform(e.createdOn, 'yyyy-MM-dd')! <= this.lastdate) ||
        (this.datePipe.transform(e.createdOn, 'yyyy-MM-dd') == this.lastdate)))
  }
}
