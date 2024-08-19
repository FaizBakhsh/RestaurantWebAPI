
import { AfterViewInit, ChangeDetectorRef, Component, Injector, OnInit, ViewChild } from '@angular/core';
import { AppConstants } from 'src/app/app.constants';
import { NgForm } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { FiscalYearVM } from '../../Models/FiscalYearVM';
import { AccountService } from '../../account.service';


@Component({
  selector: 'app-managefiscalyear',
  templateUrl: './managefiscalyear.component.html',
  styleUrls: ['./managefiscalyear.component.css']
})
export class ManagefiscalyearComponent {

  @ViewChild('FiscalYearForm', { static: true }) FiscalYearForm!: NgForm;
  AddMode: boolean = true;
  EditMode: boolean = false;
  value: FiscalYearVM
  dialogRefe: any;
  dialogData: any;
  selectedFiscalYear: FiscalYearVM
  isLoading: boolean;
  fisy: FiscalYearVM[]
  constructor(
    private accSvc: AccountService,
    private injector: Injector,
    public catSvc: CatalogService) {
    this.selectedFiscalYear = new FiscalYearVM
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    this.Refresh()
    if (this.dialogData)
      if (this.dialogData.id != undefined) {
        debugger
        this.selectedFiscalYear.id = this.dialogData.id
        this.EditMode = true
        this.AddMode = false
        this.GetFiscalYearById()
      }
    this.selectedFiscalYear.isActive = true;
  }
  GetFiscalYearById() {
    debugger
    var fisy = new FiscalYearVM()
    fisy.id = this.selectedFiscalYear.id
    fisy.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.isLoading = true
    this.accSvc.SearchFiscalYear(fisy).subscribe({
      next: (value: FiscalYearVM[]) => {
        this.catSvc.isLoading = false
        this.selectedFiscalYear = value[0]
      }, error: (err) => {
        this.catSvc.isLoading = false
        console.warn(err);
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  SaveFiscalYear() {

    if (!this.FiscalYearForm.invalid) {
      this.catSvc.isLoading = true
      this.selectedFiscalYear.clientId = +localStorage.getItem("RMSClientId")
      if (this.selectedFiscalYear.id > 0)
        this.UpdateFiscalYear()
      else {
        this.accSvc.SaveFiscalYear(this.selectedFiscalYear).subscribe({
          next: (result) => {
            this.catSvc.isLoading = false
            result.resultMessages.forEach(element => {
              if (element.messageType != AppConstants.ERROR_MESSAGE_TYPE) {
                this.catSvc.SuccessMsgBar(element.message)
                this.ngOnInit();
              }
              else
                this.catSvc.ErrorMsgBar(element.message)
            });
          }, error: (e) => {
            this.catSvc.isLoading = false
            this.catSvc.ErrorMsgBar()
            console.warn(e);
          }
        })
      }
    }
  }
  UpdateFiscalYear() {
    this.accSvc.UpdateFiscalYear(this.selectedFiscalYear).subscribe({
      next: (result: FiscalYearVM) => {
        this.catSvc.isLoading = false
        result.resultMessages.forEach(element => {
          if (element.messageType != AppConstants.ERROR_MESSAGE_TYPE) {
            this.catSvc.SuccessMsgBar(element.message)
            this.ngOnInit();
          }
          else
            this.catSvc.ErrorMsgBar(element.message)
        });
      }, error: (e) => {
        this.catSvc.isLoading = false
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.AddMode = true;
    this.EditMode = false;
    this.selectedFiscalYear = new FiscalYearVM
  }

}

//

