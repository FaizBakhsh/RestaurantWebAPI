import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-sub-category',
  templateUrl: './manage-sub-category.component.html',
  styleUrls: ['./manage-sub-category.component.css']
})
export class ManageSubCategoryComponent implements OnInit {
  isReadOnly: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  SubCategory: SettingsVM[] = [];
  selectedSubCategory: SettingsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Category', 'name', 'description', 'isActive', 'actions'];
  dataSource: any;
  Categories: SettingsVM[]
  constructor(
    private catSvc: CatalogService,
    private cdRef: ChangeDetectorRef,
  ) {
    this.selectedSubCategory = new SettingsVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.SubCategory)
    this.Refresh()
    this.GetSubCategory();
    this.GetCategory()
    this.selectedSubCategory.isActive = true
  }
  ngAfterContentChecked() {
    this.cdRef.detectChanges();
  }
  GetSubCategory() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.ItemSubCategory
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.SubCategory = res;
        this.dataSource = new MatTableDataSource(this.SubCategory);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetCategory() {
    var stng = new SettingsVM
    stng.isActive = true
    stng.enumTypeId = EnumTypeVM.ItemCategory
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Categories = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteSubCategory(val: SettingsVM) {
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
        this.catSvc.DeleteSettings(val.id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Successfuly Deleted.',
              'success'
            )
            this.selectedSubCategory.parentId = val.parentId
            this.Reset();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetSubCategoryForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedSubCategory = new SettingsVM;
    this.selectedSubCategory.id = id
    this.selectedSubCategory.enumTypeId = EnumTypeVM.ItemSubCategory
    this.selectedSubCategory.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(this.selectedSubCategory).subscribe({
      next: (res: SettingsVM[]) => {
        this.SubCategory = res;
        this.selectedSubCategory = this.SubCategory[0]
        this.SearchbyCategory(this.selectedSubCategory.parentId)
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveSubCategory() {
    if (this.selectedSubCategory.parentId == 0 || this.selectedSubCategory.parentId == undefined)
      this.userForm.controls['parentId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedSubCategory.clientId = +localStorage.getItem("RMSClientId")
      this.selectedSubCategory.enumTypeId = EnumTypeVM.ItemSubCategory
      if (this.Edit)
        this.UpdateSubCategory()
      else {
        this.catSvc.SaveSettings(this.selectedSubCategory).subscribe({
          next: (res) => {
            this.catSvc.SuccessfullyAddMsg()
            this.Reset();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateSubCategory() {
    this.catSvc.UpdateSettings(this.selectedSubCategory).subscribe({
      next: (res) => {
        this.catSvc.SuccessfullyUpdateMsg()
        this.Reset();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.SubCategory = []
    this.Add = true;
    this.Edit = false;
    this.selectedSubCategory = new SettingsVM
    this.GetSubCategory()
    this.selectedSubCategory.isActive = true
  }
  Reset() {
    this.Add = true;
    this.Edit = false;
    this.selectedSubCategory.description = null
    this.selectedSubCategory.keyCode = null
    this.selectedSubCategory.name = null
    this.SearchbyCategory(this.selectedSubCategory.parentId)
  }
  SearchbyCategory(id: number) {
    debugger
    var stng = new SettingsVM
    stng.parentId = id
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.SubCategory = res;
        this.dataSource = new MatTableDataSource(res);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
}



