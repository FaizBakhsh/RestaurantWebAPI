import { ChangeDetectorRef, Component, Injector, OnInit, ViewChild } from '@angular/core';
import { RoleVM } from '../models/role-vm';
import { SecurityService } from '../security.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { SettingsTypeVM } from '../../catalog/Models/SettingsTypeVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { ActivatedRoute } from '@angular/router';
import { CatalogService } from '../../catalog/catalog.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
@Component({
  selector: 'app-manage-role',
  templateUrl: './manage-role.component.html',
  styleUrls: ['./manage-role.component.css']
})
export class ManageRoleComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  EnumLine: SettingsVM[] = [];
  selectedEnumLine: SettingsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'module', 'isActive'];
  dataSource: any;
  dialogData;
  selectedEnum: SettingsTypeVM
  isDialog: boolean = false
  dialogref: any
  dialogRef: any
  enumTypeId
  moduleId: number = 0
  clientId: number = 0
  modules: SettingsVM[]
  isReadOnly: boolean = false
  constructor(
    private injector: Injector,
    private dialog: MatDialog,
    private aRoute: ActivatedRoute,
    private catSvc: CatalogService,
    private cdRef: ChangeDetectorRef,
  ) {
    this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedEnumLine = new SettingsVM();
    this.selectedEnum = new SettingsTypeVM
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Roles)
    this.aRoute.queryParams.subscribe(params => {
      var type = params['type'];
      if (type > 0) {
        this.enumTypeId = type
        this.moduleId = 0
      }
      this.GetEnum()
      this.GetEnumLine()
    });
    this.selectedEnumLine.isActive = true
    this.getModules()
  }
  ngAfterContentChecked() {
    this.cdRef.detectChanges();
  }
  getModules() {
    var stng = new SettingsVM
    stng.isActive = true
    stng.enumTypeId = EnumTypeVM.BackOffice
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        res = res.filter(x => x.isSystemDefined == false)
        this.modules = res
      }, error: () => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
      }
    })
  }
  GetEnum() {
    var type = new SettingsTypeVM
    type.id = this.enumTypeId
    this.catSvc.SearchSettingsType(type).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.selectedEnum = res[0];
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetEnumLine() {
    var stng = new SettingsVM
    stng.enumTypeId = this.enumTypeId
    stng.clientId = 0
    this.catSvc.SearchEnumLine(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.EnumLine = res;
        this.dataSource = new MatTableDataSource(this.EnumLine);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetEnumLineForEdit(id: number) {
    window.scrollTo(0, 0)
    var stng = new SettingsVM;
    stng.id = id
    stng.enumTypeId = this.enumTypeId
    stng.clientId = 0
    this.catSvc.SearchEnumLine(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.selectedEnumLine = res[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveEnumLine() {
    if (this.selectedEnumLine.moduleId == 0 || this.selectedEnumLine.moduleId == undefined)
      this.userForm.controls["moduleId"].setErrors({ "incorrect": true })
    if (!this.userForm.invalid) {
      this.selectedEnumLine.enumTypeId = this.enumTypeId
      this.selectedEnumLine.clientId = 0
      this.selectedEnumLine.isSystemDefined = true
      this.selectedEnumLine.value = this.selectedEnumLine.name
      this.selectedEnumLine.keyCode = this.selectedEnumLine.name.replaceAll(" ", "_")
      if (this.Edit)
        this.UpdateEnumLine()
      else {
        this.catSvc.SaveSettings(this.selectedEnumLine).subscribe({
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
      this.catSvc.ErrorMsgBar("Please Fill required field!", 5000)
  }
  UpdateEnumLine() {
    this.catSvc.UpdateSettings(this.selectedEnumLine).subscribe({
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
    this.EnumLine = []
    this.Add = true;
    this.Edit = false;
    this.selectedEnumLine = new SettingsVM
    this.selectedEnumLine.clientId = 0
    this.GetEnumLine()
    this.selectedEnumLine.isActive = true
  }
  Reset() {
    this.Add = true;
    this.Edit = false;
    this.selectedEnumLine = new SettingsVM
    this.selectedEnumLine.clientId = 0
    this.GetEnumLine()
    this.selectedEnumLine.isActive = true
  }
}
