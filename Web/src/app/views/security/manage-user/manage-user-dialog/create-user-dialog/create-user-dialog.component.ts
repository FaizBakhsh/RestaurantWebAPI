import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { BranchVM } from './../../../../restaurant/Models/BranchVM';
import { RestaurantService } from './../../../../restaurant/restaurant.service';

import { Component, Inject, Injector, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef, MatDialog } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup, NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
//import { NgxSpinnerService } from 'ngx-spinner';
import { finalize } from 'rxjs/operators'
import Swal from 'sweetalert2';
import { SecurityService } from '../../../security.service';
import { UserVM } from '../../../models/user-vm';
import { Location } from '@angular/common';
import { EmployeeVM } from 'src/app/views/employee-management/Models/EmployeeVM';
import { EmployeeManagementService } from 'src/app/views/employee-management/employee-management.service';
import { RoleVM } from '../../../models/role-vm';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { ClientsVM } from 'src/app/views/catalog/Models/ClientsVM';
import { Roles } from 'src/app/views/catalog/Models/Enums/Roles';
@Component({
  selector: 'app-create-user-dialog',
  templateUrl: './create-user-dialog.component.html',
  styleUrls: ['./create-user-dialog.component.css']
})
export class CreateUserDialogComponent implements OnInit {
  @ViewChild('userForm', { static: true }) userForm?: NgForm;
  messagebox: boolean = false;
  shouldShowRoles: boolean = true
  message: any;
  success?: boolean;
  error: string = '';
  submitted: boolean = false;
  user: boolean = false;
  Edit: boolean = false;
  employees?: EmployeeVM[]
  branches?: BranchVM[]
  Add: boolean = true;
  UserId: string = '';
  durationInSeconds = 3;
  selectedUser: UserVM
  isRoleDisabled: boolean = false
  hide = true;
  moduleId: number
  url = "https://localhost:7100/api/Users";
  users?: UserVM[];
  getbyIduser?: UserVM;
  dialogTitle: string;
  action?: string;
  roles: SettingsVM[]
  _allRoles: SettingsVM[]
  dialogData: any
  selectedClient: ClientsVM
  constructor(
    private location: Location,
    private snack: MatSnackBar,
    private injector: Injector,
    public resSVC: RestaurantService,
    public empSvc: EmployeeManagementService,
    public securityService: SecurityService,
    private route: ActivatedRoute,
    private catSvc: CatalogService,
    public dialogRef: MatDialogRef<CreateUserDialogComponent>,

  ) {
    this.dialogTitle = 'Add User';
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedUser = new UserVM();
    this.selectedClient = new ClientsVM
  }
  ngOnInit() {
    if (this.dialogData) {
      var moduleId = this.dialogData.moduleId
      if (moduleId > 0)
        this.moduleId = moduleId
      if (this.dialogData.id != undefined) {
        this.UserId = this.dialogData.id
        console.warn(this.dialogData.id)
        if (this.UserId != null) {
          this.Edit = true;
          this.Add = false;
          this.GetUserById();
        }
      }
      if (this.dialogData.clt != undefined) {
        //this.roles=this._allRoles
        this.isRoleDisabled = true
        this.selectedUser.roleId = Roles.ClientAdmin
        this.selectedClient = this.dialogData.clt
      }
    }
    // this.route.queryParams.subscribe(params => {
    //   this.UserId = params['id'];
    // });
    this.getRoles()
    this.GetBranch()
    this.GetEmployees()
    this.selectedUser.isActive = true
  }
  getRoles() {
    var stng = new SettingsVM
    stng.isActive = true
    stng.enumTypeId = EnumTypeVM.Roles
    stng.clientId = 0
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        debugger
        this._allRoles = res
        if (this.selectedClient.id > 0)
          this.roles = res
        else
          this.roles = res.filter(x => x.isSystemDefined != true)
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  GetEmployees() {
    var emp = new EmployeeVM
    emp.isActive = true
    this.empSvc.SearchEmployee(emp).subscribe({
      next: (res: EmployeeVM[]) => {
        this.employees = res;
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  GetBranch() {
    var branch = new BranchVM
    branch.isActive = true
    branch.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.branches = res;
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  validateNo(e): boolean {
    const charCode = e.which ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false
    }
    return true
  }
  SaveUser() {
    if (this.selectedUser.roleId == 0 || this.selectedUser.roleId == undefined)
      this.userForm.controls['roleId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedUser.userName = this.selectedUser.userPassword
      this.selectedUser.passwordHash = this.selectedUser.userPassword
      var user = new UserVM
      user.userName = this.selectedUser.userName
      this.securityService.SearchUser(user).subscribe({
        next: (value: UserVM[]) => {
          if (this.Edit)
            value = value.filter(x => x.id != this.selectedUser.id)
          if (value.length > 0)
            this.catSvc.ErrorMsgBar("Please change your password", 5000)
          else {
            var _user = new UserVM
            _user.email = this.selectedUser.email
            this.securityService.SearchUser(_user).subscribe({
              next: (usr: UserVM[]) => {
                debugger
                if (this.Edit)
                  usr = usr.filter(x => x.id != this.selectedUser.id)
                if (usr.length > 0)
                  this.catSvc.ErrorMsgBar("This Email already taken", 5000)
                else {
                  if (this.UserId != null && this.UserId != "") {
                    this.PutUser();
                  } else {
                    this.selectedUser.clientId = +localStorage.getItem("RMSClientId")
                    this.selectedUser.moduleId = this.moduleId

                    this.securityService.SaveUser(this.selectedUser).subscribe({
                      next: (data: any) => {
                        if (data.result.succeeded == true) {
                          this.messagebox = false;
                          Swal.fire({
                            icon: 'success',
                            position: 'center',
                            text: 'User Registered Successfully',
                            background: "#FFFFFF",
                            confirmButtonColor: "#000000"
                          })
                          if (this.selectedClient.id > 0) {
                            this.selectedClient.userId = data.userId
                            this.UpdateClient()
                          }
                          this.userForm?.reset();
                        }
                        else {
                          this.messagebox = true;
                          this.message = data.result.errors
                        }
                      }, error: (err) => {
                        if (err.status == 0) {
                          Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                            footer: 'Please check your Internet Connection'
                          })
                        }
                        else {
                          Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                          })
                        }
                      }
                    })
                  }
                }
              }, error: (e) => {
                this.snack.open('Error Occured!', 'OK', { duration: 4000 })
              }
            })
          }

        }, error: (err) => {

        },
      })

    }
    else
      this.catSvc.ErrorMsgBar("Please fill all required  fields", 5000)
  }
  UpdateClient() {
    this.catSvc.UpdateClients(this.selectedClient).subscribe({
      next: (res: ClientsVM) => {

      }, error: (e) => {
        console.warn(e)
        this.snack.open('Error Occurred!', 'OK', { duration: 4000 })
      }
    })
  }
  GetUserById() {
    this.selectedUser.id = this.UserId
    this.selectedUser.clientId = +localStorage.getItem("RMSClientId")
    this.securityService.SearchUserById(this.UserId).subscribe({
      next: (res: UserVM) => {
        this.getbyIduser = res;
        this.selectedUser = this.getbyIduser
        if (this.selectedUser.roleId == Roles.ClientAdmin || this.selectedUser.roleId == Roles.SuperAdmin)
          this.shouldShowRoles = false
      }, error: (e) => {
        console.warn(e)
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  PutUser() {
    this.securityService.UpdateUser(this.selectedUser).subscribe({
      next: (data: any) => {
        if (data.result.succeeded == true) {
          this.messagebox = false;
          Swal.fire({
            icon: 'success',
            position: 'center',
            text: 'User Successfully Updated',
            background: "#FFFFFF",
            confirmButtonColor: "#000000"
          })
          if (this.selectedClient.id > 0) {
            this.selectedClient.userId = data.userId
            this.UpdateClient()
          }
        }
        else {
          this.messagebox = true;
          this.message = data.result.errors
          console.warn(data)
        }
      }, error: (err) => {
        if (err.status == 0) {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
            footer: 'Please check your Internet Connection'
          })
        }
        else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
          })
        }
      }
    })
  }
  Back() {
    this.location.back()
  }
}
