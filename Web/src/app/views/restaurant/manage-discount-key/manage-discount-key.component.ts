import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import Swal from 'sweetalert2';
import { CatalogService } from '../../catalog/catalog.service';
import { DiscountKeyVM } from '../Models/DiscountKeyVM';
import { RestaurantService } from '../restaurant.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-discount-key',
  templateUrl: './manage-discount-key.component.html',
  styleUrls: ['./manage-discount-key.component.css']
})
export class ManageDiscountKeyComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  selectedDiscountKey: DiscountKeyVM
  discountKey: DiscountKeyVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['discountKey', 'value', 'discLimit', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedDiscountKey = new DiscountKeyVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.DiscountKeys)
    this.GetDiscountKey();
    this.selectedDiscountKey = new DiscountKeyVM;
    this.selectedDiscountKey.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetDiscountKey() {
    var key = new DiscountKeyVM
    key.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchDiscountKey(key).subscribe({
      next: (res: DiscountKeyVM[]) => {
        this.discountKey = res;
        this.dataSource = new MatTableDataSource(this.discountKey);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteDiscountKey(id: number) {
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
        this.resSvc.DeleteDiscountKey(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'DiscountKey has been deleted.',
              'success'
            )
            this.GetDiscountKey();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetDiscountKeyForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedDiscountKey = new DiscountKeyVM;
    this.selectedDiscountKey.id = id
    this.selectedDiscountKey.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchDiscountKey(this.selectedDiscountKey).subscribe({
      next: (res: DiscountKeyVM[]) => {
        this.discountKey = res;
        console.warn(this.discountKey);
        this.selectedDiscountKey = this.discountKey[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveDiscountKey() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedDiscountKey.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SaveDiscountKey(this.selectedDiscountKey).subscribe({
        next: (res) => {
          console.warn(res);
          this.resSvc.GetDiscountKeys().subscribe((res: DiscountKeyVM[]) => {
            this.discountKey = res;
            this.dataSource = new MatTableDataSource(this.discountKey);
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
  UpdateDiscountKey() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedDiscountKey.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.UpdateDiscountKey(this.selectedDiscountKey).subscribe({
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
    this.selectedDiscountKey = new DiscountKeyVM;
    this.selectedDiscountKey.discountKey = "";
    this.Add = true;
    this.Edit = false;
    this.selectedDiscountKey.isActive = true;
  }
}

