import { VoucherDetailsVM } from './../../Models/VoucherVM';
import { Statuses } from './../../Models/Enums/Statuses';
import { ChangeDetectorRef, Component, NgZone, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { VoucherVM } from '../../Models/VoucherVM';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { MatCheckboxChange } from '@angular/material/checkbox';
import { ThisReceiver } from '@angular/compiler';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { MatSort } from '@angular/material/sort';
import { AccountService } from '../../account.service';
import { NotificationVM } from 'src/app/views/catalog/Models/NotificationVM';
import { MailConfigurationComponent } from 'src/app/views/catalog/mail-configuration/mail-configuration.component';
import { AppConstants } from 'src/app/app.constants';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';
import { MatPaginator } from '@angular/material/paginator';
import { tap } from 'rxjs';

@Component({
  selector: 'app-voucher-list',
  templateUrl: './voucher-list.component.html',
  styleUrls: ['./voucher-list.component.css'],

  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class VoucherListComponent implements OnInit {
  Voucher: VoucherVM[] | undefined;;
  isLoading: boolean = false
  selectedRowIndex = -1;
  selectedRow: VoucherVM
  UnPosted: number
  Edit: boolean = true;
  isPosted: boolean = false
  // displayedColumns: string[] = ['expand', 'date', 'vchNo', 'status', 'vendor', 'salesman', 'invNo', 'godown', 'docNo', 'docDate', 'isPosted', 'Action'];
  innerDisplayedColumns: string[] = ['coa', 'coaId', 'debit', 'credit', 'desc'];
  dataSource: MatTableDataSource<VoucherVM>;
  columnsToDisplay = ['expand', 'date', 'vchKey', 'vchType', 'status', 'isPosted', 'active', 'vchNarration', 'post', 'Action'];
  style = "background-image: linear-gradient(to bottom, rgb(2, 33, 58), rgb(7, 95, 122));color:white;font-weight:normal "
  columnsToDisplayWithExpand = [...this.columnsToDisplay];
  private dialogRef?: MatDialogRef<MailConfigurationComponent>;
  expandedElement: any;
  isActive: boolean
  @ViewChild('outerSort', { static: true }) sort: MatSort | undefined;
  @ViewChildren('innerSort') innerSort: QueryList<MatSort> | undefined;
  @ViewChildren('innerTables') innerTables: QueryList<MatTable<VoucherDetailsVM>> | undefined;
  isReadOnly: boolean = false
  @ViewChild(MatPaginator) paginator: MatPaginator;
  constructor(
    private route: Router,
    public dialog: MatDialog,
    public accSvc: AccountService,
    public catSvc: CatalogService,
    private cdref: ChangeDetectorRef,
    //  private _loc: Location,
  ) {
    this.selectedRow = new VoucherVM;
    this.UnPosted = Statuses.UnPosted
  }
  ngOnInit(): void {
    this.catSvc.totalRecords = AppConstants.DEFAULT_TOTAL_RECORD;
    this.catSvc.defaultPageSize = AppConstants.DEFAULT_PAGE_SIZE;
    this.catSvc.pageSizes = AppConstants.PAGE_SIZE_OPTIONS;
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Vouchers)
    //this.GetVoucher();
    // this.selectedRow.statusId = Statuses.UnPosted
  }
  ngAfterViewInit() {
    debugger
    this.dataSource = new MatTableDataSource<VoucherVM>([]);
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
    this.paginator.page
      .pipe(
        tap(() => this.GetVoucher())
      )
      .subscribe();
    this.GetVoucher();
    this.cdref.detectChanges();
  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
    this.cdref.markForCheck();
  }
  highlight(row: VoucherVM) {
    // window.scrollTo(0, 0)
    this.selectedRow = new VoucherVM
    this.selectedRowIndex = row.id;
    this.selectedRow = row

  }
  Activate(row: VoucherVM) {
    row.clientId = +localStorage.getItem("RMSClientId")
    this.accSvc.ActivateVoucher(row).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("successfully Updated!", 5000)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
      },
    })
  }
  Check(row: VoucherVM) {
    if (row.isActive == true)
      this.Activate(row)
    else this.DeActivate(row)
  }
  DeActivate(row: VoucherVM) {
    row.clientId = +localStorage.getItem("RMSClientId")
    this.accSvc.DeActivateVoucher(row).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("successfully Updated!", 5000)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
      },
    })
  }
  GetVoucher() {
    this.selectedRow = new VoucherVM;
    var vch = new VoucherVM
    vch.clientId = +localStorage.getItem("RMSClientId")
    vch.pageNo = this.paginator.pageIndex + 1;;
    vch.pageSize = this.paginator.pageSize;
    this.accSvc.SearchVoucher(vch).subscribe({
      next: (res: VoucherVM[]) => {
        this.Voucher = res;
        this.dataSource = new MatTableDataSource(this.Voucher);
        this.catSvc.totalRecords = res[0].totalRecords
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  EditVoucher(cust: VoucherVM) {
    this.route.navigate(['/account/voucher'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteVoucher(id: number) {
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
        this.accSvc.DeleteVoucher(id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully Deleted.',
              'success'
            )
            this.GetVoucher();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
            console.warn(e);
          }
        })
      }
    })
  }
  IsPostedCheck(event: MatCheckboxChange, voucher: VoucherVM): void {
    debugger
    Swal.fire({
      title: 'Are you sure?',
      text: "You want to post  this voucher",
      icon: 'info',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, post it!'
    }).then((result) => {
      if (result.value) {
        voucher.isPosted = true
        voucher.statusId = Statuses.Posted
        this.UpdateVoucher(voucher)
      } else {
        this.GetVoucher()
      }
    })
  }
  UpdateVoucher(voucher: VoucherVM) {
    voucher.clientId = +localStorage.getItem("RMSClientId")
    this.accSvc.UpdateVoucher(voucher).subscribe({
      next: (data: any) => {
        Swal.fire(
          'Successfully Posted.',
          'success'
        )
        this.GetVoucher();
        this.Refresh();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedRowIndex = -1
    this.selectedRow = new VoucherVM
    this.selectedRow.isPosted = false
    this.selectedRow.statusId = Statuses.Draft
  }
  openPdf(vch: VoucherVM) {
    this.isLoading = true
    this.accSvc.GetPdf(vch).subscribe({
      next: (response) => {
        console.warn(response)
        const blob = new Blob([response.body], { type: 'application/pdf' });
        const url = URL.createObjectURL(blob);
        window.open(url);
        this.isLoading = false
      }, error: (err) => {
        this.isLoading = false
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(err)
      }
    }
    )
  }
  sendMail(vch: VoucherVM) {
    this.accSvc.GetPdf(vch).subscribe(response => {
      const blob = new Blob([response.body], { type: 'application/pdf' });
      var mail = new NotificationVM
      mail.senderMail = "bintameer212@gmail.com"
      mail.mailSubject = vch.vchNo
      mail.attachment = blob
      mail.mailBody = "Voucher PDF"
      this.dialogRef = this.dialog.open(MailConfigurationComponent, {
        disableClose: true, panelClass: 'calendar-form-dialog', width: '500px', height: '270px'
        , data: { dialogTitle: "Mail Voucher", mailData: mail }
      });
      this.dialogRef.afterClosed()
        .subscribe((res) => {

        });
    });
  }
  Back() {
  }
  GetDebitTotal() {
    return this.selectedRow.voucherDetails?.map(t => t.vchDebitAmt).reduce((acc, value) => acc + value, 0);
  }
  GetCreditTotal() {
    return this.selectedRow.voucherDetails?.map(t => t.vchCreditAmt).reduce((acc, value) => acc + value, 0);
  }
  // GetQtyTotal() {
  //   return this.selectedRow.voucherDetails?.map(t => t.qty).reduce((acc, value) => acc + value, 0);
  // }
}



