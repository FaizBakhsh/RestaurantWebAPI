import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { RestaurantService } from '../../restaurant.service';
import { Observable, Subject } from 'rxjs';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';

@Component({
  selector: 'app-manage-attributes',
  templateUrl: './manage-attributes.component.html',
  styleUrls: ['./manage-attributes.component.css']
})
export class ManageAttributesComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  selectedAttributes: SettingsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'description', 'actions'];
  dataSource: any;
  attributes: SettingsVM[]
  constructor(
    public dialogRef: MatDialogRef<ManageAttributesComponent>,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedAttributes = new SettingsVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedAttributes = new SettingsVM
    this.GetAttributes();
    this.GetAttributes()
  }
  GetAttributes() {
    var stng= new SettingsVM
    stng.enumTypeId=EnumTypeVM.Attributes
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.attributes = res;
        this.dataSource = new MatTableDataSource(this.attributes);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteAttributes(id: number) {
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
        this.resSvc.DeleteAttributes(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Successfuly Deleted.',
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
  GetAttributesForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedAttributes = new SettingsVM;
    this.selectedAttributes.id = id
    this.selectedAttributes.enumTypeId=EnumTypeVM.Attributes
    console.warn(this.selectedAttributes);
    this.catSvc.SearchSettings(this.selectedAttributes).subscribe({
      next: (res: SettingsVM[]) => {
        this.attributes = res;
        this.selectedAttributes = this.attributes[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveAttributes() {
    if (!this.userForm.invalid) {
      var relVal = this.IsUniqueAttribute(this.selectedAttributes.name).subscribe((res) => {
        if (res == true) {
          if (this.Edit)
            this.UpdateAttributes()
          else {
            this.catSvc.SaveSettings(this.selectedAttributes).subscribe({
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
          }
        }
        else {
          this.catSvc.ErrorMsgBar("Attribute with this name alreday exists", 5000)
        }
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateAttributes() {
    this.catSvc.UpdateSettings(this.selectedAttributes).subscribe({
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
  Refresh() {
    this.selectedAttributes = new SettingsVM
    this.Add = true;
    this.Edit = false;
  }
  IsUniqueAttribute(name: string): Observable<boolean> {
    var att = new SettingsVM
    att.name = name
    att.enumTypeId=EnumTypeVM.Attributes
    var subject = new Subject<boolean>();
    this.catSvc.SearchSettings(att)
      .subscribe({
        next: (value: SettingsVM[]) => {
          if (this.Edit)
            value = value.filter(x => x.id != this.selectedAttributes.id)
          if (value.length > 0)
            subject.next(false);
          else
            subject.next(true);
        }, error: (err) => {
          return false
        }
      })
    return subject.asObservable();
  }
}

