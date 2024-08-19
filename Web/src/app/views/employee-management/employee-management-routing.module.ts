import { EmployeeAttendanceComponent } from './employee-attendance/employee-attendance.component';
import { ManageEmployeeSalaryComponent } from './manage-employee-salary/manage-employee-salary.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ManageStaffComponent } from './manage-staff/manage-staff.component';
import { EmployeeSaleComponent } from './employee-sale/employee-sale.component';
import { EmployeeListComponent } from './Employee/employee-list/employee-list.component';
import { ManageEmployeeComponent } from './Employee/manage-employee/manage-employee.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
import { RouteIds } from '../catalog/Models/Enums/RouteIds';
const routes: Routes = [
  {
    path: 'empList',
    component: EmployeeListComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.Employee, ''] },
    pathMatch: "full",
  },
  {
    path: 'manageEmployee',
    component: ManageEmployeeComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.Employee, ''] },
    pathMatch: "full",
  },
  {
    path: 'manageEmpSal',
    component: ManageEmployeeSalaryComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.EmployeeSalary, ''] },
    pathMatch: "full"
  },
  {
    path: 'attendance',
    component: EmployeeAttendanceComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.Attendance, ''] },
    pathMatch: "full"
  },
  {
    path: 'Staff',
    component: ManageStaffComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.Staff, ''] },
    pathMatch: "full"
  },
  {
    path: 'EmployeeSale',
    component: EmployeeSaleComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.EmployeeSale, ''] },
    pathMatch: "full"
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeManagementRoutingModule { }
