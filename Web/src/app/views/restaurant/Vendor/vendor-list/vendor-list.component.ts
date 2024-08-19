import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { VendorVM } from '../../Models/VendorVM';
import { RestaurantService } from '../../restaurant.service';

@Component({
  selector: 'app-vendor-list',
  templateUrl: './vendor-list.component.html',
  styleUrls: ['./vendor-list.component.css']
})
export class VendorListComponent implements OnInit {
  getEmpById!: VendorVM;
  Vendor: VendorVM[] | undefined;;
  Edit: boolean = true;
  displayedColumns: string[] = ['Name', 'Email', 'area', 'code', 'account', 'Phone', 'Address', 'City', 'Action'];
  dataSource: any;
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
    this.resSvc.selectedVendor = new VendorVM();
  }
  ngOnInit(): void {
    this.GetVendor();
  }
  GetVendor() {
    this.resSvc.GetVendor().subscribe((res: VendorVM[]) => {
      this.Vendor = res;
      console.warn(this.Vendor)
      this.dataSource = new MatTableDataSource(this.Vendor);
    });
  }
  EditVendor(cust: VendorVM) {
    this.route.navigate(['/restaurant/manageVendor'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteVendor(id: number) {
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
        this.resSvc.DeleteVendor(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Vendor has been deleted.',
            'success'
          )
          this.GetVendor();
        })
      }
    })
  }
}
