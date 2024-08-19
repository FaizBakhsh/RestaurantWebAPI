import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { StoreVM } from './../../restaurant/Models/StoreVM';
import { BranchVM } from './../../restaurant/Models/BranchVM';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from './../../catalog/catalog.service';
import { InventoryService } from './../inventory.service';
import { KitchenIssuanceVM } from './../Models/KitchenIssuanceVM';
import { Component, OnInit } from '@angular/core';
import * as moment from 'moment';
import { RestaurantService } from '../../restaurant/restaurant.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-manage-kitchen-issuance',
  templateUrl: './manage-kitchen-issuance.component.html',
  styleUrls: ['./manage-kitchen-issuance.component.css']
})
export class ManageKitchenIssuanceComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  kitchenIssuance?: KitchenIssuanceVM[]
  dataSource?: any;
  Branches?: BranchVM[]
  Stores?: StoreVM[]
  Kitchen?: SettingsVM[];
  selectedKitIssuance: KitchenIssuanceVM
  displayedColumns: string[] = ['date', 'keyWord', 'branch', 'strore', 'kitchen', 'actions'];
  constructor(
    private invtSvc: InventoryService,
    private resSvc: RestaurantService,
    private catSvc: CatalogService
  ) {
    this.selectedKitIssuance = new KitchenIssuanceVM
  }
  ngOnInit() {
    this.proccessing = false
    this.Add = true;
    this.Edit = false
    this.selectedKitIssuance = new KitchenIssuanceVM
    this.GetKitchenIssuance()
    this.GetBranch();
    this.GetStore();
    this.GetKitchen();
    this.selectedKitIssuance.isActive=true;
  }
  GetKitchenIssuance() {
    this.invtSvc.GetKitchenIssuance().subscribe({
      next: (value: KitchenIssuanceVM[]) => {
        console.warn(value)
        this.kitchenIssuance = value
        this.dataSource = new MatTableDataSource(this.kitchenIssuance)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetBranch() {
    this.resSvc.GetBranch().subscribe({
      next: (value: BranchVM[]) => {
        this.Branches = value
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetStore() {
    this.resSvc.GetStore().subscribe({
      next: (value: StoreVM[]) => {
        this.Stores = value
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetKitchen() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.KDS
    this.catSvc.SearchSettings(stng).subscribe({
      next: (value: SettingsVM[]) => {
        this.Kitchen = value
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  SaveKitchenIssuance() {
    this.proccessing = true
    this.invtSvc.SaveKitchenIssuance(this.selectedKitIssuance).subscribe({
      next: (value) => {
        this.proccessing = false
        this.catSvc.SuccessfullyAddMsg();
        this.ngOnInit()
      }, error: (err) => {
        this.proccessing = false
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  editKI(value: KitchenIssuanceVM) {
    this.Add = false;
    this.Edit = true
    this.selectedKitIssuance = value
  }
  deleteKI(value: KitchenIssuanceVM) {
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
        this.invtSvc.DeleteKitchenIssuance(value.id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Successfully Deleted.',
              'success'
            )
            this.GetKitchenIssuance();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  UpdateKitchenIssuance() {
    this.proccessing = true
    this.invtSvc.UpdateKitchenIssuance(this.selectedKitIssuance).subscribe({
      next: (value) => {
        this.proccessing = false
        this.ngOnInit()
        this.catSvc.SuccessfullyUpdateMsg()
        this.GetKitchenIssuance();
      }, error: (err) => {
        this.proccessing = false
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
}
