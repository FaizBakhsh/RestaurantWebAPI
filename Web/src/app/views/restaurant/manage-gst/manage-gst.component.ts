import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { ItemsService } from './../../items/items.service';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { RestaurantService } from './../../restaurant/restaurant.service';
import { BranchVM } from './../../restaurant/Models/BranchVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { IconSetService } from '@coreui/icons-angular';
import { MatSnackBar } from '@angular/material/snack-bar';
import { iconSubset } from 'src/app/icons/icon-subset';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { GSTVM } from '../Models/GSTVM';
import { CatalogService } from '../../catalog/catalog.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-gst',
  templateUrl: './manage-gst.component.html',
  styleUrls: ['./manage-gst.component.css']
})
export class ManageGSTComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  GST: GSTVM[] | undefined;
  PaymentType?: SettingsVM[];
  selectedGST: GSTVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['gst', 'paymentType', 'receiptTitle', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSVC: RestaurantService,
    public itmSVC: ItemsService,
    private catSvc: CatalogService,
  ) {
    this.selectedGST = new GSTVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.GST)
    this.Add = true;
    this.Edit = false;
    this.selectedGST = new GSTVM
    this.GetPaymentType();
    this.GetGST();
    this.selectedGST.isActive = true;
  }
  GetGST() {
    var gst = new GSTVM
    gst.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchGST(gst).subscribe({
      next: (res: GSTVM[]) => {
        this.GST = res;
        this.dataSource = new MatTableDataSource(this.GST);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetPaymentType() {
    var setting = new SettingsVM()
    setting.enumTypeId = EnumTypeVM.PaymentType;
    setting.isActive = true
    this.itmSVC.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        this.PaymentType = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteGST(id: number) {
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
        this.resSVC.DeleteGST(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'GST has been deleted.',
              'success'
            )
            this.GetGST();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetGSTForEdit(id: number) {
    this.selectedGST = new GSTVM;
    this.selectedGST.id = id
    this.selectedGST.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchGST(this.selectedGST).subscribe({
      next: (res: GSTVM[]) => {
        this.GST = res;
        console.warn(this.GST);
        this.selectedGST = this.GST[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveGST() {
    if (this.selectedGST.paymentTypeId == 0 || this.selectedGST.paymentTypeId == undefined)
      this.userForm.controls['paymentTypeId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      var gst = new GSTVM
      gst.paymentTypeId = this.selectedGST.paymentTypeId
      gst.clientId = +localStorage.getItem("RMSClientId")
      this.resSVC.SearchGST(gst).subscribe({
        next: (retVal: GSTVM[]) => {
          if (this.Edit)
            retVal = retVal.filter(x => x.id != this.selectedGST.id)
          if (retVal.length > 0)
            this.catSvc.ErrorMsgBar("GST against this Payment Method Already Added!", 5000)
          else {
            this.selectedGST.clientId = +localStorage.getItem("RMSClientId")
            if (this.Edit)
              this.UpdateGST()
            else {
              this.resSVC.SaveGST(this.selectedGST).subscribe({
                next: (res) => {
                  this.catSvc.SuccessfullyAddMsg()
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
        }, error: (err) => {

        },
      })

    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateGST() {
    this.resSVC.UpdateGST(this.selectedGST).subscribe({
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
  Refresh() {
    this.selectedGST = new GSTVM
    this.Add = true;
    this.Edit = false;
    this.selectedGST.isActive = true;
  }
}
