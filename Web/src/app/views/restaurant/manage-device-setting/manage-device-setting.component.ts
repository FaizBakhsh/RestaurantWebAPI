import { ItemsService } from './../../items/items.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import Swal from 'sweetalert2';
import { DeviceSettingVM } from '../Models/DeviceSettingVM';
import { EnumValueVM } from '../Models/Enums/EnumValueVM';
import { RestaurantService } from '../restaurant.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { CatalogService } from '../../catalog/catalog.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-device-setting',
  templateUrl: './manage-device-setting.component.html',
  styleUrls: ['./manage-device-setting.component.css']
})
export class ManageDeviceSettingComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Devices?: SettingsVM[];
  DeviceSetting: DeviceSettingVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Device', 'ScreenNo', 'Terminal', 'isEnable', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  selectedDeviceSetting: DeviceSettingVM
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    public itmSvc: ItemsService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedDeviceSetting = new DeviceSettingVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.DeviceSettings)
    this.Add = true;
    this.Edit = false;
    this.selectedDeviceSetting = new DeviceSettingVM
    this.GetDeviceSetting();
    this.GetDevices()
    this.selectedDeviceSetting.isActive = true;
  }
  GetDevices() {
    var setting = new SettingsVM()
    setting.enumTypeId = EnumTypeVM.Devices;
    this.itmSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        this.Devices = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetDeviceSetting() {
    var stng = new DeviceSettingVM
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchDeviceSetting(stng).subscribe({
      next: (res: DeviceSettingVM[]) => {
        this.DeviceSetting = res;
        this.dataSource = new MatTableDataSource(this.DeviceSetting);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteDeviceSetting(id: number) {
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
        this.resSvc.DeleteDeviceSetting(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'DeviceSetting has been deleted.',
              'success'
            )
            this.GetDeviceSetting();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetDeviceSettingForEdit(id: number) {
    this.selectedDeviceSetting = new DeviceSettingVM;
    this.selectedDeviceSetting.id = id
    this.selectedDeviceSetting.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchDeviceSetting(this.selectedDeviceSetting).subscribe({
      next: (res: DeviceSettingVM[]) => {
        this.DeviceSetting = res;
        console.warn(this.DeviceSetting);
        this.selectedDeviceSetting = this.DeviceSetting[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveDeviceSetting() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.selectedDeviceSetting.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SaveDeviceSetting(this.selectedDeviceSetting).subscribe({
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
  UpdateDeviceSetting() {
    this.proccessing = true
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedDeviceSetting.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.UpdateDeviceSetting(this.selectedDeviceSetting).subscribe({
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
    this.selectedDeviceSetting = new DeviceSettingVM;
    this.Add = true;
    this.Edit = false;
    this.selectedDeviceSetting.isActive = true
  }
}

