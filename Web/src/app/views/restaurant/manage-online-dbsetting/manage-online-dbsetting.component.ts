import { RestaurantService } from './../../restaurant/restaurant.service';
import { BranchVM } from './../../restaurant/Models/BranchVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { OnlineDBSettingVM } from '../../restaurant/Models/OnlineDBSettingVM';
import { CatalogService } from '../../catalog/catalog.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
//import { SecurityService } from '../security.service';

@Component({
  selector: 'app-manage-online-dbsetting',
  templateUrl: './manage-online-dbsetting.component.html',
  styleUrls: ['./manage-online-dbsetting.component.css']
})
export class ManageOnlineDBSettingComponent implements OnInit {
  Edit: boolean = false;
  hide = true;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  selectedDBSetting: OnlineDBSettingVM
  DBSetting: OnlineDBSettingVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['dbName', 'serverName', 'userName', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    public resSVC: RestaurantService,
    private catSvc: CatalogService,

  ) {
    this.selectedDBSetting = new OnlineDBSettingVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.OnlineDBSetting)
    this.Add = true;
    this.Edit = false;
    this.selectedDBSetting = new OnlineDBSettingVM
    this.GetDBSetting();
    this.selectedDBSetting.isActive = true
  }
  GetDBSetting() {
    var stng = new OnlineDBSettingVM
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchOnlineDBSetting(stng).subscribe({
      next: (res: OnlineDBSettingVM[]) => {
        this.DBSetting = res;
        console.warn(res);
        this.dataSource = new MatTableDataSource(this.DBSetting);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occured!", 5000)
        console.warn(e);
      }
    })
  }
  DeleteDBSetting(id: number) {
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
        this.resSvc.DeleteOnlineDBSetting(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'DBSetting has been deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occured!", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetDBSettingForEdit(id: number) {
    this.selectedDBSetting = new OnlineDBSettingVM;
    this.selectedDBSetting.id = id
    this.selectedDBSetting.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchOnlineDBSetting(this.selectedDBSetting).subscribe({
      next: (res: OnlineDBSettingVM[]) => {
        this.DBSetting = res;
        console.warn(this.DBSetting);
        this.selectedDBSetting = this.DBSetting[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occured!", 5000)
        console.warn(e);
      }
    })
  }
  SaveDBSetting() {
    debugger
    if (!this.userForm.invalid) {
      this.selectedDBSetting.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SaveOnlineDBSetting(this.selectedDBSetting).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyAddMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occured!", 5000)
          console.warn(e);
        }
      })
    } else
      this.catSvc.ErrorMsgBar("Error Occured!", 5000)
  }
  UpdateDBSetting() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedDBSetting.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.UpdateOnlineDBSetting(this.selectedDBSetting).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyUpdateMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occured!", 5000)
          console.warn(e);
        }
      })
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  Refresh() {
    this.selectedDBSetting = new OnlineDBSettingVM
    this.Add = true;
    this.Edit = false;
    this.selectedDBSetting.isActive = true;
  }
}
