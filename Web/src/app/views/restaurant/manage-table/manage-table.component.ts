import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-table',
  templateUrl: './manage-table.component.html',
  styleUrls: ['./manage-table.component.css']
})
export class ManageTableComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Table: SettingsVM[] = [];
  selectedTable: SettingsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Floor', 'name', 'description', 'isActive', 'actions'];
  dataSource: any;
  dialogData;
  isDialog: boolean = false
  Floors: SettingsVM[]
  dialogref: any
  dialogRef: any
  isReadOnly: boolean = false
  constructor(
    private catSvc: CatalogService,
    private cdRef: ChangeDetectorRef,
  ) {
    this.selectedTable = new SettingsVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Table)
    this.Refresh()
    this.GetTable();
    this.GetFloor()
    this.selectedTable.isActive = true
  }
  ngAfterContentChecked() {
    this.cdRef.detectChanges();
  }
  GetTable() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.Table
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Table = res;
        this.dataSource = new MatTableDataSource(this.Table);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetFloor() {
    var stng = new SettingsVM
    stng.isActive = true
    stng.clientId = +localStorage.getItem("RMSClientId")
    stng.enumTypeId = EnumTypeVM.Floor
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Floors = res;
        console.warn(this.Floors)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteTable(val: SettingsVM) {
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
        this.catSvc.DeleteSettings(val.id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Successfuly Deleted.',
              'success'
            )
            this.selectedTable.parentId = val.parentId
            this.Reset();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetTableForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedTable = new SettingsVM;
    this.selectedTable.id = id
    this.selectedTable.enumTypeId = EnumTypeVM.Table
    this.selectedTable.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(this.selectedTable).subscribe({
      next: (res: SettingsVM[]) => {
        this.Table = res;
        this.selectedTable = this.Table[0]
        this.SearchbyFloor(this.selectedTable.parentId)
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveTable() {
    if (this.selectedTable.parentId == 0 || this.selectedTable.parentId == undefined)
      this.userForm.controls['parentId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedTable.clientId = +localStorage.getItem("RMSClientId")
      this.selectedTable.enumTypeId = EnumTypeVM.Table
      if (this.Edit)
        this.UpdateTable()
      else {
        this.catSvc.SaveSettings(this.selectedTable).subscribe({
          next: (res) => {
            this.catSvc.SuccessfullyAddMsg()
            this.Reset();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateTable() {
    this.catSvc.UpdateSettings(this.selectedTable).subscribe({
      next: (res) => {
        this.catSvc.SuccessfullyUpdateMsg()
        this.Reset();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.Table = []
    this.Add = true;
    this.Edit = false;
    this.selectedTable = new SettingsVM
    this.GetTable()
    this.selectedTable.isActive = true
  }
  Reset() {
    this.Add = true;
    this.Edit = false;
    this.selectedTable.description = null
    this.selectedTable.keyCode = null
    this.selectedTable.name = null
    this.SearchbyFloor(this.selectedTable.parentId)
  }
  SearchbyFloor(id: number) {
    debugger
    var stng = new SettingsVM
    stng.parentId = id
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Table = res;
        this.dataSource = new MatTableDataSource(res);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
}


