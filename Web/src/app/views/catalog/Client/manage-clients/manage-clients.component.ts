import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA, MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ManageEnumLineComponent } from '../../manage-enum-line/manage-enum-line.component';
import { CatalogService } from '../../catalog.service';
import { ClientsVM } from '../../Models/ClientsVM';
import { ManageEnumLineWithParentComponent } from '../../manage-enum-line-with-parent/manage-enum-line-with-parent.component';
import { SettingsVM } from '../../Models/SettingsVM';
import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';

@Component({
  selector: 'app-manage-clients',
  templateUrl: './manage-clients.component.html',
  styleUrls: ['./manage-clients.component.css']
})
export class ManageClientsComponent implements OnInit {
  searchedType?: EnumTypeVM[];
  hide = true;
  lecs?: SettingsVM[]
  CatSvc: CatalogService
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  cities: SettingsVM[]
  countries: SettingsVM[]
  categories: SettingsVM[]
  Clients: ClientsVM[] | undefined;
  selectedClients: ClientsVM
  dataSource: any;
  previewImage = false;
  currentLightBoxImage: any
  // selectedEnumType = new EnumTypeVM()
  @ViewChild('clientsForm', { static: true }) clientsForm!: NgForm;
  dialogRef: any
  dialogData;
  constructor(
    private dialog: MatDialog,
    private injector: Injector,
    private catSvc: CatalogService,

  ) {
    this.dialogRef = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedClients = new ClientsVM();
    // this.selectedEnumType = new EnumTypeVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedClients = new ClientsVM
    // this.selectedEnumType = new EnumTypeVM
    this.GetSettings(EnumTypeVM.City)
    this.GetSettings(EnumTypeVM.Country)
    this.GetSettings(EnumTypeVM.ClientCategories)
    this.selectedClients.isActive = true;
    if (this.dialogData != null) {
      if (this.dialogData.cltId != undefined) {
        this.GetClientsForEdit(this.dialogData.cltId)
      }
    }
  }
  OpenCountryDialog() {
    let dialogRef = this.dialog.open(ManageEnumLineComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '750px', height: '500px'
      , data: { enumTypeId: EnumTypeVM.Country, isDialog: true }
    });
    dialogRef.afterClosed().subscribe({
      next: (res) => {
        this.GetCountry()
      }
    })
  }
  OpenCityDialog() {
    let dialogRef = this.dialog.open(ManageEnumLineWithParentComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '950px', height: '500px'
      , data: { enumTypeId: EnumTypeVM.City, isDialog: true, parentType: EnumTypeVM.Country, parentId: this.selectedClients.countryId }
    });
    dialogRef.afterClosed().subscribe({
      next: (res) => {
        this.GetCity()
      }
    })
  }
  GetCountry() {
    var stng = new SettingsVM
    stng.moduleId = 0
    stng.clientId = 0
    stng.enumTypeId = EnumTypeVM.Country
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.countries = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetCity() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.City
    stng.moduleId = 0
    stng.clientId = 0
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.cities = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SearchCities() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.City
    stng.moduleId = 0
    stng.clientId = 0
    stng.parentId = this.selectedClients.countryId
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.cities = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetSettings(etype: EnumTypeVM) {
    var setting = new SettingsVM()
    setting.enumTypeId = etype
    setting.isActive = true
    this.catSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype == EnumTypeVM.City)
          this.cities = res;
        else if (etype == EnumTypeVM.ClientCategories)
          this.categories = res;
        else if (etype == EnumTypeVM.Country)
          this.countries = res;
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteClients(id: number) {
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
        this.catSvc.DeleteClients(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Clients has been deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetClientsForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedClients = new ClientsVM;
    this.selectedClients.id = id
    this.catSvc.SearchClients(this.selectedClients).subscribe({
      next: (res: ClientsVM[]) => {
        this.Clients = res;
        this.selectedClients = this.Clients[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveClients() {
    // this.catSvc.GetClients().subscribe({
    //   next: (res: ClientsVM[]) => {
    //     var list = res
    //     if (this.Edit)
    //       list = list.filter(x => x.id != this.selectedClients.id)
    //     var find = list.find(x => x.clientName == this.selectedClients.clientName  )
    //     if (find == undefined) 
    //     {
    if (this.selectedClients.categoryId == 0 || this.selectedClients.categoryId == undefined)
      this.clientsForm.controls["categoryId"].setErrors({ "incorrect": true })
    if (!this.clientsForm.invalid) {
      if (this.Edit)
        this.UpdateClients()
      else {
        this.catSvc.SaveClients(this.selectedClients).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
            this.proccessing = false
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
            this.proccessing = false
          }
        })
      }
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
    //     } else
    //       this.catSvc.ErrorMsgBar("This Name Already Taken ", 5000)
    //   }, error: (e) => {
    //     this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    //     console.warn(e);
    //   }
    // })
  }
  OpenCatDialog() {
    let dialogRef = this.dialog.open(ManageEnumLineComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '750px', height: '500px'
      , data: { enumTypeId: EnumTypeVM.ClientCategories, isDialog: true, clientId: 0 }
    });
    dialogRef.afterClosed().subscribe({
      next: (res) => {
        this.GetSettings(EnumTypeVM.ClientCategories)
      }
    })
  }
  UpdateClients() {
    this.catSvc.UpdateClients(this.selectedClients).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
        this.proccessing = false
        this.ngOnInit();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.proccessing = false
      }
    })
    this.proccessing = false
  }
  Refresh() {
    this.ngOnInit()
  }
  handleFileInput(e: any) {
    debugger
    for (let index = 0; index < e.target.files.length; index++) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[index]);
      reader.onload = (event: any) => {
        this.selectedClients.logoBase64Path = event.target.result
      };
    }
  }
  onPreviewImage(): void {
    this.previewImage = true
    this.currentLightBoxImage = this.selectedClients.logoBase64Path
  }
  onClosePreview() {
    this.previewImage = false;
  }
}















