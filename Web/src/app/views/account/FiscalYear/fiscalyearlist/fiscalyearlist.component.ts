
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { NgForm } from '@angular/forms';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { AccountService } from '../../account.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ManagefiscalyearComponent } from '../managefiscalyear/managefiscalyear.component';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import Swal from 'sweetalert2';
import { FiscalYearVM } from '../../Models/FiscalYearVM';

@Component({
  selector: 'app-fiscalyearlist',
  templateUrl: './fiscalyearlist.component.html',
  styleUrls: ['./fiscalyearlist.component.css']
})
export class FiscalyearlistComponent {

  displayedColumns: String[] = ['yearCode', 'yearDesc', 'yearDateFrom', 'yearDateTo', 'isActiveYear', 'actions']
  isLoading: boolean = false
  dataSource: any
  FiscalYears: FiscalYearVM[];
  constructor(
    private catSvc: CatalogService,
    public dialog: MatDialog,
    private route: Router,
    private accSvc: AccountService) {
  }
  ngOnInit(): void {

    this.GetFiscalYear();
  }
  DeleteFiscalYear(id: number) {
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
        this.accSvc.DeleteFiscalYear(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'FiscalYear has been deleted.',
              'success'
            )
            this.GetFiscalYear();
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  OpenFiscalYearDialog() {
    debugger
    var dialogRef = this.dialog.open(ManagefiscalyearComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1200px', height: '450px'
      , data: {}
    });
    dialogRef.afterClosed()
      .subscribe((res) => {
        this.GetFiscalYear()
      });
  }
  EditFiscalYear(id: number) {
    debugger
    var dialogRef = this.dialog.open(ManagefiscalyearComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1200px', height: '450px'
      , data: { id: id }
    });
    dialogRef.afterClosed()
      .subscribe((res) => {
        this.GetFiscalYear()
      });
  }
  GetFiscalYear() {

    var FiscalYear = new FiscalYearVM
    FiscalYear.clientId = +localStorage.getItem("RMSClientId")
    this.accSvc.SearchFiscalYear(FiscalYear).subscribe({
      next: (res: FiscalYearVM[]) => {
        this.FiscalYears = res
        this.dataSource = new MatTableDataSource(res)
        this.isLoading = false
      }, error: (e) => {
        console.warn(e)
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
      }
    })
  }
}
//