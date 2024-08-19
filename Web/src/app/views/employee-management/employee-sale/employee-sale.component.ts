import { Component, OnInit, ViewChild } from '@angular/core';
import { EmployeeManagementService } from '../employee-management.service';
import { CatalogService } from '../../catalog/catalog.service';
import { EmployeeSaleVM } from '../Models/EmployeeSaleVM';
import { MatTableDataSource } from '@angular/material/table';
import { RestaurantService } from '../../restaurant/restaurant.service';
import { EmployeeVM } from '../Models/EmployeeVM';
import { __values } from 'tslib';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import * as moment from 'moment';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-employee-sale',
  templateUrl: './employee-sale.component.html',
  styleUrls: ['./employee-sale.component.css']
})
export class EmployeeSaleComponent implements OnInit {
  isReadOnly: boolean = false
  proccessing?: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  dataSource?: any;
  selectedEmpSale!: EmployeeSaleVM;
  displayedColumns: string[] = ['employee', 'amount', 'date', 'actions'];
  EmployeeSale?: EmployeeSaleVM[];
  Employees?: EmployeeVM[];
  @ViewChild('userForm') userForm: NgForm
  constructor(
    private empMngSV: EmployeeManagementService,
    private catSVC: CatalogService,) {
    this.selectedEmpSale = new EmployeeSaleVM
  }
  ngOnInit() {
    this.isReadOnly = this.catSVC.getPermission(RouteIds.EmployeeSale)
    this.GetEmployeeSale()
    this.GetEmployee()
    this.selectedEmpSale = new EmployeeSaleVM
    this.Add = true;
    this.Edit = false;
    this.selectedEmpSale.isActive = true

  }
  GetEmployeeSale() {
    var sale = new EmployeeSaleVM
    sale.clientId = +localStorage.getItem("RMSClientId")
    this.empMngSV.SearchEmployeeSale(sale).subscribe({
      next: (value: EmployeeSaleVM[]) => {
        console.warn(value)
        this.EmployeeSale = value
        this.dataSource = new MatTableDataSource(this.EmployeeSale)
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occured", 5000)
      },
    })
  }
  GetEmployee() {
    var emp = new EmployeeVM
    emp.isActive = true
    emp.clientId = +localStorage.getItem("RMSClientId")
    this.empMngSV.SearchEmployee(emp).subscribe({
      next: (value: EmployeeVM[]) => {
        this.Employees = value
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("error occured", 5000)
      },
    })
  }
  SaveEmployeeSale() {
    if (this.selectedEmpSale.date != null) {
      this.selectedEmpSale.date = moment(this.selectedEmpSale.date).toDate()
      this.selectedEmpSale.date = new Date(Date.UTC(this.selectedEmpSale.date.getFullYear(), this.selectedEmpSale.date.getMonth(), this.selectedEmpSale.date.getDate()))
    }
    if (this.selectedEmpSale.employeeId == 0 || this.selectedEmpSale.employeeId == undefined)
      this.userForm.controls['employeeId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedEmpSale.clientId = +localStorage.getItem("RMSClientId")
      this.proccessing = true
      if (this.Edit)
        this.UpdateEmployeeSale()
      else {
        this.empMngSV.SaveEmployeeSale(this.selectedEmpSale).subscribe({
          next: (value) => {
            this.proccessing = false
            this.catSVC.SuccessMsgBar("Successfully Added", 5000);
            this.ngOnInit()
          }, error: (err) => {
            this.proccessing = false
            this.catSVC.ErrorMsgBar("Error Occured", 5000)
          },
        })
      }
    } else
      this.catSVC.ErrorMsgBar("Please fill all required Fields", 5000)
  }
  EditEmpSale(value: EmployeeSaleVM) {
    window.scrollTo(0, 0)
    this.Add = false;
    this.Edit = true;
    this.selectedEmpSale = value
  }
  DeleteEmpSale(value: EmployeeSaleVM) {
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
        this.empMngSV.DeleteEmployeeSale(value.id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully deleted.',
              'success'
            )
            this.GetEmployeeSale();
          }, error: (e) => {
            this.catSVC.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  UpdateEmployeeSale() {
    debugger
    this.proccessing = true
    this.empMngSV.UpdateEmployeeSale(this.selectedEmpSale).subscribe({
      next: (value) => {
        this.proccessing = false
        this.ngOnInit()

        this.catSVC.SuccessMsgBar("Successfully Updated", 5000)
        this.proccessing = false
        this.GetEmployeeSale()

      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
}