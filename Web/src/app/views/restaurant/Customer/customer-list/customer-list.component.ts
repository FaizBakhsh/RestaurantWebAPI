import { CatalogService } from './../../../catalog/catalog.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { CustomerVM } from '../../Models/CustomerVM';
import { RestaurantService } from '../../restaurant.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.css']
})
export class CustomerListComponent implements OnInit {
  isReadOnly: boolean = false
  getCustById!: CustomerVM;
  Customer: CustomerVM[] | undefined;;
  Edit: boolean = true;
  displayedColumns: string[] = ['Name', 'Account', 'Branch', 'Phone', 'Email', 'Address', 'City', 'isActive', 'Action'];
  dataSource: any;
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
    public catSvc: CatalogService
  ) {
    this.resSvc.selectedCustomer = new CustomerVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.CustomerInfo)
    this.GetCustomer();
  }
  GetCustomer() {
    var cust = new CustomerVM
    cust.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchCustomer(cust).subscribe({
      next: (res: CustomerVM[]) => {
        this.Customer = res;
        console.warn(this.Customer)
        this.dataSource = new MatTableDataSource(this.Customer);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  EditCustomer(cust: CustomerVM) {
    this.route.navigate(['/restaurant/sale/manageCustomer'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteCustomer(id: number) {
    debugger
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        this.resSvc.DeleteCustomer(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Customer has been deleted.',
              'success'
            )
            this.GetCustomer();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
            console.warn(e);
          }
        })
      }
    })
  }
}
