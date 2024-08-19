import { RestaurantService } from './../restaurant.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatDialog } from '@angular/material/dialog';
import { ExpensesVM } from '../../restaurant/Models/ExpensesVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { CatalogService } from '../../catalog/catalog.service';
import * as moment from 'moment';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-expenses',
  templateUrl: './manage-expenses.component.html',
  styleUrls: ['./manage-expenses.component.css']
})
export class ManageExpensesComponent implements OnInit {
  proccessing: boolean = false;
  isReadOnly: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Expenses: ExpensesVM[] | undefined;
  selectedExpenses: ExpensesVM
  //Expenses?: ExpensesVM[];
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'amount', 'date', 'actions'];
  dataSource: any;
  constructor(
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedExpenses = new ExpensesVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Expanses)
    this.Add = true;
    this.Edit = false;
    this.selectedExpenses = new ExpensesVM
    this.GetExpenses();
    this.selectedExpenses.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetExpenses() {
    var exp = new ExpensesVM
    exp.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchExpenses(exp).subscribe({
      next: (res: ExpensesVM[]) => {
        this.Expenses = res;
        this.dataSource = new MatTableDataSource(this.Expenses);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteExpenses(id: number) {
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
        this.resSvc.DeleteExpenses(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Expenses has been deleted.',
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
  GetExpensesForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedExpenses = new ExpensesVM;
    this.selectedExpenses.id = id
    this.selectedExpenses.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchExpenses(this.selectedExpenses).subscribe({
      next: (res: ExpensesVM[]) => {
        this.Expenses = res;
        console.warn(this.Expenses);
        this.selectedExpenses = this.Expenses[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveExpenses() {
    this.SetDate();
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.selectedExpenses.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SaveExpenses(this.selectedExpenses).subscribe({
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
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  UpdateExpenses() {
    this.SetDate();
    this.proccessing = true
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedExpenses.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.UpdateExpenses(this.selectedExpenses).subscribe({
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
    else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  Refresh() {
    this.selectedExpenses.name = "";
    this.Add = true;
    this.Edit = false;
    this.selectedExpenses.isActive = true;
  }
  SetDate() {
    this.selectedExpenses.date = moment(this.selectedExpenses.date).toDate()
    this.selectedExpenses.date = new Date(Date.UTC(this.selectedExpenses.date.getFullYear(), this.selectedExpenses.date.getMonth(), this.selectedExpenses.date.getDate()))
  }
}

