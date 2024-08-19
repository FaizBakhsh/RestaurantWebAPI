import { ItemsService } from 'src/app/views/items/items.service';

import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { RestaurantService } from './../../restaurant/restaurant.service';
import { InventoryService } from './../inventory.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
import { CatalogService } from './../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { KitchenDemandVM } from '../Models/KitchenDemandVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';

@Component({
  selector: 'app-kitchen-demand',
  templateUrl: './kitchen-demand.component.html',
  styleUrls: ['./kitchen-demand.component.css']
})
export class KitchenDemandComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  public date = new Date();
  Categories?: SettingsVM[]
  Kitchens?: SettingsVM[]
  selectedKitchenDemand: KitchenDemandVM = new KitchenDemandVM
  KitchenDemand: KitchenDemandVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  //displayedColumns: string[] = ['Printer', 'Type', 'Terminal', 'actions'];
  dataSource: any;
  constructor(
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    public itmSvc: ItemsService,
    private snack: MatSnackBar,) {
    this.selectedKitchenDemand = new KitchenDemandVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedKitchenDemand = new KitchenDemandVM
    this.GetKitchenDemand();
    this.GetCategory();
    this.GetKitchen();
    this.selectedKitchenDemand.isActive=true
  }

  GetCategory() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.ItemCategory
    this.itmSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Categories = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetKitchen() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.KDS
    this.itmSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Kitchens = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetKitchenDemand() {
    this.invtrySvc.GetKitchenDemand().subscribe({
      next: (res: KitchenDemandVM[]) => {
        this.KitchenDemand = res;
        this.dataSource = new MatTableDataSource(this.KitchenDemand);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteKitchenDemand(id: number) {
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
        this.invtrySvc.DeleteKitchenDemand(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'KitchenDemand has been deleted.',
              'success'
            )
            this.GetKitchenDemand();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetKitchenDemandForEdit(id: number) {
    this.selectedKitchenDemand = new KitchenDemandVM;
    this.selectedKitchenDemand.id = id
    this.invtrySvc.SearchKitchenDemand(this.selectedKitchenDemand).subscribe({
      next: (res: KitchenDemandVM[]) => {
        this.KitchenDemand = res;
        console.warn(this.KitchenDemand);
        this.selectedKitchenDemand = this.KitchenDemand[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveKitchenDemand() {
    this.proccessing = true
    if (!this.userForm.invalid && this.selectedKitchenDemand.categoryId != 0 && this.selectedKitchenDemand.kitchenId != 0) {
      this.invtrySvc.SaveKitchenDemand(this.selectedKitchenDemand).subscribe({
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
  UpdateKitchenDemand() {
    this.proccessing = true
    if (!this.userForm.invalid && this.selectedKitchenDemand.categoryId != 0 && this.selectedKitchenDemand.kitchenId != 0) {
      this.invtrySvc.UpdateKitchenDemand(this.selectedKitchenDemand).subscribe({
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
    this.selectedKitchenDemand = new KitchenDemandVM;
    this.Add = true;
    this.Edit = false;
    this.selectedKitchenDemand.isActive=true;
  }
}

