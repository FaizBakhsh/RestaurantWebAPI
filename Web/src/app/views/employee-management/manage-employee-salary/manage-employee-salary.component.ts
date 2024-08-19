import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { EmployeeVM } from '../Models/EmployeeVM';
import { RestaurantService } from './../../restaurant/restaurant.service';
import { EmployeeManagementService } from './../employee-management.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { EmployeeSalaryVM } from '../Models/EmployeeSalaryVM';
import * as moment from 'moment';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
@Component({
  selector: 'app-manage-employee-salary',
  templateUrl: './manage-employee-salary.component.html',
  styleUrls: ['./manage-employee-salary.component.css']
})
export class ManageEmployeeSalaryComponent implements OnInit {
  isReadOnly: boolean = false
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Employees?: EmployeeVM[]
  selectedEmpSalary: EmployeeSalaryVM
  EmployeeSalary: EmployeeSalaryVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'amount', 'date', 'actions'];
  dataSource: any;
  constructor(
    public empSvc: EmployeeManagementService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedEmpSalary = new EmployeeSalaryVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.EmployeeSalary)
    this.Add = true;
    this.Edit = false;
    this.selectedEmpSalary = new EmployeeSalaryVM
    this.GetEmployeeSalary();
    this.GetEmployee();
    this.selectedEmpSalary.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetEmployeeSalary() {
    var empSal = new EmployeeSalaryVM
    empSal.clientId = +localStorage.getItem("RMSClientId")
    this.empSvc.SearchEmployeeSalary(empSal).subscribe({
      next: (res: EmployeeSalaryVM[]) => {
        this.EmployeeSalary = res;
        this.dataSource = new MatTableDataSource(this.EmployeeSalary);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetEmployee() {
    var emp = new EmployeeVM
    emp.isActive = true
    emp.clientId = +localStorage.getItem("RMSClientId")
    this.empSvc.SearchEmployee(emp).subscribe({
      next: (res: EmployeeVM[]) => {
        this.Employees = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteEmployeeSalary(id: number) {
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
        this.empSvc.DeleteEmployeeSalary(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'EmployeeSalary has been deleted.',
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
  GetEmployeeSalaryForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedEmpSalary = new EmployeeSalaryVM;
    this.selectedEmpSalary.id = id
    this.selectedEmpSalary.clientId = +localStorage.getItem("RMSClientId")
    this.empSvc.SearchEmployeeSalary(this.selectedEmpSalary).subscribe({
      next: (res: EmployeeSalaryVM[]) => {
        this.EmployeeSalary = res;
        this.selectedEmpSalary = this.EmployeeSalary[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveEmployeeSalary() {
    this.SetDate()
    this.proccessing = true
    if (this.selectedEmpSalary.employeeId == 0 || this.selectedEmpSalary.employeeId == undefined)
      this.userForm.controls['employeeId'].setErrors({ "incorrect": true })
    if (!this.userForm.invalid) {
      this.selectedEmpSalary.clientId = +localStorage.getItem("RMSClientId")
      if (this.Edit)
        this.UpdateEmployeeSalary()
      else {
        this.empSvc.SaveEmployeeSalary(this.selectedEmpSalary).subscribe({
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
      }
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  UpdateEmployeeSalary() {
    this.empSvc.UpdateEmployeeSalary(this.selectedEmpSalary).subscribe({
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
  SetDate() {
    this.selectedEmpSalary.date = moment(this.selectedEmpSalary.date).toDate()
    this.selectedEmpSalary.date = new Date(Date.UTC(this.selectedEmpSalary.date.getFullYear(), this.selectedEmpSalary.date.getMonth(), this.selectedEmpSalary.date.getDate()))

  }
}

