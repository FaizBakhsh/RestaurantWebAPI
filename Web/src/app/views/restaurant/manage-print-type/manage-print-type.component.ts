import { ItemsService } from './../../items/items.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import Swal from 'sweetalert2';
import { KOTSettingVM } from '../Models/KOTSettingVM';
import { EnumValueVM } from '../Models/Enums/EnumValueVM';
import { RestaurantService } from '../restaurant.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { PrintTypeVM } from '../Models/PrintTypeVM';
import { CatalogService } from '../../catalog/catalog.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-print-type',
  templateUrl: './manage-print-type.component.html',
  styleUrls: ['./manage-print-type.component.css']
})
export class ManagePrintTypeComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Printers?: SettingsVM[];
  Types?: SettingsVM[];
  selectedPrintType: PrintTypeVM
  PrintType: PrintTypeVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Printer', 'Type', 'Terminal', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    public itmSvc: ItemsService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedPrintType = new PrintTypeVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedPrintType = new PrintTypeVM
    this.GetPrintType();
    this.GetSettings(EnumTypeVM.Printers)
    this.GetSettings(EnumTypeVM.ReportCategories)
    this.selectedPrintType.isActive = true;
  }
  GetSettings(etype: EnumTypeVM) {
    var setting = new SettingsVM()
    setting.enumTypeId = etype
    setting.isActive = true
    this.itmSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype == EnumTypeVM.Printers)
          this.Printers = res;
        if (etype == EnumTypeVM.ReportCategories)
          this.Types = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetPrintType() {
    var type = new PrintTypeVM
    type.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchPrintType(type).subscribe({
      next: (res: PrintTypeVM[]) => {
        this.PrintType = res;
        this.dataSource = new MatTableDataSource(this.PrintType);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeletePrintType(id: number) {
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
        this.resSvc.DeletePrintType(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'PrintType has been deleted.',
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
  GetPrintTypeForEdit(id: number) {
    this.selectedPrintType = new PrintTypeVM;
    this.selectedPrintType.id = id
    this.selectedPrintType.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchPrintType(this.selectedPrintType).subscribe({
      next: (res: PrintTypeVM[]) => {
        this.PrintType = res;
        console.warn(this.PrintType);
        this.selectedPrintType = this.PrintType[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SavePrintType() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.selectedPrintType.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SavePrintType(this.selectedPrintType).subscribe({
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
  UpdatePrintType() {
    this.proccessing = true
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedPrintType.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.UpdatePrintType(this.selectedPrintType).subscribe({
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
    this.selectedPrintType = new PrintTypeVM;
    this.Add = true;
    this.Edit = false;
    this.selectedPrintType.isActive = true;
  }
}

