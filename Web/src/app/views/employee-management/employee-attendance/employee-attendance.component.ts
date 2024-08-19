import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { EmployeeVM } from '../Models/EmployeeVM';
import { RestaurantService } from './../../restaurant/restaurant.service';
import { EmployeeManagementService } from './../employee-management.service';
import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { EmployeeAttendanceVM } from '../Models/EmployeeAttendanceVM';
import { Platform } from '@angular/cdk/platform';

import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatDatepicker } from '@angular/material/datepicker';
import * as _moment from 'moment';
// tslint:disable-next-line:no-duplicate-imports
import { Moment } from 'moment';
import { MAT_MOMENT_DATE_ADAPTER_OPTIONS, MomentDateAdapter } from '@angular/material-moment-adapter';
import * as moment from 'moment';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
export const MY_FORMATS = {
  parse: {
    dateInput: 'LL',
  },
  display: {
    dateInput: 'MMMM YYYY', // this is the format showing on the input element
    monthYearLabel: 'MMMM YYYY', // this is showing on the calendar 
  },
};

/** @title Datepicker emulating a Year and month picker */

@Component({
  selector: 'app-employee-attendance',
  templateUrl: './employee-attendance.component.html',
  styleUrls: ['./employee-attendance.component.css'], changeDetection: ChangeDetectionStrategy.OnPush,
  providers: [
    {
      provide: DateAdapter,
      useClass: MomentDateAdapter,
      deps: [MAT_DATE_LOCALE, MAT_MOMENT_DATE_ADAPTER_OPTIONS]
    },

    { provide: MAT_DATE_FORMATS, useValue: MY_FORMATS },
  ],
})
export class EmployeeAttendanceComponent implements OnInit {
  isReadOnly: boolean = false
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Employees?: EmployeeVM[]
  employeeAttendance: EmployeeAttendanceVM
  EmployeeAttendance: EmployeeAttendanceVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'days', 'month', 'actions'];
  dataSource: any;
  constructor(
    private cdref: ChangeDetectorRef,
    public empSvc: EmployeeManagementService,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.employeeAttendance = new EmployeeAttendanceVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Attendance)
    this.Add = true;
    this.Edit = false;
    this.employeeAttendance = new EmployeeAttendanceVM
    this.GetEmployeeAttendance();
    this.GetEmployee();
  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
  }
  Check() {
    this.validFields = true;
  }
  setMonthAndYear(normalizedMonthAndYear: any, datepicker: MatDatepicker<Moment>) {
    this.employeeAttendance.month = normalizedMonthAndYear
    datepicker.close();
  }
  GetEmployeeAttendance() {
    var atnd = new EmployeeAttendanceVM
    atnd.clientId = +localStorage.getItem("RMSClientId")
    this.empSvc.SearchEmployeeAttendance(atnd).subscribe({
      next: (res: EmployeeAttendanceVM[]) => {
        this.EmployeeAttendance = res;
        this.dataSource = new MatTableDataSource(this.EmployeeAttendance);
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
  DeleteEmployeeAttendance(id: number) {
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
        this.empSvc.DeleteEmployeeAttendance(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'EmployeeAttendance has been deleted.',
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
  GetEmployeeAttendanceForEdit(id: number) {
    window.scrollTo(0, 0)
    this.employeeAttendance = new EmployeeAttendanceVM;
    this.employeeAttendance.id = id
    this.employeeAttendance.clientId = +localStorage.getItem("RMSClientId")
    this.empSvc.SearchEmployeeAttendance(this.employeeAttendance).subscribe({
      next: (res: EmployeeAttendanceVM[]) => {
        this.EmployeeAttendance = res;
        console.warn(this.EmployeeAttendance);
        this.employeeAttendance = this.EmployeeAttendance[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveEmployeeAttendance() {
    this.SetMonth()
    this.proccessing = true
    if (this.employeeAttendance.employeeId == 0 || this.employeeAttendance.employeeId == undefined)
      this.userForm.controls['employeeId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.employeeAttendance.clientId = +localStorage.getItem("RMSClientId")
      if (this.Edit)
        this.UpdateEmployeeAttendance()
      else {
        this.empSvc.SaveEmployeeAttendance(this.employeeAttendance).subscribe({
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
    this.proccessing = false
  }
  UpdateEmployeeAttendance() {
    this.empSvc.UpdateEmployeeAttendance(this.employeeAttendance).subscribe({
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
    this.proccessing = false
  }
  SetMonth() {
    if (this.employeeAttendance.month != null) {
      this.employeeAttendance.month = moment(this.employeeAttendance.month).toDate()
      this.employeeAttendance.month = new Date(Date.UTC(this.employeeAttendance.month.getFullYear(), this.employeeAttendance.month.getMonth()))
    }
  }
}


