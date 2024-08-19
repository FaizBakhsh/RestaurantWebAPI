import { CatalogService } from './../../../catalog/catalog.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import Swal from 'sweetalert2';
import { BranchVM } from '../../Models/BranchVM';
import { RestaurantService } from '../../restaurant.service';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-branch',
  templateUrl: './manage-branch.component.html',
  styleUrls: ['./manage-branch.component.css']
})
export class ManageBranchComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Branch: BranchVM[] | undefined;
  Branches?: BranchVM[];
  selectedBranch: BranchVM
  accounts: SettingsVM[]
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Branch', 'Code', 'Type', 'Location', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedBranch = new BranchVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Branch)
    this.Add = true;
    this.Edit = false;
    this.selectedBranch = new BranchVM
    this.GetBranch();
    this.SerachBranch();
    this.GetAccounts()
    this.selectedBranch.isActive = true;
  }
  GetAccounts() {
    var stng = new SettingsVM
    stng.levelId = EnumTypeVM.Level5
    stng.isActive = true
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.accounts = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  Check() {
    this.validFields = true;
  }
  GetBranch() {
    var branch = new BranchVM
    branch.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.Branch = res;
        this.dataSource = new MatTableDataSource(this.Branch);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SerachBranch() {
    var branch = new BranchVM
    branch.isActive = true
    branch.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.Branches = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteBranch(id: number) {
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
        this.resSvc.DeleteBranch(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Branch has been deleted.',
              'success'
            )
            this.GetBranch();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetBranchForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedBranch = new BranchVM;
    this.selectedBranch.id = id
    this.selectedBranch.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchBranch(this.selectedBranch).subscribe({
      next: (res: BranchVM[]) => {
        this.Branch = res;
        this.selectedBranch = this.Branch[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveBranch() {
    this.proccessing = true
    if (this.selectedBranch.branchId == 0)
      this.selectedBranch.branchId = 0
    if (!this.userForm.invalid) {
      var stng = new SettingsVM
      stng.enumTypeId = EnumTypeVM.Branches
      stng.clientId = +localStorage.getItem("RMSClientId")
      this.catSvc.SearchSettings(stng).subscribe({
        next: (res: SettingsVM[]) => {
          if (res.length != 0) {
            var value = res[res.length - 1]
            this.selectedBranch.branchEnumTypeId = value.id + 1
          }
          else {
            var id = EnumTypeVM.Branches.toString() + "001"
            this.selectedBranch.branchEnumTypeId = +id
          }
          this.selectedBranch.clientId = +localStorage.getItem("RMSClientId")
          this.resSvc.SaveBranch(this.selectedBranch).subscribe({
            next: (res) => {
              this.catSvc.SuccessMsgBar("Branch Successfully Added!", 5000)
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
        }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })

    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  UpdateBranch() {
    this.proccessing = true
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedBranch.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.UpdateBranch(this.selectedBranch).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar("Branch Successfully Updated!", 5000)
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
    this.selectedBranch.name = "";
    this.Add = true;
    this.Edit = false;
    this.selectedBranch.isActive = true
  }
}

