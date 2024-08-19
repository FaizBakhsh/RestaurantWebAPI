import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { RestaurantService } from './../../restaurant/restaurant.service';
import { BranchVM } from './../../restaurant/Models/BranchVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { IconSetService } from '@coreui/icons-angular';
import { MatSnackBar } from '@angular/material/snack-bar';
import { iconSubset } from 'src/app/icons/icon-subset';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { OrderSourceVM } from '../Models/OrderSourceVM';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-order-source',
  templateUrl: './manage-order-source.component.html',
  styleUrls: ['./manage-order-source.component.css']
})
export class ManageOrderSourceComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  source: OrderSourceVM[] | undefined;
  selectedSource: OrderSourceVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'priceIncreament', 'printInvoice', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSVC: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedSource = new OrderSourceVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.OrderSource)
    this.Add = true;
    this.Edit = false;
    this.selectedSource = new OrderSourceVM
    this.GetSource();
    this.selectedSource.isActive = true;
  }
  GetSource() {
    var source = new OrderSourceVM
    source.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchOrderSource(source).subscribe({
      next: (res: OrderSourceVM[]) => {
        this.source = res;
        this.dataSource = new MatTableDataSource(this.source);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteSource(id: number) {
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
        this.resSVC.DeleteOrderSource(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'source has been deleted.',
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
  GetSourceForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedSource = new OrderSourceVM;
    this.selectedSource.id = id
    this.selectedSource.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchOrderSource(this.selectedSource).subscribe({
      next: (res: OrderSourceVM[]) => {
        this.source = res;
        console.warn(this.source);
        this.selectedSource = this.source[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveSource() {
    debugger
    if (!this.userForm.invalid) {
      this.selectedSource.clientId = +localStorage.getItem("RMSClientId")
      this.resSVC.SaveOrderSource(this.selectedSource).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyAddMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateSource() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedSource.clientId = +localStorage.getItem("RMSClientId")
      this.resSVC.UpdateOrderSource(this.selectedSource).subscribe({
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
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  Refresh() {
    this.selectedSource = new OrderSourceVM
    this.Add = true;
    this.Edit = false;
    this.selectedSource.isActive = true;
  }
}
