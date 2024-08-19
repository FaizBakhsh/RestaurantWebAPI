import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-category',
  templateUrl: './manage-category.component.html',
  styleUrls: ['./manage-category.component.css']
})
export class ManageCategoryComponent implements OnInit {
  isReadOnly: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Category: SettingsVM[] = [];
  selectedCategory: SettingsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['group', 'name', 'description', 'isActive', 'actions'];
  dataSource: any;
  dialogData;
  isDialog: boolean = false
  Groups: SettingsVM[]
  dialogref: any
  dialogRef: any
  constructor(
    private catSvc: CatalogService,
    private cdRef: ChangeDetectorRef,
  ) {
    this.selectedCategory = new SettingsVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Category)
    this.Refresh()
    this.GetCategory();
    this.GetGroup()
    this.selectedCategory.isActive = true
  }
  ngAfterContentChecked() {
    this.cdRef.detectChanges();
  }
  GetCategory() {
    var stng = new SettingsVM
    stng.clientId = +localStorage.getItem("RMSClientId")
    stng.enumTypeId = EnumTypeVM.ItemCategory
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Category = res;
        this.dataSource = new MatTableDataSource(this.Category);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetGroup() {
    var stng = new SettingsVM
    stng.isActive = true
    stng.clientId = +localStorage.getItem("RMSClientId")
    stng.enumTypeId = EnumTypeVM.ItemGroup
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Groups = res;
        console.warn(this.Groups)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteCategory(val: SettingsVM) {
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
            this.selectedCategory.parentId = val.parentId
            this.Reset();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetCategoryForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedCategory = new SettingsVM;
    this.selectedCategory.id = id
    this.selectedCategory.enumTypeId = EnumTypeVM.ItemCategory
    this.selectedCategory.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(this.selectedCategory).subscribe({
      next: (res: SettingsVM[]) => {
        this.Category = res;
        this.selectedCategory = this.Category[0]
        this.SearchbyGroup(this.selectedCategory.parentId)
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveCategory() {
    if (this.selectedCategory.parentId == 0 || this.selectedCategory.parentId == undefined)
      this.userForm.controls['parentId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedCategory.clientId = +localStorage.getItem("RMSClientId")
      this.selectedCategory.enumTypeId = EnumTypeVM.ItemCategory
      if (this.Edit)
        this.UpdateCategory()
      else {
        this.catSvc.SaveSettings(this.selectedCategory).subscribe({
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
  UpdateCategory() {
    this.catSvc.UpdateSettings(this.selectedCategory).subscribe({
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
    this.Category = []
    this.Add = true;
    this.Edit = false;
    this.selectedCategory = new SettingsVM
    this.GetCategory()
    this.selectedCategory.isActive = true
  }
  Reset() {
    this.Add = true;
    this.Edit = false;
    this.selectedCategory.description = null
    this.selectedCategory.keyCode = null
    this.selectedCategory.name = null
    this.SearchbyGroup(this.selectedCategory.parentId)
  }
  SearchbyGroup(id: number) {
    debugger
    var stng = new SettingsVM
    stng.parentId = id
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.Category = res;
        this.dataSource = new MatTableDataSource(res);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
}


