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
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { StockEstimationVM } from '../Models/StockEstimationVM';

@Component({
  selector: 'app-stock-estimation',
  templateUrl: './stock-estimation.component.html',
  styleUrls: ['./stock-estimation.component.css']
})
export class StockEstimationComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  public date = new Date();
  Groups?: SettingsVM[]
  selectedStockEstimation: StockEstimationVM = new StockEstimationVM
  StockEstimation: StockEstimationVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  //displayedColumns: string[] = ['Printer', 'Type', 'Terminal', 'actions'];
  dataSource: any;
  constructor(
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    public itmSvc: ItemsService,
    private snack: MatSnackBar,) {
    this.selectedStockEstimation = new StockEstimationVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedStockEstimation = new StockEstimationVM
    this.GetStockEstimation();
    this.GetGroups();
    this.selectedStockEstimation.isActive=true
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
  GetStockEstimation() {
    this.invtrySvc.GetStockEstimation().subscribe({
      next: (res: StockEstimationVM[]) => {
        this.StockEstimation = res;
        this.dataSource = new MatTableDataSource(this.StockEstimation);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteStockEstimation(id: number) {
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
        this.invtrySvc.DeleteStockEstimation(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'StockEstimation has been deleted.',
              'success'
            )
            this.GetStockEstimation();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetStockEstimationForEdit(id: number) {
    this.selectedStockEstimation = new StockEstimationVM;
    this.selectedStockEstimation.id = id
    this.invtrySvc.SearchStockEstimation(this.selectedStockEstimation).subscribe({
      next: (res: StockEstimationVM[]) => {
        this.StockEstimation = res;
        console.warn(this.StockEstimation);
        this.selectedStockEstimation = this.StockEstimation[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveStockEstimation() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.SaveStockEstimation(this.selectedStockEstimation).subscribe({
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
  UpdateStockEstimation() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      this.invtrySvc.UpdateStockEstimation(this.selectedStockEstimation).subscribe({
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
    this.selectedStockEstimation = new StockEstimationVM;
    this.Add = true;
    this.Edit = false;
    this.selectedStockEstimation.isActive=true;
  }
}
