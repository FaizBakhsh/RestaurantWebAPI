import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { EmployeeVM } from '../../Models/EmployeeVM';
import { ManageEmployeeComponent } from '../manage-employee/manage-employee.component';
import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import { EmployeeManagementService } from '../../employee-management.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css']
})
export class EmployeeListComponent implements OnInit {
  getEmpById!: EmployeeVM;
  Employee: EmployeeVM[] | undefined;;
  Edit: boolean = true;
  displayedColumns: string[] = ['Name', 'Branch', 'Phone', 'Designation', 'Gender', 'JoiningDate', 'isActive', 'Action'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private route: Router,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
    public empSvc: EmployeeManagementService
  ) {
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Employee)
    this.GetEmployee();
  }
  GetEmployee() {
    var emp = new EmployeeVM
    emp.clientId = +localStorage.getItem("RMSClientId")
    this.empSvc.SearchEmployee(emp).subscribe({
      next: (res: EmployeeVM[]) => {
        this.Employee = res;
        console.warn(this.Employee)
        this.dataSource = new MatTableDataSource(this.Employee);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  EditEmployee(cust: EmployeeVM) {
    this.route.navigate(['/restaurant/empManagement/manageEmployee'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteEmployee(id: number) {
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
        this.empSvc.DeleteEmployee(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Employee has been deleted.',
              'success'
            )
            this.GetEmployee();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
}
