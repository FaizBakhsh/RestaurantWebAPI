import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';

import { ClassToggleService, HeaderComponent } from '@coreui/angular';
import { FiscalyearsComponent } from 'src/app/views/account/fiscalyears/fiscalyears.component';
import { ClientsVM } from 'src/app/views/catalog/Models/ClientsVM';
import { Roles } from 'src/app/views/catalog/Models/Enums/Roles';
import { StorageData } from 'src/app/views/catalog/Models/StorageData';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { CreateUserDialogComponent } from 'src/app/views/security/manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';

@Component({
  selector: 'app-default-header',
  templateUrl: './default-header.component.html',
})
export class DefaultHeaderComponent extends HeaderComponent implements OnInit {
  userName: string = ""
  Client: string = ""
  roleName: string = ""
  clients: ClientsVM[]
  superAdminId: string = ""
  dialogRef: any
  @Input() sidebarId: string = "sidebar";

  public newMessages = new Array(4)
  public newTasks = new Array(5)
  public newNotifications = new Array(5)

  constructor(private classToggler: ClassToggleService,
    private catSvc: CatalogService,
    private dialog: MatDialog,
    private cdr: ChangeDetectorRef,) {
    super();
  }
  LogOut() {
    localStorage.clear()
    this.catSvc.triggerRefresh()
  }
  ngOnInit(): void {
    debugger
    this.userName = localStorage.getItem("RMSUserName")
    this.Client = localStorage.getItem("RMSClient")
    this.roleName = localStorage.getItem("RMSRole")
    var id = localStorage.getItem("RMSSuperAdminId")
    if (id != undefined)
      this.superAdminId = id
    this.catSvc.refresh$.subscribe(() => {
      // Implement your logic to refresh the content here
      this.userName = localStorage.getItem("RMSUserName")
      this.Client = localStorage.getItem("RMSClient")
      this.roleName = localStorage.getItem("RMSRole")
      this.getClients()
    });
    this.getClients()
  }
  getClients() {
    var clt = new ClientsVM
    clt.isActive = true
    this.catSvc.SearchClients(clt).subscribe({
      next: (res: ClientsVM[]) => {
        this.clients = res
      }, error: () => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
      }
    })
  }
  openCltData(clt: ClientsVM) {
    debugger
    var _data = new StorageData()
    _data.role = "Client Admin"
    _data.id = clt.userId
    _data.roleId = Roles.ClientAdmin
    _data.token = localStorage.getItem("RMSToken")
    _data.moduleIds = clt.moduleIds
    _data.cLTModuleIds = clt.moduleIds
    _data.clientId = clt.id
    _data.cLTId = clt.id
    _data.client = clt.clientName
    _data.email = clt.email
    _data.superAdminId = localStorage.getItem("RMSSuperAdminId")
    _data.superAdminName = localStorage.getItem("RMSSuperAdminName")
    this.catSvc.SetProject(_data)
    this.catSvc.triggerRefresh()
  }
  reset() {
    debugger
    var _data = new StorageData()
    _data.role = "Super Admin"
    _data.roleId = Roles.SuperAdmin
    _data.id = localStorage.getItem("RMSSuperAdminId")
    _data.token = localStorage.getItem("RMSToken")
    _data.moduleIds = ""
    _data.clientId = 0
    _data.client = ""
    _data.email = localStorage.getItem("RMSSuperAdminName")
    this.catSvc.SetProject(_data)
    this.catSvc.triggerRefresh()
  }
  refresh() {
    this.cdr.detectChanges();
  }
  Refresh() {
    this.catSvc.triggerRefresh()
  }
  OpenUserDialog() {
    this.dialogRef = this.dialog.open(CreateUserDialogComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1000px', height: '450px'
      , data: { id: localStorage.getItem("RMSUserId"), isDialog: true, }
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        this.Refresh()
      });
  }
  OpenFiscalYearDialog() {
    var dialogRef = this.dialog.open(FiscalyearsComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '55%', height: '70%'
      , data: {}
    });
    dialogRef.afterClosed()
      .subscribe((res) => {

      });
  }
}
