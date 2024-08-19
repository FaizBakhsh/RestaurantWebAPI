import { AfterViewInit, ChangeDetectorRef, Component, Injector, OnInit, ViewChild } from '@angular/core';
import { AppConstants } from 'src/app/app.constants';
import { NgForm } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { FiscalYearVM } from '../Models/FiscalYearVM';
import { AccountService } from '../../account/account.service';
import { MatTableDataSource } from '@angular/material/table';


@Component({
  selector: 'app-fiscalyears',
  templateUrl: './fiscalyears.component.html',
  styleUrls: ['./fiscalyears.component.css']
})
export class FiscalyearsComponent implements OnInit {

  @ViewChild('FiscalYearForm', { static: true }) FiscalYearForm!: NgForm;
  value: FiscalYearVM
  isLoading: boolean;
  FiscalYears: FiscalYearVM[]
  dialogRefe: MatDialogRef<any, any>;
  dialogData: any;
  dataSource: any
  selectedYear: FiscalYearVM
  constructor(
    private accSvc: AccountService,
    private injector: Injector,
    private catSvc: CatalogService) {
    this.selectedYear = new FiscalYearVM
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    this.selectedYear.id = +localStorage.getItem("FiscalYearCodeId")
    this.GetFiscalYear()
  }
  GetFiscalYear() {
    this.isLoading = true
    var FiscalYear = new FiscalYearVM
    FiscalYear.clientId = +localStorage.getItem("RMSClientId")
    this.accSvc.SearchFiscalYear(FiscalYear).subscribe({
      next: (res: FiscalYearVM[]) => {
        this.FiscalYears = res
        this.dataSource = new MatTableDataSource(res)
        this.isLoading = false
      }, error: (e) => {
        console.warn(e)
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
      }
    })
  }
  submit() {
    if (!(this.selectedYear.id > 0))
      this.catSvc.ErrorMsgBar("Please Select a Year ")
    else {
      localStorage.setItem('FiscalYearCodeId', this.selectedYear.id.toString())
      this.dialogRefe.close()
    }
  }
}


