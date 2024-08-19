import { ChangeDetectorRef, Component, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSort } from '@angular/material/sort';
import { Router } from '@angular/router';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { PurchaseReturnLineVM, PurchaseReturnVM } from '../../Models/PurchaseReturn';
import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import { InventoryService } from '../../inventory.service';

@Component({
  selector: 'app-purchase-return-list',
  templateUrl: './purchase-return-list.component.html',
  styleUrls: ['./purchase-return-list.component.css'],

  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class PurchaseReturnListComponent implements OnInit {
  PurchaseReturn: PurchaseReturnVM[] | undefined;;
  selectedRowIndex = -1;
  selectedRow: PurchaseReturnVM
  Edit: boolean = true;
  isPosted: boolean = false
  innerDisplayedColumns: string[] = ['date', 'item', 'uom', 'totalItems', 'pricePerItem', 'totalAmt', 'returnQty'];
  dataSource: any;
  columnsToDisplay = ['expand', 'returnDate', 'branch', 'supplier', 'invNo', 'Action'];
  columnsToDisplayWithExpand = [...this.columnsToDisplay];
  expandedElement: any;
  @ViewChild('outerSort', { static: true }) sort: MatSort | undefined;
  @ViewChildren('innerSort') innerSort: QueryList<MatSort> | undefined;
  @ViewChildren('innerTables') innerTables: QueryList<MatTable<PurchaseReturnLineVM>> | undefined;
  constructor(
    private route: Router,
    public dialog: MatDialog,
    public inventorySvc: InventoryService,
    public catSvc: CatalogService,
    //  private _loc: Location,
  ) {
    this.selectedRow = new PurchaseReturnVM;
  }
  ngOnInit(): void {
    this.GetPurchaseReturn();
  }
  highlight(row: PurchaseReturnVM) {
    debugger
    this.selectedRow = new PurchaseReturnVM
    this.selectedRowIndex = row.id;
    this.selectedRow = row
  }
  GetPurchaseReturn() {
    this.selectedRow = new PurchaseReturnVM;
    this.inventorySvc.GetPurchaseReturn().subscribe({
      next: (res: PurchaseReturnVM[]) => {
        this.PurchaseReturn = res;
        this.dataSource = new MatTableDataSource(this.PurchaseReturn);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  EditPurchaseReturn(PurchaseReturn: PurchaseReturnVM) {
    this.route.navigate(['/inventory/purchaseReturn'], {
      queryParams: {
        id: PurchaseReturn.id
      }
    });
  }
  DeletePurchaseReturn(id: number) {
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
        this.inventorySvc.DeletePurchaseReturn(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully Deleted.',
              'success'
            )
            this.GetPurchaseReturn();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
            console.warn(e);
          }
        })
      }
    })
  }
  Refresh() {
    this.selectedRowIndex = -1
    this.selectedRow = new PurchaseReturnVM

  }
}



