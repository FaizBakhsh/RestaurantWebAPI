import { SupplierVM } from '../../../restaurant/Models/SupplierVM';
import { BranchVM } from '../../../restaurant/Models/BranchVM';
import { RestaurantService } from '../../../restaurant/restaurant.service';
import { InventoryService } from './../../inventory.service';
import { InventoryTransferVM } from '../../Models/InventoryTransfer';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
import { CatalogService } from '../../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { PurchaseReturnLineVM, PurchaseReturnVM } from '../../Models/PurchaseReturn';
import { ItemVM } from 'src/app/views/restaurant/Models/ItemVM';
import { ItemTypes } from 'src/app/views/restaurant/Models/Enums/ItemType';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import * as moment from 'moment';
@Component({
  selector: 'app-purchase-return',
  templateUrl: './purchase-return.component.html',
  styleUrls: ['./purchase-return.component.css']
})
export class PurchaseReturnComponent implements OnInit {
  lineAddMode: boolean = false
  lineUpdateMode: boolean = false;
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  purchaseReturnId!: number
  public date = new Date();
  Items?: ItemVM[]
  Branches?: BranchVM[]
  Suppliers?: SupplierVM[]
  prList: PurchaseReturnLineVM[] = []
  selectedPurchaseReturn: PurchaseReturnVM
  PurchaseReturn: PurchaseReturnVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  @ViewChild('PRDetailForm') prDetailForm!: NgForm
  selectedPRLine: PurchaseReturnLineVM
  displayedColumns: string[] = ['date', 'item', 'uom', 'totalItems', 'pricePerItem', 'totalAmt', 'returnQty', 'actions'];
  dataSource: any;
  constructor(
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    private _location: Location,
    private route: ActivatedRoute,
    private snack: MatSnackBar,) {
    this.selectedPurchaseReturn = new PurchaseReturnVM();
    this.selectedPRLine = new PurchaseReturnLineVM
  }
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.purchaseReturnId = params['id'];
    });
    if (this.purchaseReturnId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetPurchaseReturnForEdit();
    }
    this.Add = true;
    this.Edit = false;
    this.selectedPurchaseReturn = new PurchaseReturnVM
    this.GetPurchaseReturn();
    this.GetSuppliers();
    this.GetBranch()
    this.GetItems()
    this.selectedPurchaseReturn.isActive=true
  }
  OnSelectItem(item: ItemVM) {
    this.selectedPRLine.item = item.itemName
    this.selectedPRLine.uOMId = item.uomId
    this.selectedPRLine.uom = item.uom
  }
  AddLinetoList() {
    debugger
    if (this.selectedPRLine.itemId == undefined || this.selectedPRLine.itemId == 0)
      this.prDetailForm.form.controls['itemId'].setErrors({ 'incorrect': true })
    if (!this.prDetailForm.invalid) {
      this.selectedPRLine.date = moment(this.selectedPRLine.date).toDate()
      this.selectedPRLine.date = new Date(Date.UTC(this.selectedPRLine.date.getFullYear(), this.selectedPRLine.date.getMonth(), this.selectedPRLine.date.getDate()))

      this.selectedPRLine.totalAmt = this.selectedPRLine.totalItems * this.selectedPRLine.pricePerItem
      if (this.lineUpdateMode == true)
        this.prList = this.prList.filter(x => x != this.selectedPRLine)
      this.prList.push(this.selectedPRLine)
      this.dataSource = new MatTableDataSource(this.prList);
      console.warn(this.prList)
      this.selectedPRLine = new PurchaseReturnLineVM
      this.lineUpdateMode = false
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields", 6000)
  }
  RefreshLine() {
    this.selectedPRLine = new PurchaseReturnLineVM
    this.lineUpdateMode = false
  }
  GetItems() {
    var item = new ItemVM
    item.itemTypeId = ItemTypes.RawItem
    this.resSvc.SearchItem(item).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res;
        this.selectedPRLine.uom = undefined
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
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
  GetSuppliers() {
    this.resSvc.GetSupplier().subscribe({
      next: (res: SupplierVM[]) => {
        this.Suppliers = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetPurchaseReturn() {
    this.invtrySvc.GetPurchaseReturn().subscribe({
      next: (res: PurchaseReturnVM[]) => {
        this.PurchaseReturn = res;
        //  this.dataSource = new MatTableDataSource(this.PurchaseReturn);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetPurchaseReturnForEdit() {
    var pr = new PurchaseReturnVM;
    pr.id = this.purchaseReturnId
    this.invtrySvc.SearchPurchaseReturn(pr).subscribe({
      next: (res: PurchaseReturnVM[]) => {
        console.warn(res)
        this.PurchaseReturn = res;
        this.selectedPurchaseReturn = this.PurchaseReturn[0]
        console.warn(this.selectedPurchaseReturn)
        this.prList = []
        this.selectedPurchaseReturn.prLines?.forEach(element => {
          this.prList.push(element)
          console.warn(this.prList)
        });
        this.dataSource = new MatTableDataSource(this.selectedPurchaseReturn.prLines)
        console.warn(this.dataSource)
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedPRLine = new PurchaseReturnLineVM
    this.selectedPurchaseReturn = new PurchaseReturnVM;
    this.Add = true;
    this.Edit = false;
    this.prList = []
    this.lineUpdateMode = false
    this.dataSource = new MatTableDataSource(this.prList);
  }
  delete(val: PurchaseReturnLineVM) {
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
          var pr = new PurchaseReturnVM
          pr = this.selectedPurchaseReturn
          pr.prLines = []
          val.dBoperation = 3
          pr.prLines.push(val)
          this.invtrySvc.UpdatePurchaseReturn(pr).subscribe({
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
  DeleteLine(val: PurchaseReturnLineVM) {
    Swal.fire(
      'Deleted!',
      'Successfully Deleted.',
      'success'
    )
    this.prList = this.prList.filter(x => x != val)
    this.dataSource = new MatTableDataSource(this.prList);
  }
  edit(val: PurchaseReturnLineVM) {
    this.lineUpdateMode = true
    this.selectedPRLine = val
  }
  Submit() {
    if (this.selectedPurchaseReturn.branchId == undefined || this.selectedPurchaseReturn.branchId == 0)
      this.userForm.form.controls['branchId'].setErrors({ 'incorrect': true })
    if (this.selectedPurchaseReturn.supplierId == undefined || this.selectedPurchaseReturn.supplierId == 0)
      this.userForm.form.controls['supplierId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      if (this.prList.length > 0) {
        this.proccessing = true
        this.selectedPurchaseReturn.prLines = this.prList
        this.selectedPurchaseReturn.prLines.forEach(element => {
          if (element.id > 0)
            element.dBoperation = 2
          else
            element.dBoperation = 1
        });
        this.selectedPurchaseReturn.returnDate = moment(this.selectedPurchaseReturn.returnDate).toDate()
        this.selectedPurchaseReturn.returnDate = new Date(Date.UTC(this.selectedPurchaseReturn.returnDate.getFullYear(), this.selectedPurchaseReturn.returnDate.getMonth(), this.selectedPurchaseReturn.returnDate.getDate()))

        if (this.Edit == true) {
          this.invtrySvc.UpdatePurchaseReturn(this.selectedPurchaseReturn).subscribe({
            next: (res: PurchaseReturnVM) => {
              this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
              this.selectedPurchaseReturn = res
              this.prList = res.prLines
              this.dataSource = new MatTableDataSource(this.prList);
              this.proccessing = false
            }, error: (e: any) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 5000)
              console.warn(e);
              this.proccessing = false
            }
          })
        } else {
          this.invtrySvc.SavePurchaseReturn(this.selectedPurchaseReturn).subscribe({
            next: (res: PurchaseReturnVM) => {
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
    this._location.back();
  }
}



