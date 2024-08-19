import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { RestaurantService } from './../restaurant.service';

import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { IconSetService } from '@coreui/icons-angular';
import { MatSnackBar } from '@angular/material/snack-bar';
import { iconSubset } from 'src/app/icons/icon-subset';
import { UOMConversionVM } from '../Models/UOMConversionVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { ItemsService } from '../../items/items.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-uomconversion',
  templateUrl: './manage-uomconversion.component.html',
  styleUrls: ['./manage-uomconversion.component.css']
})
export class ManageUOMConversionComponent implements OnInit {
  isReadOnly: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  uom?: SettingsVM[];
  selectedUOMConversion: UOMConversionVM
  UOMConversion: UOMConversionVM[] | undefined;
  UOMConversions?: UOMConversionVM[];
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['UOM', 'QTY', 'ConversionRate', 'ConvertedUOM', 'isActive', 'actions'];
  dataSource: any;
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedUOMConversion = new UOMConversionVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.UOMConverison)
    this.Add = true;
    this.Edit = false;
    this.selectedUOMConversion = new UOMConversionVM
    this.GetUOMConversion();
    this.GetUOM();
    this.selectedUOMConversion.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetUOMConversion() {
    var cnvrn = new UOMConversionVM
    cnvrn.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchUOMConversion(cnvrn).subscribe({
      next: (res: UOMConversionVM[]) => {
        this.UOMConversion = res;
        this.UOMConversions = res;
        this.dataSource = new MatTableDataSource(this.UOMConversion);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetUOM() {
    var setting = new SettingsVM()
    setting.isActive = true
    setting.enumTypeId = EnumTypeVM.UOM
    setting.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        this.uom = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteUOMConversion(id: number) {
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
        this.resSvc.DeleteUOMConversion(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'UOMConversion has been deleted.',
              'success'
            )
            this.GetUOMConversion();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetUOMConversionForEdit(id: number) {
    this.selectedUOMConversion = new UOMConversionVM;
    this.selectedUOMConversion.id = id
    this.selectedUOMConversion.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchUOMConversion(this.selectedUOMConversion).subscribe({
      next: (res: UOMConversionVM[]) => {
        this.UOMConversion = res;
        console.warn(this.UOMConversion);
        this.selectedUOMConversion = this.UOMConversion[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveUOMConversion() {
    if (this.selectedUOMConversion.uomId == 0 || this.selectedUOMConversion.uomId == undefined)
      this.userForm.controls['uomId'].setErrors({ incorrect: true })
    if (this.selectedUOMConversion.convertedUOMId == 0 || this.selectedUOMConversion.convertedUOMId == undefined)
      this.userForm.controls['convertedUOMId'].setErrors({ incorrect: true })
    if (!this.userForm.invalid) {
      var conv = new UOMConversionVM
      conv.uomId = this.selectedUOMConversion.uomId
      conv.convertedUOMId = this.selectedUOMConversion.convertedUOMId
      conv.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SearchUOMConversion(conv).subscribe({
        next: (retVal: UOMConversionVM[]) => {
          if (this.Edit)
            retVal = retVal.filter(x => x.id != this.selectedUOMConversion.id)
          if (retVal.length > 0)
            this.catSvc.ErrorMsgBar("This UOM already converted in this UOM", 5000)
          else {
            this.selectedUOMConversion.clientId = +localStorage.getItem("RMSClientId")
            if (this.Edit)
              this.UpdateUOMConversion();
            else
              this.resSvc.SaveUOMConversion(this.selectedUOMConversion).subscribe({
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
        }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateUOMConversion() {
    this.resSvc.UpdateUOMConversion(this.selectedUOMConversion).subscribe({
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
    this.selectedUOMConversion = new UOMConversionVM
    this.Add = true;
    this.Edit = false;
    this.selectedUOMConversion.isActive = true;
  }
}

