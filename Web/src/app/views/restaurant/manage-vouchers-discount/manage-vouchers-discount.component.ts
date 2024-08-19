import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import Swal from 'sweetalert2';
import { VouchersDiscountVM } from '../Models/VouchersDiscountVM';
import { RestaurantService } from '../restaurant.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-vouchers-discount',
  templateUrl: './manage-vouchers-discount.component.html',
  styleUrls: ['./manage-vouchers-discount.component.css']
})
export class ManageVouchersDiscountComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  selectedVouchersDiscount: VouchersDiscountVM
  VouchersDiscount: VouchersDiscountVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['key', 'value', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedVouchersDiscount = new VouchersDiscountVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.DiscVoucher)
    this.GetVouchersDiscount();
    this.Add = true
    this.Edit = false
    this.selectedVouchersDiscount = new VouchersDiscountVM;
    this.selectedVouchersDiscount.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetVouchersDiscount() {
    var disc = new VouchersDiscountVM
    disc.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchVouchersDiscount(disc).subscribe({
      next: (res: VouchersDiscountVM[]) => {
        this.VouchersDiscount = res;
        this.dataSource = new MatTableDataSource(this.VouchersDiscount);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteVouchersDiscount(id: number) {
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
        this.resSvc.DeleteVouchersDiscount(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetVouchersDiscountForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedVouchersDiscount = new VouchersDiscountVM;
    this.selectedVouchersDiscount.id = id
    this.selectedVouchersDiscount.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchVouchersDiscount(this.selectedVouchersDiscount).subscribe({
      next: (res: VouchersDiscountVM[]) => {
        this.VouchersDiscount = res;
        this.selectedVouchersDiscount = this.VouchersDiscount[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveVouchersDiscount() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedVouchersDiscount.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SaveVouchersDiscount(this.selectedVouchersDiscount).subscribe({
        next: (res) => {
          console.warn(res);
          this.resSvc.GetVouchersDiscount().subscribe((res: VouchersDiscountVM[]) => {
            this.VouchersDiscount = res;
            this.dataSource = new MatTableDataSource(this.VouchersDiscount);
            this.ngOnInit();
          });
          this.catSvc.SuccessfullyAddMsg()
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  }
  UpdateVouchersDiscount() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedVouchersDiscount.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.UpdateVouchersDiscount(this.selectedVouchersDiscount).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyUpdateMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  }
  Refresh() {
    this.selectedVouchersDiscount = new VouchersDiscountVM;
    this.Add = true;
    this.Edit = false;
    this.selectedVouchersDiscount.isActive = true;
  }
}

