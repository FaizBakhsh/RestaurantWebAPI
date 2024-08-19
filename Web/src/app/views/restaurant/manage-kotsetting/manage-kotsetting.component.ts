import { ItemsService } from './../../items/items.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import Swal from 'sweetalert2';
import { KOTSettingVM } from '../Models/KOTSettingVM';
import { EnumValueVM } from '../Models/Enums/EnumValueVM';
import { RestaurantService } from '../restaurant.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { CatalogService } from '../../catalog/catalog.service';

@Component({
  selector: 'app-manage-kotsetting',
  templateUrl: './manage-kotsetting.component.html',
  styleUrls: ['./manage-kotsetting.component.css']
})
export class ManageKOTSettingComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Printers?: SettingsVM[];
  KOTSetting: KOTSettingVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['KDSName', 'Printer', 'kitchenBell', 'actions'];
  dataSource: any;
  selectedKOTSetting: KOTSettingVM
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    public itmSvc: ItemsService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedKOTSetting = new KOTSettingVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedKOTSetting = new KOTSettingVM
    this.GetKOTSetting();
    this.GetPrinters()
    this.selectedKOTSetting.isActive = true;
  }
  GetPrinters() {
    var setting = new SettingsVM()
    setting.isActive = true
    setting.enumTypeId = EnumTypeVM.Printers;
    this.itmSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        this.Printers = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetKOTSetting() {
    var kotStng= new KOTSettingVM
    kotStng.clientId=+localStorage.getItem("RMSClientId")
    this.resSvc.SearchKOTSetting(kotStng).subscribe({
      next: (res: KOTSettingVM[]) => {
        this.KOTSetting = res;
        this.dataSource = new MatTableDataSource(this.KOTSetting);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteKOTSetting(id: number) {
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
        this.resSvc.DeleteKOTSetting(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'KOTSetting has been deleted.',
              'success'
            )
            this.GetKOTSetting();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetKOTSettingForEdit(id: number) {
    this.selectedKOTSetting = new KOTSettingVM;
    this.selectedKOTSetting.id = id
    this.selectedKOTSetting.clientId=+localStorage.getItem("RMSClientId")
    this.resSvc.SearchKOTSetting(this.selectedKOTSetting).subscribe({
      next: (res: KOTSettingVM[]) => {
        this.KOTSetting = res;
        console.warn(this.KOTSetting);
        this.selectedKOTSetting = this.KOTSetting[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveKOTSetting() {
    this.proccessing = true
    if(this.selectedKOTSetting.printerId==null || this.selectedKOTSetting.printerId==0)
    this.userForm.controls["printerId"].setErrors({"incorrect":true})
    if (!this.userForm.invalid) {
      this.selectedKOTSetting.clientId=+localStorage.getItem("RMSClientId")
      if(this.Edit)
      this.UpdateKOTSetting()
    else
      this.resSvc.SaveKOTSetting(this.selectedKOTSetting).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyAddMsg()
          this.Add = true;
          this.Edit = false;
          this.proccessing = false
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
          this.proccessing = false
        }
      })
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  UpdateKOTSetting() {
    this.proccessing = true
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedKOTSetting.clientId=+localStorage.getItem("RMSClientId")
      this.resSvc.UpdateKOTSetting(this.selectedKOTSetting).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyUpdateMsg()
          this.Add = true;
          this.Edit = false;
          this.proccessing = false
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
          this.proccessing = false
        }
      })
    }
    else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  Refresh() {
    this.selectedKOTSetting = new KOTSettingVM;
    this.Add = true;
    this.Edit = false;
    this.selectedKOTSetting.isActive= true;
  }
}

