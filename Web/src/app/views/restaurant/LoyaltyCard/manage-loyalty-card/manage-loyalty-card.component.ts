import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import Swal from 'sweetalert2';
import { LoyaltyCardVM } from '../../Models/LoyaltyCardVM';
import { RestaurantService } from '../../restaurant.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-loyalty-card',
  templateUrl: './manage-loyalty-card.component.html',
  styleUrls: ['./manage-loyalty-card.component.css']
})
export class ManageLoyaltyCardComponent implements OnInit {
  isReadOnly: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  LoyaltyCard: LoyaltyCardVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['cardNo', 'discountPercentage', 'name', 'pnoneNo', 'isActive', 'actions'];
  dataSource: any;
  selectedLoyaltyCard: LoyaltyCardVM
  constructor(
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedLoyaltyCard = new LoyaltyCardVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.LoyaltyCard)
    this.GetLoyaltyCard();
    this.Refresh()
    this.selectedLoyaltyCard.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetLoyaltyCard() {
    var card = new LoyaltyCardVM
    card.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchLoyaltyCard(card).subscribe({
      next: (res: LoyaltyCardVM[]) => {
        this.LoyaltyCard = res;
        this.dataSource = new MatTableDataSource(this.LoyaltyCard);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteLoyaltyCard(id: number) {
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
        this.resSvc.DeleteLoyaltyCard(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetLoyaltyCardForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedLoyaltyCard = new LoyaltyCardVM;
    this.selectedLoyaltyCard.id = id
    this.selectedLoyaltyCard.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchLoyaltyCard(this.selectedLoyaltyCard).subscribe({
      next: (res: LoyaltyCardVM[]) => {
        this.LoyaltyCard = res;
        console.warn(this.LoyaltyCard);
        this.selectedLoyaltyCard = this.LoyaltyCard[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveLoyaltyCard() {
    debugger
    this.validFields = true;
    if (!this.userForm.invalid) {
      var searchCardNo = this.LoyaltyCard?.find(x => x.cardNo == this.selectedLoyaltyCard.cardNo && x.id != this.selectedLoyaltyCard.id)
      if (searchCardNo == null) {
        this.selectedLoyaltyCard.clientId = +localStorage.getItem("RMSClientId")
        if (this.Edit)
          this.UpdateLoyaltyCard()
        else {
          this.resSvc.SaveLoyaltyCard(this.selectedLoyaltyCard).subscribe({
            next: (res) => {
              console.warn(res);
              this.resSvc.GetLoyaltyCard().subscribe((res: LoyaltyCardVM[]) => {
                this.LoyaltyCard = res;
                this.dataSource = new MatTableDataSource(this.LoyaltyCard);
                this.ngOnInit();
              });
              this.catSvc.SuccessfullyAddMsg()
            }, error: (e) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 5000)
              console.warn(e);
            }
          })
        }
      } else
        this.catSvc.ErrorMsgBar("This CardNo Already Exist Please try some else!", 5000)
    }
    else
      this.catSvc.ErrorMsgBar("Please fill all Required Fields", 5000)
  }
  UpdateLoyaltyCard() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.UpdateLoyaltyCard(this.selectedLoyaltyCard).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyUpdateMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  }
  Refresh() {
    this.selectedLoyaltyCard = new LoyaltyCardVM;
    this.Add = true;
    this.Edit = false;
    this.selectedLoyaltyCard.isActive = true;
  }
}

