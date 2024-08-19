import { Component, OnInit } from '@angular/core';
import { UserVM } from '../models/user-vm';
import { SecurityService } from '../security.service';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { CreateUserDialogComponent } from './manage-user-dialog/create-user-dialog/create-user-dialog.component';
import Swal from 'sweetalert2';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Router } from '@angular/router';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
import { CatalogService } from '../../catalog/catalog.service';

@Component({
  selector: 'app-manage-user',
  templateUrl: './manage-user.component.html',
  styleUrls: ['./manage-user.component.css']
})
export class ManageUserComponent implements OnInit {
  dataSource: any;
  dialogRef: any
  displayedColumns = ['firstName', 'role', 'userName', 'phoneNumber', 'email', 'fatherName', 'address', 'cnic', 'msCardNo', 'discountLimit',
    'action'];
  users?: UserVM[];
  isReadOnly: boolean = false
  constructor(
    private securitySvc: SecurityService,
    private snack: MatSnackBar,
    private catSvc: CatalogService,
    private route: ActivatedRoute,
    public dialog: MatDialog) {
    this.securitySvc.selectedUser = new UserVM
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Users)
    var user = new UserVM
    user.clientId = +localStorage.getItem("RMSClientId")
    this.securitySvc.SearchUser(user).subscribe({
      next: (res) => {
        console.warn(res)
        this.users = res;
        this.dataSource = new MatTableDataSource(this.users);
      }, error: (error) => {
        console.warn(error)
      }
    })

  }
  EditUser(user: any) {
    this.dialogRef = this.dialog.open(CreateUserDialogComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1200px', height: '590px'
      , data: { id: user.id }
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        this.ngOnInit();
      });
    // this.route.navigate(['/security/security/userRegistration'], {
    //   queryParams: {
    //     id: user.id
    //   }
    // });
  }
  CreateUserDialog() {
    this.dialogRef = this.dialog.open(CreateUserDialogComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1200px', height: '590px'

    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        this.ngOnInit();
      });
  }
  DeleteUser(user: any) {
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
        user.isActive = false
        this.securitySvc.UpdateUser(user).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'User has been deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.snack.open('Error Occured!', 'OK', { duration: 4000 })
          }
        })
      } else
        this.ngOnInit()
    })
  }
}
