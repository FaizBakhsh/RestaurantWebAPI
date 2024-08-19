import { Component, OnInit } from '@angular/core';
import { MatRadioChange } from '@angular/material/radio';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from '../../catalog/catalog.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { PermissionVM } from '../models/permission-vm';
import { UserVM } from '../models/user-vm';
import { SecurityService } from '../security.service';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';

@Component({
  selector: 'app-manage-permissions',
  templateUrl: './manage-permissions.component.html',
  styleUrls: ['./manage-permissions.component.css']
})
export class ManagePermissionsComponent implements OnInit {
  isReadOnly: boolean = false
  users: UserVM[]
  roles: SettingsVM[]
  selectedpermission: PermissionVM
  permsTypes: SettingsVM[]
  routes: SettingsVM[]
  dataSource: any
  permissions: PermissionVM[] = []
  displayedColumns: string[] = []
  coulumns: string[] = []
  constructor(
    private catSvc: CatalogService,
    private secSvc: SecurityService
  ) {
    this.selectedpermission = new PermissionVM
  }
  ngOnInit() {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Permissions)
    this.selectedpermission = new PermissionVM
    this.GetRoles()
    this.GetPermTypes()
    this.GetUsers()
    this.GetPermissions(new PermissionVM)
  }
  GetPermissions(perm: PermissionVM) {
    this.secSvc.SearchPerms(perm).subscribe({
      next: (res: PermissionVM[]) => {
        debugger
        this.permissions = res
        this.dataSource = new MatTableDataSource(this.permissions)
        if (this.permsTypes)
          this.displayedColumns = ['route', 'notSet', ...this.permsTypes.map(type => type.name)]
      }, error: () => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
      }
    })
  }
  radioChange(event: MatRadioChange, data) {
    debugger
    var obj = this.dataSource.filter(x => x.routeId == data)[0]
    obj.permissionId = event.value;
    this.dataSource.some(x => x.routeId == data)
    if (!this.dataSource.some(x => x.id == data)) {
      this.dataSource.push(obj);
    }
  }
  GetUsers() {
    var user = new UserVM
    this.secSvc.SearchUser(user).subscribe({
      next: (res: UserVM[]) => {
        this.users = res
      }, error: () => {
        this.catSvc.ErrorMsgBar("Error Occurred while getting Users", 4000)
      }
    })
  }
  GetRoles() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.Roles
    stng.clientId = 0
    this.catSvc.SearchEnumLine(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.roles = res
      }, error: () => {
        this.catSvc.ErrorMsgBar("Error Occurred while getting Roles", 4000)
      }
    })
  }
  GetPermTypes() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.PermissionTypes
    stng.clientId = 0
    stng.isActive = true
    this.catSvc.SearchEnumLine(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.permsTypes = res
        this.GetPermissions(new PermissionVM);
      }, error: () => {
        this.catSvc.ErrorMsgBar("Error Occurred while getting Roles", 4000)
      }
    })
  }
  SearchPermsByRole() {
    var perm = new PermissionVM
    perm.roleId = this.selectedpermission.roleId
    this.GetPermissions(perm)
  }
  SearchPermsByUser() {
    var perm = new PermissionVM
    perm.userId = this.selectedpermission.userId
    this.GetPermissions(perm)
  }
  Submit() {
    debugger
    if (this.selectedpermission.userId == '' && this.selectedpermission.roleId == 0)
      this.catSvc.ErrorMsgBar("Please Select User or Role", 4000)
    else {
      if (this.selectedpermission.roleId > 0)
        this.permissions = this.dataSource.data.map((item) => ({ ...item, roleId: this.selectedpermission.roleId }))
      if (this.selectedpermission.userId != "default")
        this.permissions = this.dataSource.data.map((item) => ({ ...item, userId: this.selectedpermission.userId }))
      this.secSvc.SavePermissions(this.permissions).subscribe({
        next: () => {
          this.catSvc.SuccessMsgBar("Successfully Saved", 4000)
          if (this.selectedpermission.roleId > 0)
            this.SearchPermsByRole()
          else if (this.selectedpermission.userId != "default")
            this.SearchPermsByUser()
        }, error: () => {
          this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        }
      })
    }
  }
}
