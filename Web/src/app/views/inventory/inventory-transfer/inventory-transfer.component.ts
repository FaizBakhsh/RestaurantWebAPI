import { BranchVM } from './../../restaurant/Models/BranchVM';
import { RestaurantService } from './../../restaurant/restaurant.service';
import { InventoryService } from './../inventory.service';
import { InventoryTransferVM } from './../Models/InventoryTransfer';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
import { CatalogService } from './../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
@Component({
  selector: 'app-inventory-transfer',
  templateUrl: './inventory-transfer.component.html',
  styleUrls: ['./inventory-transfer.component.css']
})
export class InventoryTransferComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  public date = new Date();
  Branches?: BranchVM[]
  selectedInventoryTransfer: InventoryTransferVM = new InventoryTransferVM
  InventoryTransfer: InventoryTransferVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  //displayedColumns: string[] = ['Printer', 'Type', 'Terminal', 'actions'];
  dataSource: any;
  constructor(
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    private snack: MatSnackBar,) {
    this.selectedInventoryTransfer = new InventoryTransferVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedInventoryTransfer = new InventoryTransferVM
    this.GetInventoryTransfer();
    this.GetBranch();
    this.selectedInventoryTransfer.isActive=true;
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
  GetInventoryTransfer() {
    this.invtrySvc.GetInventoryTransfer().subscribe({
      next: (res: InventoryTransferVM[]) => {
        this.InventoryTransfer = res;
        this.dataSource = new MatTableDataSource(this.InventoryTransfer);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteInventoryTransfer(id: number) {
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
        this.invtrySvc.DeleteInventoryTransfer(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'InventoryTransfer has been deleted.',
              'success'
            )
            this.GetInventoryTransfer();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetInventoryTransferForEdit(id: number) {
    this.selectedInventoryTransfer = new InventoryTransferVM;
    this.selectedInventoryTransfer.id = id
    this.invtrySvc.SearchInventoryTransfer(this.selectedInventoryTransfer).subscribe({
      next: (res: InventoryTransferVM[]) => {
        this.InventoryTransfer = res;
        console.warn(this.InventoryTransfer);
        this.selectedInventoryTransfer = this.InventoryTransfer[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveInventoryTransfer() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.SaveInventoryTransfer(this.selectedInventoryTransfer).subscribe({
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
  UpdateInventoryTransfer() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.UpdateInventoryTransfer(this.selectedInventoryTransfer).subscribe({
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
    this.selectedInventoryTransfer = new InventoryTransferVM;
    this.Add = true;
    this.Edit = false;
    this.selectedInventoryTransfer.isActive=true;
  }
}

