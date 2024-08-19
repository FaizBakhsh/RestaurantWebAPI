import { Component, OnInit, ViewChild } from '@angular/core';
import { RestaurantService } from '../restaurant.service';
import { CatalogService } from '../../catalog/catalog.service';
import { SubItemsVM } from '../Models/SubItemsVM';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-sub-items',
  templateUrl: './manage-sub-items.component.html',
  styleUrls: ['./manage-sub-items.component.css']
})
export class ManageSubItemsComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  subItem: SubItemsVM[];
  selectedSubItem: SubItemsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSVC: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedSubItem = new SubItemsVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.SubItems)
    this.Add = true;
    this.Edit = false;
    this.selectedSubItem = new SubItemsVM
    this.GetSubItems();
    this.selectedSubItem.isActive = true
  }
  GetSubItems() {
    var subitem = new SubItemsVM
    subitem.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchSubItems(subitem).subscribe({
      next: (res: SubItemsVM[]) => {
        this.subItem = res;
        this.dataSource = new MatTableDataSource(this.subItem);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteSubItems(id: number) {
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
        this.resSVC.DeleteSubItems(id).subscribe({
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
  GetSubItemsForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedSubItem = new SubItemsVM;
    this.selectedSubItem.id = id
    this.selectedSubItem.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchSubItems(this.selectedSubItem).subscribe({
      next: (res: SubItemsVM[]) => {
        this.subItem = res;
        console.warn(this.subItem);
        this.selectedSubItem = this.subItem[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveSubItems() {
    if (!this.userForm.invalid) {
      var SubItem = new SubItemsVM
      SubItem.name = this.selectedSubItem.name.trim().toLowerCase()
      SubItem.clientId = +localStorage.getItem("RMSClientId")
      this.resSVC.SearchSubItems(SubItem).subscribe({
        next: (res: SubItemsVM[]) => {
          if (this.Edit)
            res = res.filter(x => x.id != this.selectedSubItem.id)
          if (res.length == 0) {
            this.selectedSubItem.clientId = +localStorage.getItem("RMSClientId")
            if (this.Edit)
              this.UpdateSubItems();
            else {
              this.resSVC.SaveSubItems(this.selectedSubItem).subscribe({
                next: (res) => {
                  this.ngOnInit();
                  this.Edit = false;
                  this.Add = true;
                  this.catSvc.SuccessMsgBar("SubItem Added", 6000)
                  window.scrollTo(0, 0)
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                }
              })
            }
          } else this.catSvc.ErrorMsgBar(" Already exist in the Items", 5000)
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },

      })
    } else
      this.catSvc.ErrorMsgBar("Please fill all required fields", 5000)
  }

  UpdateSubItems() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSVC.UpdateSubItems(this.selectedSubItem).subscribe({
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
    this.selectedSubItem = new SubItemsVM
    this.Add = true;
    this.Edit = false;
    this.selectedSubItem.isActive = true
  }
}


