import { Component, OnInit, ViewChild } from '@angular/core';
import { ServiceChargesVM } from '../Models/ServiceChargesVM';
import { NgForm } from '@angular/forms';
import { RestaurantService } from '../restaurant.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-service-charges',
  templateUrl: './manage-service-charges.component.html',
  styleUrls: ['./manage-service-charges.component.css']
})
export class ManageServiceChargesComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  ServiceCharges: ServiceChargesVM[] | undefined;
  selectedServiceCharges: ServiceChargesVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'percentage', 'orderType', 'paymentType', 'description', 'isActive', 'actions'];
  dataSource: any;
  orderTypes: SettingsVM[]
  paymentTypes: SettingsVM[]
  isReadOnly: boolean = false
  constructor(
    public resSVC: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedServiceCharges = new ServiceChargesVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.ServiceCharges)
    this.Add = true;
    this.Edit = false;
    this.selectedServiceCharges = new ServiceChargesVM
    this.GetServiceCharges();
    this.GetOrderTypes()
    this.GetPayementTypes()
    this.selectedServiceCharges.isActive = true;
  }
  GetServiceCharges() {
    var svc = new ServiceChargesVM
    svc.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchServiceCharges(svc).subscribe({
      next: (res: ServiceChargesVM[]) => {
        this.ServiceCharges = res;
        console.warn(this.ServiceCharges)
        this.dataSource = new MatTableDataSource(this.ServiceCharges);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetOrderTypes() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.SvcChrgsOrderTypes
    stng.isActive = true
    this.resSVC.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.orderTypes = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetPayementTypes() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.SvcChrgsPaymentTypes
    stng.isActive = true
    this.resSVC.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.paymentTypes = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteServiceCharges(id: number) {
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
        this.resSVC.DeleteServiceCharges(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'ServiceCharges has been deleted.',
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
  GetServiceChargesForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedServiceCharges = new ServiceChargesVM;
    this.selectedServiceCharges.id = id
    this.selectedServiceCharges.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchServiceCharges(this.selectedServiceCharges).subscribe({
      next: (res: ServiceChargesVM[]) => {
        this.ServiceCharges = res;
        this.selectedServiceCharges = this.ServiceCharges[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  ValidateFields() {
    if (this.selectedServiceCharges.paymentTypeId == 0 || this.selectedServiceCharges.paymentTypeId == undefined)
      this.userForm.controls['paymentTypeId'].setErrors({ 'incorrect': true })
    if (this.selectedServiceCharges.orderTypeId == 0 || this.selectedServiceCharges.orderTypeId == undefined)
      this.userForm.controls['orderTypeId'].setErrors({ 'incorrect': true })
  }
  SaveServiceCharges() {
    this.ValidateFields()
    if (!this.userForm.invalid) {
      var svcChrgs = new ServiceChargesVM()
      svcChrgs.clientId = +localStorage.getItem("RMSClientId")
      svcChrgs.paymentTypeId = this.selectedServiceCharges.paymentTypeId
      svcChrgs.orderTypeId = this.selectedServiceCharges.orderTypeId
      this.resSVC.SearchServiceCharges(svcChrgs).subscribe({
        next: (res: ServiceChargesVM[]) => {
          if (this.Edit)
            res = res.filter(x => x.id != this.selectedServiceCharges.id)
          if (res.length == 0) {
            this.selectedServiceCharges.clientId = +localStorage.getItem("RMSClientId")
            if (this.Edit)
              this.UpdateServiceCharges()
            else {
              this.resSVC.SaveServiceCharges(this.selectedServiceCharges).subscribe({
                next: (res) => {
                  this.catSvc.SuccessfullyAddMsg()
                  this.Add = true;
                  this.Edit = false;
                  this.ngOnInit();
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                  console.warn(e);
                }
              })
            }
          } else
            this.catSvc.ErrorMsgBar("Service Charges against this Payment & Order Type alreadey added", 5000)
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        }
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateServiceCharges() {
    if (!this.userForm.invalid) {
      this.resSVC.UpdateServiceCharges(this.selectedServiceCharges).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyUpdateMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  Refresh() {
    this.selectedServiceCharges = new ServiceChargesVM
    this.Add = true;
    this.Edit = false;
    this.selectedServiceCharges.isActive = true;
  }
}

