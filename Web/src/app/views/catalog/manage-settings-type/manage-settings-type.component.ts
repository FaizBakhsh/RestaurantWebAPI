import { CatalogService } from './../catalog.service';
import { SettingsTypeVM } from '../../catalog/Models/SettingsTypeVM';
import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';

@Component({
  selector: 'app-manage-settings-type',
  templateUrl: './manage-settings-type.component.html',
  styleUrls: ['./manage-settings-type.component.css']
})
export class ManageSettingsTypeComponent implements OnInit {
  Edit: boolean = false;
  IsUnique: boolean = true;
  Add: boolean = true;
  parentId?: number;
  validFields: boolean = false;
  public date = new Date();
  types?: SettingsTypeVM[];
  settingsType?: SettingsTypeVM[];
  searchedType?: SettingsTypeVM[];
  settingsTypeById?: SettingsTypeVM[];
  modules: SettingsVM[]
  moduleId: number
  isReadOnly: boolean = false
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'keyCode', 'parent', 'description', 'actions'];
  dataSource: any;
  dialogData: any
  selectedSettingsType: SettingsTypeVM
  constructor(
    public dialogRef: MatDialogRef<ManageSettingsTypeComponent>,
    public catLogSvc: CatalogService,
    private snack: MatSnackBar,
    private injector: Injector,
    public dialog: MatDialog,) {
    this.moduleId = 0
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedSettingsType = new SettingsTypeVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    if (this.dialogData)
      if (this.dialogData.moduleId > 0) {
        this.isReadOnly = true
        this.moduleId = this.dialogData.moduleId
      }
    this.selectedSettingsType.moduleId = this.moduleId
    this.selectedSettingsType = new SettingsTypeVM();
    this.GetSettingsType();
    this.getModules()
  }
  getModules() {
    var stng = new SettingsVM
    stng.isActive = true
    stng.enumTypeId = EnumTypeVM.BackOffice
    this.catLogSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        console.warn(res)
        res = res.filter(x => x.isSystemDefined == false)
        console.warn(res)
        this.modules = res
      }, error: () => {
        this.catLogSvc.ErrorMsgBar("Error Occurred", 4000)
      }
    })
  }
  Check() {
    this.validFields = true;
  }
  GetSettingsType() {
    var type = new SettingsTypeVM
    type.moduleId = this.moduleId
    type.clientId = +localStorage.getItem("RMSClientId")
    this.catLogSvc.SearchEnums(type).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.settingsType = res;
        this.searchedType = this.settingsType;
        this.types = this.settingsType;
        this.dataSource = new MatTableDataSource(this.settingsType);
      }, error: (e) => {
        this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetType() {
    var type = new SettingsTypeVM
    type.isActive = true
    //if (this.moduleId > 0)
    type.moduleId = this.moduleId
    type.clientId = +localStorage.getItem("RMSClientId")
    this.catLogSvc.SearchEnums(type).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.types = res;
      }, error: (e) => {
        this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  Search() {
    var type = new SettingsTypeVM();
    type.parentId = this.selectedSettingsType.parentId;
    type.moduleId = this.moduleId
    type.clientId = +localStorage.getItem("RMSClientId")
    this.catLogSvc.SearchEnums(type).subscribe((res: SettingsTypeVM[]) => {
      this.searchedType = res;
      this.dataSource = new MatTableDataSource(this.searchedType);
    });
  }
  DeleteSettingsType(id: number) {
    var setting = new SettingsVM()
    setting.enumTypeId = id;
    this.catLogSvc.SearchSettings(setting).subscribe((res: SettingsVM[]) => {
      console.warn(res)
      if (res.length == 0) {
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
            this.catLogSvc.DeleteSettingsType(id).subscribe({
              next: (res) => {
                Swal.fire(
                  'Deleted!',
                  'success'
                )
                this.Search();
                this.GetType();
              }, error: (e) => {
                this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
                console.warn(e);
              }
            })
          }
        })
      }
      else if (res.length == 1)
        this.catLogSvc.ErrorMsgBar("Unable to delete because it contains a child!", 5000)
      else
        this.catLogSvc.ErrorMsgBar("Unable to delete because it contains Children!", 5000)
    });
  }
  GetSettingsTypeForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedSettingsType = new SettingsTypeVM;
    this.selectedSettingsType.id = id
    this.catLogSvc.SearchSettingsType(this.selectedSettingsType).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.settingsTypeById = res;
        this.selectedSettingsType = this.settingsTypeById[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveSettingsType() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      // if (this.IsUnique == true) {
      this.selectedSettingsType.clientId=+localStorage.getItem("RMSClientId")
      this.catLogSvc.SaveSettingsType(this.selectedSettingsType).subscribe({
        next: (res) => {
          this.catLogSvc.SuccessMsgBar("Successfully Added", 6000)
          this.Search();
          this.GetType();
          this.selectedSettingsType = new SettingsTypeVM
        }, error: (e) => {
          this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
      // } else
      //  this.catLogSvc.ErrorMsgBar('This Key Code is Already in Use!', 5000)
    } else
      this.catLogSvc.ErrorMsgBar('Please fill all required fields!', 5000)
  }
  UpdateSettingsType() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      // if (this.IsUnique == true) {
      this.catLogSvc.UpdateSettingsType(this.selectedSettingsType).subscribe({
        next: (res) => {
          this.catLogSvc.SuccessMsgBar("Successfully Updated", 6000)
          this.Add = true;
          this.Edit = false;
          this.Search();
          this.GetType();
          // this.selectedSettingsType.keyCode=undefined
          // this.selectedSettingsType.name=undefined
          // this.selectedSettingsType.parentId=0
          // this.selectedSettingsType.isSystemDefined=false
          this.selectedSettingsType = new SettingsTypeVM
        }, error: (e) => {
          this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
      //}
      // else
      this.catLogSvc.ErrorMsgBar('This Key Code is Already in Use!', 5000)
    } else
      this.catLogSvc.ErrorMsgBar('Please fill all required fields!', 5000)
  }
  Refresh() {
    // this.selectedSettingsType = new SettingsTypeVM;
    // this.Add = true;
    // this.Edit = false;
    this.GetSettingsType();
  }
  onSearchChange() {
    this.IsUnique = true;
    if (this.Edit == true)
      this.types = this.types?.filter(x => x.id != this.selectedSettingsType.id)
    var value = this.types?.find(x => x.keyCode == this.selectedSettingsType.keyCode)
    if (value == undefined)
      this.IsUnique = true;
    else
      this.IsUnique = false;
  }
  TextChangeEvent(event: any) {
    if (this.selectedSettingsType.isSystemDefined && this.Edit) {
    } else {
      this.selectedSettingsType.keyCode = event.target.value
      this.selectedSettingsType.keyCode = this.selectedSettingsType.keyCode?.replaceAll(' ', '_')
    }
  }
}

