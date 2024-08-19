import { Component, OnInit, ViewChild } from '@angular/core';
import { InventoryService } from '../inventory.service';
import { CatalogService } from '../../catalog/catalog.service';
import { PurchaseOrderLineVM, PurchaseOrderVM } from '../Models/PurchaseOrder';
import { MatTableDataSource } from '@angular/material/table';
import { RestaurantService } from '../../restaurant/restaurant.service';
import { SupplierVM } from '../../restaurant/Models/SupplierVM';
import { BranchVM } from '../../restaurant/Models/BranchVM';
import { ItemVM } from '../../restaurant/Models/ItemVM';
import { NgForm } from '@angular/forms';
import Swal from 'sweetalert2';
import { ItemTypes } from '../../restaurant/Models/Enums/ItemType';
import { ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import * as moment from 'moment';
import { Location } from '@angular/common';
@Component({
  selector: 'app-purchaseorder',
  templateUrl: './purchaseorder.component.html',
  styleUrls: ['./purchaseorder.component.css']
})
export class PurchaseorderComponent {
  Edit: boolean = false;
  Add: boolean = true;
  proccessing: boolean = false;
  getPurchOrderById!:PurchaseOrderVM[];
  selectedPurchOrder:any
  poList: PurchaseOrderLineVM[] = []
  Suppliers?:SupplierVM[]
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  @ViewChild('PODetailForm') poDetailForm!: NgForm
  selectedPOLine: PurchaseOrderLineVM
  Branches?:BranchVM[]
  Items?:ItemVM[]
  PurchaseOrder?:PurchaseOrderVM[]
  dataSource: any;
  displayedColumns: string[] = ['rawItemId', 'package', 'packageItems', 'totalItems', 'price', 'pricePerItem' ,'totalAmount', 'description', 'actions'];
  purchOrderId!:number;
  lineUpdateMode: boolean = false;
  lineAddMode: boolean = false;
  DeleteLine: any;
  
  constructor( 
    private invtSvc: InventoryService,
    private resSvc:RestaurantService,
    private catSvc:CatalogService,
    private route : ActivatedRoute,
    private location: Location,
    private snack: MatSnackBar,
    )
    {
      this.selectedPurchOrder = new PurchaseOrderVM
      this.selectedPOLine = new PurchaseOrderLineVM
    }
  ngOnInit(){
    this.route.queryParams.subscribe(params => {
      this.purchOrderId = params['id'];
    });
    console.warn(this.purchOrderId)
    if (this.purchOrderId > 0) {
      this.Edit = true;
      this.Add = false;
     this.GetPurchaseOrderForEdit();
    }
   
      this.Edit = false;
      this.Add = true;
      this.GetSupplier()
      this.GetBranch()
      this.GetItem()
      this.GetPurchaseOrder()
      this.selectedPurchOrder= new PurchaseOrderVM
      this.selectedPurchOrder.isActive=true;
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
  GetBranch(){
    this.resSvc.GetBranch().subscribe({
      next:(value:BranchVM[])=> {
     this.Branches=value
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
  Refresh() {
    this.selectedPOLine = new PurchaseOrderLineVM
    this.selectedPurchOrder = new PurchaseOrderVM;
    this.Add = true;
    this.Edit = false;
    this.poList = []
    this.lineUpdateMode = false
    this.dataSource = new MatTableDataSource(this.poList);
  }
  GetPurchaseOrderById(){
    this.selectedPurchOrder.id = this.purchOrderId
    this.invtSvc.SearchPurchaseOrder(this.selectedPurchOrder).subscribe({
      next:(res:PurchaseOrderVM[]) => {
        this.PurchaseOrder = res
        this.selectedPurchOrder = this.PurchaseOrder[0]
      },error:(err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Event(event:any){
 this.selectedPurchOrder.totalQty = this.selectedPurchOrder.itemsPerPkg * this.selectedPurchOrder.noOfPkg;
 this.selectedPurchOrder.totalAmount = this.selectedPurchOrder.pricePerPkg * this.selectedPurchOrder.noOfPkg;
}
AddLinetoList() {
  debugger
  if (this.selectedPOLine.rawItemId == undefined || this.selectedPOLine.rawItemId == 0)
    this.poDetailForm.form.controls['rawItemId'].setErrors({ 'incorrect': true })
  if (!this.poDetailForm.invalid) {
    this.selectedPurchOrder.poDate = moment(this.selectedPurchOrder.poDate).toDate()
    this.selectedPurchOrder.poDate = new Date(Date.UTC(this.selectedPurchOrder.poDate.getFullYear(), this.selectedPurchOrder.poDate.getMonth(), this.selectedPurchOrder.poDate.getDate()))

    this.selectedPOLine.totalAmount = this.selectedPOLine.totalItems * this.selectedPOLine.pricePerItem
    if (this.lineUpdateMode == true)
      this.poList = this.poList.filter(x => x != this.selectedPOLine)
    this.poList.push(this.selectedPOLine)
    this.dataSource = new MatTableDataSource(this.poList);
    console.warn(this.poList)
    this.selectedPOLine = new PurchaseOrderLineVM
    this.lineUpdateMode = false
  }
  else
    this.catSvc.ErrorMsgBar("Please Fill all required fields", 6000)
}
RefreshLine() {
  this.selectedPOLine = new PurchaseOrderLineVM
  this.lineUpdateMode = false
}
GetPurchaseOrder() {
  this.invtSvc.GetPurchaseOrder().subscribe({
    next: (res: PurchaseOrderVM[]) => {
      this.PurchaseOrder = res;
      //  this.dataSource = new MatTableDataSource(this.PurchaseReturn);
    }, error: (e) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      console.warn(e);
    }
  })
}
GetPurchaseOrderForEdit() {
  var po = new PurchaseOrderVM;
  po.id = this.purchOrderId
  this.invtSvc.SearchPurchaseOrder(po).subscribe({
    next: (res: PurchaseOrderVM[]) => {
      console.warn(res)
      this.PurchaseOrder = res;
      this.selectedPurchOrder = this.PurchaseOrder[0]
      console.warn(this.selectedPurchOrder)
      this.poList = []
      this.selectedPurchOrder.poLines?.forEach(element => {
        this.poList.push(element)
        console.warn(this.poList)
      });
      this.dataSource = new MatTableDataSource(this.selectedPurchOrder.poLines)
      console.warn(this.dataSource)
      this.Edit = true;
      this.Add = false;
    }, error: (e) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      console.warn(e);
    }
  })
}
delete(val: PurchaseOrderLineVM) {
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
        var po = new PurchaseOrderVM
        po = this.selectedPurchOrder
        po.poLines = []
        val.dBoperation = 3
        po.poLines.push(val)
        this.invtSvc.UpdatePurchaseOrder(po).subscribe({
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
DeleteDetail(val: PurchaseOrderLineVM) {
  Swal.fire(
    'Deleted!',
    'Successfully Deleted.',
    'success'
  )
  this.poList = this.poList.filter(x => x != val)
  this.dataSource = new MatTableDataSource(this.poList);
}
edit(val: PurchaseOrderLineVM) {
  this.lineUpdateMode = true
  this.selectedPOLine = val
}
Submit() {
  if (this.selectedPurchOrder.branchId == undefined || this.selectedPurchOrder.branchId == 0)
    this.userForm.form.controls['branchId'].setErrors({ 'incorrect': true })
  if (this.selectedPurchOrder.supplierId == undefined || this.selectedPurchOrder.supplierId == 0)
    this.userForm.form.controls['supplierId'].setErrors({ 'incorrect': true })
  if (!this.userForm.invalid) {
    if (this.poList.length > 0) {
      this.proccessing = true
      this.selectedPurchOrder.poLines = this.poList
      this.selectedPurchOrder.poLines.forEach(element => {
        if (element.id > 0)
          element.dBoperation = 2
        else
          element.dBoperation = 1
      });
      this.selectedPurchOrder.poDate = moment(this.selectedPurchOrder.poDate).toDate()
      this.selectedPurchOrder.poDate = new Date(Date.UTC(this.selectedPurchOrder.poDate.getFullYear(), this.selectedPurchOrder.poDate.getMonth(), this.selectedPurchOrder.poDate.getDate()))

      if (this.Edit == true) {
        this.invtSvc.UpdatePurchaseOrder(this.selectedPurchOrder).subscribe({
          next: (res: PurchaseOrderVM) => {
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
            this.selectedPurchOrder = res
            this.poList = res.poLines
            this.dataSource = new MatTableDataSource(this.poList);
            this.proccessing = false
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
            this.proccessing = false
          }
        })
      } else {
        this.invtSvc.SavePurchaseOrder(this.selectedPurchOrder).subscribe({
          next: (res: PurchaseOrderVM) => {
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
