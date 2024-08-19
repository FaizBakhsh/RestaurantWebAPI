import { ChangeDetectorRef, Component, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSort } from '@angular/material/sort';
import { Router } from '@angular/router';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { RNLineVM, RNVM } from '../../Models/RNVM';
import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import { InventoryService } from '../../inventory.service';

@Component({
  selector: 'app-rn-list',
  templateUrl: './rn-list.component.html',
  styleUrls: ['./rn-list.component.css'],

  animations: [  
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class RnListComponent  implements OnInit {
  RN: RNVM[] | undefined;;
  selectedRowIndex = -1;
  selectedRow: RNVM
  Edit: boolean = true;
  isPosted: boolean = false
  innerDisplayedColumns: string[] = [ 'item', 'requestedQty', 'uom'];
  dataSource: any;
  columnsToDisplay = ['expand', 'title','requesterType', 'requesterId','type', 'category','status', 'requiredBefore', 'reason', 'description', 'Action'];
  columnsToDisplayWithExpand = [...this.columnsToDisplay];
  expandedElement: any;
  @ViewChild('outerSort', { static: true }) sort: MatSort | undefined;
  @ViewChildren('innerSort') innerSort: QueryList<MatSort> | undefined;
  @ViewChildren('innerTables') innerTables: QueryList<MatTable<RNLineVM>> | undefined;
  constructor(
    private route: Router,
    public dialog: MatDialog,
    public inventorySvc: InventoryService,
    public catSvc: CatalogService,
    //  private _loc: Location,
  ) {
    this.selectedRow = new RNVM;
  }
  ngOnInit(): void {
    this.GetRN();
  }
  highlight(row: RNVM) {
    debugger
    this.selectedRow = new RNVM
    this.selectedRowIndex = row.id;
    this.selectedRow = row
  }
  GetRN() {
   var rn = new RNVM;
   rn.clientId = +localStorage.getItem("RMSClientId");
    this.inventorySvc.SearchRN(rn ).subscribe({
      next: (res: RNVM[]) => {
        this.RN = res;
        this.dataSource = new MatTableDataSource(this.RN);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  EditRN(RN: RNVM) {
    this.route.navigate(['/inventory/RN'], {
      queryParams: {
        id: RN.id
      }
    });
  }
  DeleteRN(id: number) {
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
        this.inventorySvc.DeleteRN(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully Deleted.',
              'success'
            )
            this.GetRN();
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
    this.selectedRow = new RNVM

  }
}



