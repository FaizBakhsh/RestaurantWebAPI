import { ChangeDetectorRef, Component, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSort } from '@angular/material/sort';
import { Router } from '@angular/router';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { RFQLineVM, RFQVM } from '../../Models/RfqVM';
import { InventoryService } from '../../inventory.service';

@Component({
  selector: 'app-rfq-list',
  templateUrl: './rfq-list.component.html',
  styleUrls: ['./rfq-list.component.css'],

  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class RfqListComponent implements OnInit {
  RFQ: RFQVM[] = [];;
  selectedRowIndex = -1;
  selectedRow: RFQVM
  Edit: boolean = true;
  isPosted: boolean = false
  innerDisplayedColumns: string[] = ['item', 'type', 'group', 'category'];
  dataSource: any;
  columnsToDisplay = ['expand', 'title', 'requestNoteNo', 'status', 'rfqValidity', 'deliveryDate', 'isReference', 'description', 'Action'];
  columnsToDisplayWithExpand = [...this.columnsToDisplay];
  expandedElement: any;
  @ViewChild('outerSort', { static: true }) sort: MatSort | undefined;
  @ViewChildren('innerSort') innerSort: QueryList<MatSort> | undefined;
  @ViewChildren('innerTables') innerTables: QueryList<MatTable<RFQLineVM>> | undefined;
  constructor(
    private route: Router,
    public dialog: MatDialog,
    public inventorySvc: InventoryService,
    public catSvc: CatalogService,
    //  private _loc: Location,
  ) {
    this.selectedRow = new RFQVM;
  }
  ngOnInit(): void {
    this.GetRFQ();
  }
  highlight(row: RFQVM) {
    debugger
    this.selectedRow = new RFQVM
    this.selectedRowIndex = row.id;
    this.selectedRow = row
  }
  GetRFQ() {
    var RFQ = new RFQVM;
    RFQ.clientId = +localStorage.getItem("RMSClientId");
    this.inventorySvc.SearchRFQ(RFQ).subscribe({
      next: (res: RFQVM[]) => {
        this.RFQ = res;
        this.dataSource = new MatTableDataSource(this.RFQ);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  EditRFQ(RFQ: RFQVM) {
    this.route.navigate(['/inventory/RFQ'], {
      queryParams: {
        id: RFQ.id
      }
    });
  }
  DeleteRFQ(id: number) {
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
        this.inventorySvc.DeleteRFQ(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully Deleted.',
              'success'
            )
            this.GetRFQ();
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
    this.selectedRow = new RFQVM

  }
}



