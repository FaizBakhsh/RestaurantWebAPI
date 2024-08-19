import { CatalogService } from './../../../catalog/catalog.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { BranchVM } from '../../Models/BranchVM';
import { CustomerVM } from '../../Models/CustomerVM';
import { RestaurantService } from '../../restaurant.service';
import { Location } from '@angular/common';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';
import { NgForm } from '@angular/forms';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-customer',
  templateUrl: './manage-customer.component.html',
  styleUrls: ['./manage-customer.component.css']
})
export class ManageCustomerComponent implements OnInit {
  proccessing: boolean = false
  CustId!: number;
  branch!: BranchVM[];
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  Customer!: CustomerVM[];
  getcustById!: CustomerVM[];
  selectedCustomer: CustomerVM
  accounts: SettingsVM[]
  isReadOnly: boolean = false
  @ViewChild('userForm', { static: true }) userForm: NgForm;
  constructor(
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private snack: MatSnackBar,
    private location: Location,
    public catSvc: CatalogService,
  ) {
    this.selectedCustomer = new CustomerVM
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.CustomerInfo)
    this.route.queryParams.subscribe(params => {
      this.CustId = params['id'];
    });
    console.warn(this.CustId)
    if (this.CustId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetCustomerById();
    }
    this.GetAccounts()
    this.GetBranch();
    this.selectedCustomer.isActive = true;
  }
  GetBranch() {
    var branch = new BranchVM
    branch.isActive = true
    branch.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.branch = res;
        console.warn(res);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
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
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  CheckCustomer() {
    if (this.selectedCustomer.accId == 0 || this.selectedCustomer.accId == undefined)
      this.userForm.controls['accId'].setErrors({ 'incorrect': true })

  }
  SaveCustomer() {
    this.CheckCustomer()
    if (!this.userForm.invalid) {
      this.selectedCustomer.clientId = +localStorage.getItem("RMSClientId")
      this.proccessing = true
      if (this.CustId > 0) {
        this.PutCustomer();
      } else {
        this.resSvc.SaveCustomer(this.selectedCustomer).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar("Customer Added Successfully!", 6000)
            this.ngOnInit();
            this.Refresh();
            this.proccessing = false
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
            this.proccessing = false
          }
        })
      }
    }
    else
      this.catSvc.ErrorMsgBar("Please fill all required Fields !", 6000)
  }
  PutCustomer() {
    this.proccessing = true
    this.resSvc.UpdateCustomer(this.selectedCustomer).subscribe({
      next: (res) => {
        this.proccessing = false
        this.catSvc.SuccessMsgBar("Customer Updated Successfully!", 6000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        this.proccessing = false
      }
    })
  }
  GetCustomerById() {
    var cust = new CustomerVM
    cust.id = this.CustId
    cust.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchCustomer(cust).subscribe({
      next: (res: CustomerVM[]) => {
        this.getcustById = res;
        this.selectedCustomer = this.getcustById[0]
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedCustomer = new CustomerVM;
    this.Add = true;
    this.Edit = false;
    this.selectedCustomer.isActive = true;
  }
  Back() {
    this.location.back()
  }
}

