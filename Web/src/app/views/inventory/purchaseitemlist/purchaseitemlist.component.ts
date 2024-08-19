import { Component, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { Router } from '@angular/router';
import { InventoryService } from '../inventory.service';
import { PurchaseItemsVM } from '../Models/PurchaseItem';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { CatalogService } from '../../catalog/catalog.service';
import Swal from 'sweetalert2';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { MatSort } from '@angular/material/sort';
import { PurchaseOrderLineVM, PurchaseOrderVM } from '../Models/PurchaseOrder';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-purchaseitemlist',
  templateUrl: './purchaseitemlist.component.html',
  styleUrls: ['./purchaseitemlist.component.css'],

  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class PurchaseitemlistComponent implements OnInit {
  selectedRowIndex = -1;
  selectedRow: PurchaseItemsVM
  Edit: boolean = true;
  isPosted: boolean = false
  innerDisplayedColumns: string[] = ['rawItemId', 'package', 'packageItems', 'totalItems','price', 'pricePerItem', 'totalAmount','branchId', 'description','expiry'];
  columnsToDisplay = ['expand', 'date', 'poNo', 'supplier', 'totalAmount', 'actions'];
  columnsToDisplayWithExpand = [...this.columnsToDisplay];
  expandedElement: any;
  @ViewChild('outerSort', { static: true }) sort: MatSort | undefined;
  @ViewChildren('innerSort') innerSort: QueryList<MatSort> | undefined;
  @ViewChildren('innerTables') innerTables: QueryList<MatTable<PurchaseOrderLineVM>> | undefined;
  dataSource?:any;
  displayedColumns:string[] = ['date','grn','branch','store','supplier','group','item','itemsPerPkg','noOfPkg','totalQty','pricePerPkg','totalAmount','pricePerItem','purchaseTypes','invoiceNo','poNo','description','ttlAmount','expiryDate','actions']
  PurchaseItem: PurchaseItemsVM[] | undefined;
  constructor( 
    private route: Router,
    public dialog: MatDialog,
    private invtSvc:InventoryService,
    private catSvc : CatalogService,
 )
  {
   this.selectedRow = new PurchaseItemsVM
  }
  ngOnInit(): void {
   this.GetPurchaseItem();
  }
  highlight(row: PurchaseItemsVM) {
    debugger
    this.selectedRow = new PurchaseItemsVM
    this.selectedRowIndex = row.id;
    this.selectedRow = row
  }
  GetPurchaseItem(){
    this.selectedRow = new PurchaseItemsVM;
    this.invtSvc.GetPurchaseItem().subscribe({
      next: (res: PurchaseItemsVM[]) => {
        this.PurchaseItem = res;
        this.dataSource = new MatTableDataSource(this.PurchaseItem);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
   }
   DeletePurchaseItem(id:number){
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
        this.invtSvc.DeletePurchaseItem(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully deleted.',
              'success'
            )
            this.GetPurchaseItem();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  EditPurchaseItem(purchItem:PurchaseItemsVM){
    this.route.navigate(['/inventory/purchaseitem'], {
      queryParams: {
        id: purchItem.id
      }
    });
  }
  Refresh() {
    this.selectedRowIndex = -1
    this.selectedRow = new PurchaseItemsVM

  }
}
