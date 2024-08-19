import { Component, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { PurchaseOrderVM , PurchaseOrderLineVM} from '../Models/PurchaseOrder';
import { InventoryService } from '../inventory.service';
import { Router } from '@angular/router';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { MatSort } from '@angular/material/sort';
import { MatDialog } from '@angular/material/dialog';


@Component({
  selector: 'app-purchaseorderlist',
  templateUrl: './purchaseorderlist.component.html',
  styleUrls: ['./purchaseorderlist.component.css'],

  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})

export class PurchaseorderlistComponent implements OnInit{
  dataSource?:any
  selectedRowIndex = -1;
  selectedRow: PurchaseOrderVM
  Edit: boolean = true;
  isPosted: boolean = false
  innerDisplayedColumns: string[] = ['rawItemId', 'package', 'packageItems', 'totalItems','price', 'pricePerItem', 'totalAmount', 'description'];
  columnsToDisplay = ['expand', 'poDate', 'poNo', 'supplier', 'totalAmount', 'actions'];
  columnsToDisplayWithExpand = [...this.columnsToDisplay];
  expandedElement: any;
  @ViewChild('outerSort', { static: true }) sort: MatSort | undefined;
  @ViewChildren('innerSort') innerSort: QueryList<MatSort> | undefined;
  @ViewChildren('innerTables') innerTables: QueryList<MatTable<PurchaseOrderLineVM>> | undefined;
  PurchaseOrder: PurchaseOrderVM[] | undefined;
  constructor( 
    private route: Router,
    public dialog: MatDialog,
    private invtSvc:InventoryService,
    private catSvc : CatalogService,
    )
  {
    this.selectedRow = new PurchaseOrderVM;
  }
  ngOnInit(): void {
    this.GetPurchaseOrder();
   }
   highlight(row: PurchaseOrderVM) {
    debugger
    this.selectedRow = new PurchaseOrderVM
    this.selectedRowIndex = row.id;
    this.selectedRow = row
  }
   GetPurchaseOrder(){
    this.selectedRow = new PurchaseOrderVM;
    this.invtSvc.GetPurchaseOrder().subscribe({
      next: (res: PurchaseOrderVM[]) => {
        this.PurchaseOrder = res;
        this.dataSource = new MatTableDataSource(this.PurchaseOrder);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
   }
   DeletePurchaseOrder(id:number){
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
        this.invtSvc.DeletePurchaseOrder(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully deleted.',
              'success'
            )
            this.GetPurchaseOrder();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  EditPurchaseOrder(purchOrder:PurchaseOrderVM){
    this.route.navigate(['/inventory/purchaseOrder'], {
      queryParams: {
        id: purchOrder.id
      }
    });
  }
  Refresh() {
    this.selectedRowIndex = -1
    this.selectedRow = new PurchaseOrderVM

  }
}
