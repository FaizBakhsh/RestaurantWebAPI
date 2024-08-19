import { RestaurantService } from './../../restaurant/restaurant.service';
import { BranchVM } from './../../restaurant/Models/BranchVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { AccountService } from '../account.service';
import { AssignAccountVM } from '../Models/AssignAccountVM';

@Component({
  selector: 'app-assign-account',
  templateUrl: './assign-account.component.html',
  styleUrls: ['./assign-account.component.css']
})
export class AssignAccountComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  Accounts?: SettingsVM[]
  Branches?: BranchVM[]
  selectedAssignAccount: AssignAccountVM
  AssignAccount: AssignAccountVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Account', 'AccountType', 'Branch', 'actions'];
  dataSource: any;
  constructor(
    public accSvc: AccountService,
    public catSvc: CatalogService,
    public resSvc: RestaurantService
  ) {
    this.selectedAssignAccount = new AssignAccountVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedAssignAccount = new AssignAccountVM
    this.GetAssignAccount();
    this.GetAccounts()
    this.GetBranch()
  }
  GetBranch() {
    var branch = new BranchVM
    branch.isActive = true
    this.resSvc.SearchBranch(branch).subscribe({
      next: (value) => {
        this.Branches = value
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetAccounts() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.Accounts
    stng.isActive = true
    this.catSvc.SearchSettings(stng).subscribe({
      next: (value: SettingsVM[]) => {
        this.Accounts = value
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetAssignAccount() {
    this.accSvc.GetAssignAccount().subscribe({
      next: (res: AssignAccountVM[]) => {
        this.AssignAccount = res;
        this.dataSource = new MatTableDataSource(this.AssignAccount);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteAssignAccount(id: number) {
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
        this.accSvc.DeleteAssignAccount(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'AssignAccount has been deleted.',
              'success'
            )
            this.GetAssignAccount();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetAssignAccountForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedAssignAccount = new AssignAccountVM;
    this.selectedAssignAccount.id = id
    console.warn(this.selectedAssignAccount);
    this.accSvc.SearchAssignAccount(this.selectedAssignAccount).subscribe({
      next: (res: AssignAccountVM[]) => {
        this.AssignAccount = res;
        console.warn(this.AssignAccount);
        this.selectedAssignAccount = this.AssignAccount[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveAssignAccount() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.accSvc.SaveAssignAccount(this.selectedAssignAccount).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
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
  UpdateAssignAccount() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.accSvc.UpdateAssignAccount(this.selectedAssignAccount).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
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
    this.selectedAssignAccount = new AssignAccountVM;
    this.Add = true;
    this.Edit = false;
  }
}

