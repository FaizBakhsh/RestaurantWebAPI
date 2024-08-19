import { CatalogService } from './../../../catalog/catalog.service';
import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { SupplierVM } from '../../Models/SupplierVM';
import { RestaurantService } from '../../restaurant.service';
import { Location } from '@angular/common';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-supplier',
  templateUrl: './manage-supplier.component.html',
  styleUrls: ['./manage-supplier.component.css']
})
export class ManageSupplierComponent implements OnInit {

  supId!: number;
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  Supplier!: SupplierVM[];
  supplier: SupplierVM = new SupplierVM
  getSupplierId!: SupplierVM[];
  accounts: SettingsVM[]
  isReadOnly: boolean = false
  constructor(
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private snack: MatSnackBar,
    private _location: Location,
    private catLogSvc: CatalogService,
  ) {
    // this.supplier = new SupplierVM
  }
  ngOnInit(): void {
    this.isReadOnly = this.catLogSvc.getPermission(RouteIds.Supplier)
    this.route.queryParams.subscribe(params => {
      this.supId = params['id'];
    });
    console.warn(this.supId)
    if (this.supId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetSupplierById();
    }
    this.GetAccounts()
    this.supplier.isActive = true;
  }
  GetAccounts() {
    var stng = new SettingsVM
    stng.levelId = EnumTypeVM.Level5
    stng.isActive = true
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.accounts = res;
      }, error: (e) => {
        this.catLogSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  SaveSupplier() {
    this.supplier.clientId = +localStorage.getItem("RMSClientId")
    if (this.supId > 0) {
      this.PutSupplier();
    } else {
      this.resSvc.SaveSupplier(this.supplier).subscribe({
        next: (res) => {
          this.catLogSvc.SuccessMsgBar("Successfully Added", 4000);
          this.ngOnInit();
          this.Refresh();
        }, error: (e) => {
          this.catLogSvc.ErrorMsgBar("Error Occurred", 5000);
        }
      })
    }
  }
  PutSupplier() {
    this.resSvc.UpdateSupplier(this.supplier).subscribe({
      next: (res) => {
        this.catLogSvc.SuccessMsgBar("Successfully Updated !", 4000);
      }, error: (e) => {
        this.catLogSvc.ErrorMsgBar("Error Occurred", 5000);
        //this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  GetSupplierById() {
    var supp = new SupplierVM
    supp.clientId = +localStorage.getItem("RMSClientId")
    supp.id = this.supId
    this.resSvc.SearchSupplier(supp).subscribe({
      next: (res: SupplierVM[]) => {
        this.getSupplierId = res;
        this.supplier = this.getSupplierId[0]
      }, error: (e) => {
        this.catLogSvc.ErrorMsgBar("Error Occurred", 5000);
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.supplier = new SupplierVM;
    this.Add = true;
    this.Edit = false;
    this.supplier.isActive = true;
  }
  Back() {
    this._location.back();
  }
}

