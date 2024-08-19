import { Component, OnInit } from '@angular/core';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { CatalogService } from '../../catalog/catalog.service';
import { VoucherDetailsVM } from '../Models/VoucherVM';
import { AccountService } from '../account.service';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-general-ledger',
  templateUrl: './general-ledger.component.html',
  styleUrls: ['./general-ledger.component.css']
})
export class GeneralLedgerComponent implements OnInit {
  curDate = new Date
  accounts: SettingsVM[]
  vchDetail: VoucherDetailsVM
  dataSource: any
  vchDetails: VoucherDetailsVM[]
  displayedColumns: String[] = ['date', 'narration', 'debit', 'credit', 'balance']
  constructor(private catSvc: CatalogService,
    private accSvc: AccountService) {
    this.vchDetail = new VoucherDetailsVM
  }
  ngOnInit(): void {
    this.vchDetail = new VoucherDetailsVM
    this.GetAccounts();
  }
  GetAccounts() {
    var stng = new SettingsVM
    stng.levelId = EnumTypeVM.Level5
    stng.isActive = true
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.accounts = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  getVchLines(acId) {
    var line = new VoucherDetailsVM
    line.coaId = acId
    this.accSvc.SearchVchDetail(line).subscribe({
      next: (res: VoucherDetailsVM[]) => {
        this.vchDetails = res
        this.dataSource = new MatTableDataSource(res)
      }, error: (e) => {
        console.warn(e)
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
      }
    })
  }
  GetDebitTotal() {
    return this.vchDetails?.map(t => t.vchDebitAmt).reduce((acc, value) => acc + value, 0);
  }
  GetCreditTotal() {
    return this.vchDetails?.map(t => t.vchCreditAmt).reduce((acc, value) => acc + value, 0);
  }
  GetBalanceTotal() {
    // return this.vchDetails?.map(t => t.debit).reduce((acc, value) => acc + value, 0);
  }
}
