import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { RestaurantService } from '../restaurant.service';
import { BranchVM } from '../Models/BranchVM';
import { ItemsService } from '../../items/items.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { IconSetService } from '@coreui/icons-angular';
import { MatSnackBar } from '@angular/material/snack-bar';
import { iconSubset } from 'src/app/icons/icon-subset';
import { StoreVM } from '../Models/StoreVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-store',
  templateUrl: './manage-store.component.html',
  styleUrls: ['./manage-store.component.css']
})
export class ManageStoreComponent implements OnInit {
  isReadOnly: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Store: StoreVM[] | undefined;
  Branch?: BranchVM[];
  selectedStore: StoreVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['StoreName', 'StoreCode', 'Branch', 'isActive', 'actions'];
  dataSource: any;
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    public resSVC: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedStore = new StoreVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Store)
    this.Add = true;
    this.Edit = false;
    this.selectedStore = new StoreVM
    this.GetBranch();
    this.GetStore();
    this.selectedStore.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetStore() {
    var store = new StoreVM
    store.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchStore(store).subscribe({
      next: (res: StoreVM[]) => {
        this.Store = res;
        this.dataSource = new MatTableDataSource(this.Store);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetBranch() {
    var branch = new BranchVM
    branch.isActive = true
    branch.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.Branch = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteStore(id: number) {
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
        this.resSvc.DeleteStore(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Store has been deleted.',
              'success'
            )
            this.GetStore();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetStoreForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedStore = new StoreVM;
    this.selectedStore.id = id
    this.selectedStore.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchStore(this.selectedStore).subscribe({
      next: (res: StoreVM[]) => {
        this.Store = res;
        console.warn(this.Store);
        this.selectedStore = this.Store[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveStore() {
    if (this.selectedStore.branchId == 0 || this.selectedStore.branchId == undefined)
      this.userForm.controls['branchId'].setErrors({ incorrect: true })
    if (!this.userForm.invalid) {
      this.selectedStore.clientId = +localStorage.getItem("RMSClientId")
      if (this.Edit)
        this.UpdateStore()
      else
        this.resSvc.SaveStore(this.selectedStore).subscribe({
          next: (res) => {
            this.catSvc.SuccessfullyAddMsg()
            this.Add = true;
            this.Edit = false;
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateStore() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.UpdateStore(this.selectedStore).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyUpdateMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  Refresh() {
    this.selectedStore = new StoreVM
    this.Add = true;
    this.Edit = false;
    this.selectedStore.isActive = true;
  }
}

