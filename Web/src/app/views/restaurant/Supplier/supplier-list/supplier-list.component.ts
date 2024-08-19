import { CatalogService } from './../../../catalog/catalog.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { SupplierVM } from '../../Models/SupplierVM';
import { RestaurantService } from '../../restaurant.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-supplier-list',
  templateUrl: './supplier-list.component.html',
  styleUrls: ['./supplier-list.component.css']
})
export class SupplierListComponent implements OnInit {
  getEmpById!: SupplierVM;
  Supplier: SupplierVM[] | undefined;;
  Edit: boolean = true;
  displayedColumns: string[] = ['Name', 'Email', 'area', 'code', 'Phone', 'creditDays', 'Address', 'City', 'isActive', 'Action'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.resSvc.selectedSupplier = new SupplierVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Supplier)
    this.GetSupplier();
    this.resSvc.selectedSupplier.isActive = true
  }
  GetSupplier() {
    var supp = new SupplierVM
    supp.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSupplier(supp).subscribe({
      next: (res: SupplierVM[]) => {
        this.Supplier = res;
        console.warn(this.Supplier)
        this.dataSource = new MatTableDataSource(this.Supplier);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occured!", 4000);
        console.warn(e);
      }
    })
  }
  EditSupplier(sup: SupplierVM) {
    this.route.navigate(['/restaurant/product/manageSupplier'], {
      queryParams: {
        id: sup.id
      }
    });
  }
  DeleteSupplier(id: number) {
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
        this.resSvc.DeleteSupplier(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Supplier has been deleted.',
              'success'
            )
            this.GetSupplier();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
}
