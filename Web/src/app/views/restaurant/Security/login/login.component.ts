import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { LoginVM } from '../../Models/LoginVM';
import { RestaurantService } from '../../restaurant.service';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { SecurityService } from 'src/app/views/security/security.service';
import { FiscalyearsComponent } from 'src/app/views/account/fiscalyears/fiscalyears.component';
import { FiscalYearVM } from 'src/app/views/account/Models/FiscalYearVM';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  isRequesting: boolean = false
  info = new LoginVM;
  hide = true;
  login: LoginVM = new LoginVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  follow: FiscalYearVM;
  isLoading: boolean;
  injector: any;
  dialogRefe: any;
  dialogData: any;
  constructor(
    public secSvc: SecurityService,
    private resSvc: RestaurantService,
    private route: Router,
    private catSvc: CatalogService,
    public dialog: MatDialog,
  ) {

  }
  ngOnInit(): void {
  }
  Login() {
    if (!this.userForm.invalid) {
      this.isRequesting = true
      this.secSvc.Login(this.login).subscribe({
        next: (data: any) => {
          this.isRequesting = false
          if (data?.result?.succeeded == true) {
            localStorage.setItem("ClientId", "1")
            // if (!(fiscalYearId > 0))
            this.catSvc.SetProject(data)
            if (localStorage.getItem("RMSSuperAdminId") == null || localStorage.getItem("RMSSuperAdminId") == "undefined")
              this.OpenFiscalYearDialog()
          }
          else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Wrong credentials! ',
              footer: 'Invalid Password ',
              confirmButtonColor: "#000000"
            })
          }
        }, error: (err) => {
          this.isRequesting = false
          if (err.status == 400) {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Wrong credentials! ',
              footer: 'Invalid Email ',
              confirmButtonColor: "#000000"
            })
            console.warn(err)
          }
          else if (err.status == 0) {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Something went wrong! ',
              footer: 'Please Check your Connection',
              confirmButtonColor: "#000000"
            })
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Error Occurred ',
              confirmButtonColor: "#000000"
            })
          }
        }
      })
    }
  }
  OpenFiscalYearDialog() {
    debugger
    var dialogRef = this.dialog.open(FiscalyearsComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '55%', height: '70%'
      , data: {}
    });
    dialogRef.afterClosed()
      .subscribe((res) => {

      });
  }

}
