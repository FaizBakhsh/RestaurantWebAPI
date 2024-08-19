import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EmployeeVM } from '../../Models/EmployeeVM';
import { MatSnackBar } from '@angular/material/snack-bar';
import * as moment from 'moment';
import { Location } from '@angular/common';
import { EmployeeManagementService } from '../../employee-management.service';
import { BranchVM } from 'src/app/views/restaurant/Models/BranchVM';
import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';
@Component({
  selector: 'app-manage-employee',
  templateUrl: './manage-employee.component.html',
  styleUrls: ['./manage-employee.component.css']
})
export class ManageEmployeeComponent implements OnInit {
  isReadOnly: boolean = false
  empId!: number;
  branch!: BranchVM[];
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  Employee!: EmployeeVM[];
  getEmpById!: EmployeeVM[];
  selectedEmployee: EmployeeVM
  constructor(
    private location: Location,
    private route: ActivatedRoute,
    public empMngSV: EmployeeManagementService,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedEmployee = new EmployeeVM
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Employee)
    this.route.queryParams.subscribe(params => {
      this.empId = params['id'];
    });
    console.warn(this.empId)
    if (this.empId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetEmpolyeeById();
    }
    this.GetBranch();
    this.selectedEmployee.isActive = true
  }
  GetBranch() {
    var branch = new BranchVM
    branch.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.branch = res;
        console.warn(res);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveEmployee() {
    this.selectedEmployee.joiningDate = moment(this.selectedEmployee.joiningDate).toDate()
    this.selectedEmployee.joiningDate = new Date(Date.UTC(this.selectedEmployee.joiningDate.getFullYear(), this.selectedEmployee.joiningDate.getMonth(), this.selectedEmployee.joiningDate.getDate()))
    this.selectedEmployee.clientId = +localStorage.getItem("RMSClientId")
    if (this.empId > 0) {
      this.PutEmployee();
    } else {
      this.empMngSV.SaveEmployee(this.selectedEmployee).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyAddMsg()
          this.ngOnInit();
          this.Refresh();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        }
      })
    }
  }
  PutEmployee() {
    this.empMngSV.UpdateEmployee(this.selectedEmployee).subscribe({
      next: (res) => {
        this.catSvc.SuccessfullyUpdateMsg()
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetEmpolyeeById() {
    var emp = new EmployeeVM
    emp.id = this.empId
    emp.clientId = +localStorage.getItem("RMSClientId")
    this.empMngSV.SearchEmployee(emp).subscribe({
      next: (res: EmployeeVM[]) => {
        this.getEmpById = res;
        this.selectedEmployee = this.getEmpById[0]
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedEmployee = new EmployeeVM;
    this.Add = true;
    this.Edit = false;
    this.selectedEmployee.isActive = true
  }
  Back() {
    this.location.back()
  }
}
