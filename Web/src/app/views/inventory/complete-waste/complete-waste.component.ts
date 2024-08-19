import { ItemsService } from 'src/app/views/items/items.service';

import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
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
import { CompleteWasteVM } from '../Models/CompleteWaste';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';

@Component({
  selector: 'app-complete-waste',
  templateUrl: './complete-waste.component.html',
  styleUrls: ['./complete-waste.component.css']
})
export class CompleteWasteComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  public date = new Date();
  Groups?: SettingsVM[]
  selectedCompleteWaste: CompleteWasteVM = new CompleteWasteVM
  CompleteWaste: CompleteWasteVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  //displayedColumns: string[] = ['Printer', 'Type', 'Terminal', 'actions'];
  dataSource: any;
  constructor(
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    public itmSvc: ItemsService,
    private snack: MatSnackBar,) {
    this.selectedCompleteWaste = new CompleteWasteVM();
    this.selectedCompleteWaste.isActive=true
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedCompleteWaste = new CompleteWasteVM
    this.GetCompleteWaste();
    this.GetGroups();
  }

  GetGroups() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.MenuItemGroup
    this.itmSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Groups = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetCompleteWaste() {
    this.invtrySvc.GetCompleteWaste().subscribe({
      next: (res: CompleteWasteVM[]) => {
        this.CompleteWaste = res;
        this.dataSource = new MatTableDataSource(this.CompleteWaste);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteCompleteWaste(id: number) {
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
        this.invtrySvc.DeleteCompleteWaste(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'CompleteWaste has been deleted.',
              'success'
            )
            this.GetCompleteWaste();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetCompleteWasteForEdit(id: number) {
    this.selectedCompleteWaste = new CompleteWasteVM;
    this.selectedCompleteWaste.id = id
    this.invtrySvc.SearchCompleteWaste(this.selectedCompleteWaste).subscribe({
      next: (res: CompleteWasteVM[]) => {
        this.CompleteWaste = res;
        console.warn(this.CompleteWaste);
        this.selectedCompleteWaste = this.CompleteWaste[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveCompleteWaste() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.SaveCompleteWaste(this.selectedCompleteWaste).subscribe({
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
  UpdateCompleteWaste() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.UpdateCompleteWaste(this.selectedCompleteWaste).subscribe({
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
    this.selectedCompleteWaste = new CompleteWasteVM;
    this.Add = true;
    this.Edit = false;
    this.selectedCompleteWaste.isActive=true;
  }
}


