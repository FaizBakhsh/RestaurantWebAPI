import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { ItemsService } from './../../items/items.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import Swal from 'sweetalert2';
import { RestaurantService } from '../restaurant.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { PrinterSettingVM } from '../Models/PrinterSettingVM';
import { ManageEnumLineComponent } from '../../catalog/manage-enum-line/manage-enum-line.component';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-printer-setting',
  templateUrl: './manage-printer-setting.component.html',
  styleUrls: ['./manage-printer-setting.component.css']
})
export class ManagePrinterSettingComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Printers?: SettingsVM[];
  categories?: SettingsVM[];
  subCategories?: SettingsVM[];
  selectedPrinterSetting: PrinterSettingVM
  PrinterSetting: PrinterSettingVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Printer', 'Type', 'subCategory', 'noofPrints', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    public itmSvc: ItemsService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedPrinterSetting = new PrinterSettingVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.PrinterSetting)
    this.Add = true;
    this.Edit = false;
    this.selectedPrinterSetting = new PrinterSettingVM
    this.GetPrinterSetting();
    this.GetSettings(EnumTypeVM.Printers, +localStorage.getItem("RMSClientId"))
    this.GetSettings(EnumTypeVM.ReportCategories, 0)
    this.GetSettings(EnumTypeVM.ReportsSubCategories, 0)
    this.selectedPrinterSetting.isActive = true;
  }
  GetSettings(etype: EnumTypeVM, clientId) {
    var setting = new SettingsVM()
    setting.enumTypeId = etype
    setting.isActive = true
    if (clientId > 0)
      setting.clientId = +localStorage.getItem("RMSClientId")
    this.itmSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype == EnumTypeVM.Printers)
          this.Printers = res;
        if (etype == EnumTypeVM.ReportCategories)
          this.categories = res;
        if (etype == EnumTypeVM.ReportsSubCategories)
          this.subCategories = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetPrinterSetting() {
    var stng = new PrinterSettingVM
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchPrinterSetting(stng).subscribe({
      next: (res: PrinterSettingVM[]) => {
        this.PrinterSetting = res;
        this.dataSource = new MatTableDataSource(this.PrinterSetting);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeletePrinterSetting(id: number) {
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
        this.resSvc.DeletePrinterSetting(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'PrinterSetting has been deleted.',
              'success'
            )
            this.GetPrinterSetting();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  SearchSubCat(id) {
    var setting = new SettingsVM()
    setting.enumTypeId = EnumTypeVM.ReportsSubCategories
    setting.parentId = id
    setting.isActive = true
    this.itmSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        this.subCategories = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  OpenPrinterDialog() {
    let dialogRef = this.dialog.open(ManageEnumLineComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '750px', height: '500px'
      , data: {
        enumTypeId: EnumTypeVM.Printers, isDialog: true,
        clientId: +localStorage.getItem("RMSClientId"),
      }
    });
    dialogRef.afterClosed().subscribe({
      next: (res) => {
        this.GetSettings(EnumTypeVM.Printers, +localStorage.getItem("RMSClientId"))
      }
    })
  }
  GetPrinterSettingForEdit(id: number) {
    this.selectedPrinterSetting = new PrinterSettingVM;
    this.selectedPrinterSetting.id = id
    this.selectedPrinterSetting.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchPrinterSetting(this.selectedPrinterSetting).subscribe({
      next: (res: PrinterSettingVM[]) => {
        this.PrinterSetting = res;
        console.warn(this.PrinterSetting);
        this.selectedPrinterSetting = this.PrinterSetting[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SavePrinterSetting() {
    this.proccessing = true
    if (this.selectedPrinterSetting.categoryId == 0 || this.selectedPrinterSetting.categoryId == null)
      this.userForm.controls["categoryId"].setErrors({ "incorrect": true })
    if (this.selectedPrinterSetting.categoryId > 0) {
      if (this.selectedPrinterSetting.subCategoryId == 0 || this.selectedPrinterSetting.subCategoryId == null)
        this.userForm.controls["subCategoryId"].setErrors({ "incorrect": true })
    }
    if (this.selectedPrinterSetting.printerId == 0 || this.selectedPrinterSetting.printerId == null)
      this.userForm.controls["printerId"].setErrors({ "incorrect": true })
    if (!this.userForm.invalid) {
      this.selectedPrinterSetting.clientId = +localStorage.getItem("RMSClientId")
      if (this.Edit)
        this.UpdatePrinterSetting()
      else
        this.resSvc.SavePrinterSetting(this.selectedPrinterSetting).subscribe({
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
  UpdatePrinterSetting() {
    this.proccessing = true
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.UpdatePrinterSetting(this.selectedPrinterSetting).subscribe({
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
    this.selectedPrinterSetting = new PrinterSettingVM;
    this.Add = true;
    this.Edit = false;
    this.selectedPrinterSetting.isActive = true
  }
}


