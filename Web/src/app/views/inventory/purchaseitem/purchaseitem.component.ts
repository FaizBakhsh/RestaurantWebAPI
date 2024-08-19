import { Component, ViewChild } from '@angular/core';
import { Location } from '@angular/common';

import { PurchaseItemsLineVM, PurchaseItemsVM } from '../Models/PurchaseItem';
import { BranchVM } from '../../restaurant/Models/BranchVM';
import { StoreVM } from '../../restaurant/Models/StoreVM';
import { SupplierVM } from '../../restaurant/Models/SupplierVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { ItemVM } from '../../restaurant/Models/ItemVM';
import { InventoryService } from '../inventory.service';
import { RestaurantService } from '../../restaurant/restaurant.service';

import { CatalogService } from '../../catalog/catalog.service';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { ItemTypes } from '../../restaurant/Models/Enums/ItemType';
import { ActivatedRoute } from '@angular/router';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import * as moment from 'moment';

@Component({
  selector: 'app-purchaseitem',
  templateUrl: './purchaseitem.component.html',
  styleUrls: ['./purchaseitem.component.css']
})
export class PurchaseitemComponent {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  getPurchItemById!:PurchaseItemsVM[];
  PurchaseItem?:PurchaseItemsVM[]
  piList:PurchaseItemsLineVM[]=[]
  purchItemId!:number;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  @ViewChild('PIDetailForm') piDetailForm!: NgForm
  selectedPILine:PurchaseItemsLineVM
  displayedColumns: string[] = ['rawItemId', 'package', 'packageItems', 'totalItems', 'price', 'pricePerItem' ,'totalAmount','branchId', 'description','expiry', 'actions'];
  Branches?: BranchVM[];
  lineUpdateMode: boolean = false;
  lineAddMode: boolean = false;
  DeleteLine: any;
  Stores?:StoreVM[];
  Suppliers?:SupplierVM[];
  Groups?:SettingsVM[];
  Items?: ItemVM[];
  PurchaseTypes?:SettingsVM[];
  selectedPurchItem:any
  dataSource: any;
  constructor(
    private invtSvc: InventoryService,
    private resSvc:RestaurantService,
    private catSvc:CatalogService,
    private route : ActivatedRoute,
    private location: Location,
    private snack: MatSnackBar,
    ) 
    {
      this.selectedPurchItem = new PurchaseItemsVM
      this.selectedPILine = new PurchaseItemsLineVM
    }
  ngOnInit(){
    this.route.queryParams.subscribe(params => {
      this.purchItemId = params['id'];
    });
    console.warn(this.purchItemId)
    if (this.purchItemId > 0) {
      this.Edit = true;
      this.Add = false;
     this.GetPurchaseItemForEdit();
    }
   
      this.Edit = false;
      this.Add = true;
      this.GetBranch()
      this.GetStore()
      this.GetSupplier()
      this.GetGroup()
      this.GetItem()
      this.GetPurchaseTypes()
      this.GetPurchaseItem()
      this.selectedPurchItem= new PurchaseItemsVM
      this.selectedPurchItem.isActive=true;
    }
 GetBranch(){
  this.resSvc.GetBranch().subscribe({
    next:(value:BranchVM[])=> {
   this.Branches=value
    },error:(err)=> {
      this.catSvc.ErrorMsgBar("error occured" , 5000)
    },
  })
}
GetStore(){
  this.resSvc.GetStore().subscribe({
    next:(value:StoreVM[])=> {
      this.Stores=value
    },error:(err)=> {
      this.catSvc.ErrorMsgBar("error occured" , 5000)
    },
  })
}
GetSupplier(){
  this.resSvc.GetSupplier().subscribe({
    next:(value:SupplierVM[]) => {
      this.Suppliers=value
    },error:(err)=> {
      this.catSvc.ErrorMsgBar("error occured" , 5000)
    },
  })
  }
  GetGroup(){
    var stng = new SettingsVM
    stng.enumTypeId=EnumTypeVM.ItemGroup
    this.catSvc.SearchSettings(stng).subscribe({
      next:(value:SettingsVM[])=> {
     this.Groups=value
      },error:(err)=> {
        this.catSvc.ErrorMsgBar("error occured" , 5000)
      },
    })
  }
  GetItem(){
    var item = new ItemVM
    item.itemTypeId = ItemTypes.RawItem
    this.resSvc.SearchItem(item).subscribe({
      next:(value:ItemVM[])=> {
     this.Items=value
      },error:(err)=> {
        this.catSvc.ErrorMsgBar("error occured" , 5000)
      },
    })
  }
  GetPurchaseTypes(){
 var stng = new SettingsVM
 stng.enumTypeId = EnumTypeVM.PurchaseTypes
 this.catSvc.SearchSettings(stng).subscribe({
  next:(value:SettingsVM[])=> {
    this.PurchaseTypes= value
  },error:(err)=> {
    this.catSvc.ErrorMsgBar("error occured" , 5000)
  },
 })
  }
  Refresh() {
    this.selectedPILine = new PurchaseItemsLineVM
    this.selectedPurchItem = new PurchaseItemsVM;
    this.Add = true;
    this.Edit = false;
    this.piList = []
    this.lineUpdateMode = false
    this.dataSource = new MatTableDataSource(this.piList);
    this.selectedPurchItem.isActive=true
  }

