import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from '../catalog.service';
import { NotificationVM } from '../Models/NotificationVM';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-mail-configuration',
  templateUrl: './mail-configuration.component.html',
  styleUrls: ['./mail-configuration.component.css']
})
export class MailConfigurationComponent implements OnInit {
  dialogTitle: string
  isLoading: boolean = false
  dialogref: any
  dialogData: any
  selectedMail: NotificationVM
  @ViewChild('emailForm', { static: true }) emailForm!: NgForm;
  constructor(
    private injector: Injector,
    private catSvc: CatalogService
  ) {
    this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedMail = new NotificationVM
  }
  ngOnInit(): void {
    if (this.dialogData.dialogTitle)
      this.dialogTitle = this.dialogData.dialogTitle
    if (this.dialogData.mailData)
      this.selectedMail = this.dialogData.mailData
  }
  sendMail() {

    if (!this.emailForm.invalid) {
      this.isLoading = true
      this.catSvc.sendMailwithPdf(this.selectedMail).subscribe({
        next: () => {
          this.catSvc.SuccessMsgBar("Success! Your request has been processed.", 4000)
          this.dialogref.close()
          this.isLoading = false
        }, error: (e) => {
          console.warn(e)
          this.isLoading = false
          this.catSvc.ErrorMsgBar("Error Occurred while sending mail", 4000)
        }
      });
    }
  }
}
