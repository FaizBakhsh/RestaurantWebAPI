import { ItemTypes } from './../../restaurant/Models/Enums/ItemType';
import { ItemVM } from './../../restaurant/Models/ItemVM';
import { BranchVM } from './../../restaurant/Models/BranchVM';
import { RestaurantService } from './../../restaurant/restaurant.service';
import { InventoryService } from './../inventory.service';
import { DemandVM } from './../Models/DemandVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
import { CatalogService } from './../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-manage-demand',
  templateUrl: './manage-demand.component.html',
  styleUrls: ['./manage-demand.component.css']
})
export class ManageDemandComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  public date = new Date();
  Branches?: BranchVM[]
  Items?: ItemVM[]
  selectedDemand: DemandVM = new DemandVM
  Demand: DemandVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  //displayedColumns: string[] = ['Printer', 'Type', 'Terminal', 'actions'];
  dataSource: any;
  constructor(
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    private snack: MatSnackBar,) {
    this.selectedDemand = new DemandVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedDemand = new DemandVM
    this.GetDemand();
    this.GetItems();
    this.GetBranch();
    this.selectedDemand.isActive=true
  }

  GetBranch() {
    this.resSvc.GetBranch().subscribe({
      next: (res: BranchVM[]) => {
        this.Branches = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetItems() {
    var item = new ItemVM
    item.itemTypeId = ItemTypes.MenuItem
    this.resSvc.SearchItem(item).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetDemand() {
    this.invtrySvc.GetDemand().subscribe({
      next: (res: DemandVM[]) => {
        this.Demand = res;
        this.dataSource = new MatTableDataSource(this.Demand);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteDemand(id: number) {
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
        this.invtrySvc.DeleteDemand(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Demand has been deleted.',
              'success'
            )
            this.GetDemand();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetDemandForEdit(id: number) {
    this.selectedDemand = new DemandVM;
    this.selectedDemand.id = id
    this.invtrySvc.SearchDemand(this.selectedDemand).subscribe({
      next: (res: DemandVM[]) => {
        this.Demand = res;
        console.warn(this.Demand);
        this.selectedDemand = this.Demand[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveDemand() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.SaveDemand(this.selectedDemand).subscribe({
        next: (res: any) => {
          this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
          this.Add = true;
          this.Edit = false;
          this.proccessing = false
          this.ngOnInit();
        }, error: (e: any) => {
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
  UpdateDemand() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.UpdateDemand(this.selectedDemand).subscribe({
        next: (res: any) => {
          this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
          this.Add = true;
          this.Edit = false;
          this.proccessing = false
          this.ngOnInit();
        }, error: (e: any) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
          this.proccessing = false
        }
      })
    }
    else {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      this.proccessing = false
    }
  }
  Refresh() {
    this.selectedDemand = new DemandVM;
    this.Add = true;
    this.Edit = false;
    this.selectedDemand.isActive=true;
  }
}