  GetPurchaseItemById(){
    this.selectedPurchItem.id = this.purchItemId
    this.invtSvc.SearchPurchaseItem(this.selectedPurchItem).subscribe({
      next:(res:PurchaseItemsVM[]) => {
        this.PurchaseItem = res
        this.selectedPurchItem = this.PurchaseItem[0]
      },error:(err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Event(event:any){
    this.selectedPurchItem.totalQty = this.selectedPurchItem.itemsPerPkg * this.selectedPurchItem.noOfPkg;
    this.selectedPurchItem.totalAmount = this.selectedPurchItem.pricePerPkg * this.selectedPurchItem.noOfPkg;
    this.selectedPurchItem.pricePerItem = this.selectedPurchItem.totalAmount / this.selectedPurchItem.totalQty;
    this.selectedPurchItem.ttlAmount = this.selectedPurchItem.totalAmount ;
}
AddLinetoList() {
  debugger
  if (this.selectedPILine.rawItemId == undefined || this.selectedPILine.rawItemId == 0)
    this.piDetailForm.form.controls['rawItemId'].setErrors({ 'incorrect': true })
  if (!this.piDetailForm.invalid) {
    this.selectedPurchItem.date = moment(this.selectedPurchItem.date).toDate()
    this.selectedPurchItem.date = new Date(Date.UTC(this.selectedPurchItem.date.getFullYear(), this.selectedPurchItem.date.getMonth(), this.selectedPurchItem.date.getDate()))

    this.selectedPILine.totalAmount = this.selectedPILine.totalItems * this.selectedPILine.pricePerItem
    if (this.lineUpdateMode == true)
      this.piList = this.piList.filter(x => x != this.selectedPILine)
    this.piList.push(this.selectedPILine)
    this.dataSource = new MatTableDataSource(this.piList);
    console.warn(this.piList)
    this.selectedPILine = new PurchaseItemsLineVM
    this.lineUpdateMode = false
  }
  else
    this.catSvc.ErrorMsgBar("Please Fill all required fields", 6000)
}
RefreshLine() {
  this.selectedPILine = new PurchaseItemsLineVM
  this.lineUpdateMode = false
}
GetPurchaseItem() {
  this.invtSvc.GetPurchaseItem().subscribe({
    next: (res: PurchaseItemsVM[]) => {
      this.PurchaseItem = res;
      //  this.dataSource = new MatTableDataSource(this.PurchaseReturn);
    }, error: (e) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      console.warn(e);
    }
  })
}
GetPurchaseItemForEdit() {
  var pi = new PurchaseItemsVM;
  pi.id = this.purchItemId
  this.invtSvc.SearchPurchaseItem(pi).subscribe({
    next: (res: PurchaseItemsVM[]) => {
      console.warn(res)
      this.PurchaseItem = res;
      this.selectedPurchItem = this.PurchaseItem[0]
      console.warn(this.selectedPurchItem)
      this.piList = []
      this.selectedPurchItem.piLines?.forEach(element => {
        this.piList.push(element)
        console.warn(this.piList)
      });
      this.dataSource = new MatTableDataSource(this.selectedPurchItem.piLines)
      console.warn(this.dataSource)
      this.Edit = true;
      this.Add = false;
    }, error: (e) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      console.warn(e);
    }
  })
}
delete(val: PurchaseItemsLineVM) {
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
      if (val.id > 0) {
        var pi = new PurchaseItemsVM
        pi = this.selectedPurchItem
        pi.piLines = []
        val.dBoperation = 3
        pi.piLines.push(val)
        this.invtSvc.UpdatePurchaseItem(pi).subscribe({
          next: (value) => {
            this.DeleteLine(val);
          }, error: (err) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 3000)
          },
        })
      }
      else
        this.DeleteLine(val);
    }
  })
}
DeleteDetail(val: PurchaseItemsLineVM) {
  Swal.fire(
    'Deleted!',
    'Successfully Deleted.',
    'success'
  )
  this.piList = this.piList.filter(x => x != val)
  this.dataSource = new MatTableDataSource(this.piList);
}
edit(val: PurchaseItemsLineVM) {
  this.lineUpdateMode = true
  this.selectedPILine = val
}
Submit() {
  debugger
  if (this.selectedPurchItem.branchId == undefined || this.selectedPurchItem.branchId == 0)
    this.userForm.form.controls['branchId'].setErrors({ 'incorrect': true })
  if (this.selectedPurchItem.supplierId == undefined || this.selectedPurchItem.supplierId == 0)
    this.userForm.form.controls['supplierId'].setErrors({ 'incorrect': true })
  if (!this.userForm.invalid) {
    if (this.piList.length > 0) {
      this.proccessing = true
      this.selectedPurchItem.piLines = this.piList
      this.selectedPurchItem.piLines.forEach(element => {
        if (element.id > 0)
          element.dBoperation = 2
        else
          element.dBoperation = 1
      });
      this.selectedPurchItem.date = moment(this.selectedPurchItem.date).toDate()
      this.selectedPurchItem.date = new Date(Date.UTC(this.selectedPurchItem.date.getFullYear(), this.selectedPurchItem.date.getMonth(), this.selectedPurchItem.date.getDate()))

      if (this.Edit == true) {
        this.invtSvc.UpdatePurchaseItem(this.selectedPurchItem).subscribe({
          next: (res: PurchaseItemsVM) => {
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
            this.selectedPurchItem = res
            this.piList = res.piLines
            this.dataSource = new MatTableDataSource(this.piList);
            this.proccessing = false
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
            this.proccessing = false
          }
        })
      } else {
        this.invtSvc.SavePurchaseItem(this.selectedPurchItem).subscribe({
          next: (res: PurchaseItemsVM) => {
            this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
            this.Refresh();
            this.proccessing = false
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
            this.proccessing = false
          }
        })
      }
    } else {
      this.catSvc.ErrorMsgBar("Please add some purchase return detail to continue...", 5000)
    }
  } else this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
}
Back() {
  this.location.back();
}
}