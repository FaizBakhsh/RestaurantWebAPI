import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import { ChangeDetectorRef, Component, OnInit, Inject, ViewChild, Injector } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ManageAttributesComponent } from '../manage-attributes/manage-attributes.component';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';

@Component({
  selector: 'app-manage-attribute-values',
  templateUrl: './manage-attribute-values.component.html',
  styleUrls: ['./manage-attribute-values.component.css']
})
export class ManageAttributeValuesComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  AttributeValues: SettingsVM[] = [];
  selectedAttributeValues: SettingsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['attribute', 'name', 'keyCode', 'description', 'isActive', 'actions'];
  dataSource: any;
  dialogData;
  isDialog: boolean = false
  attributes: SettingsVM[]
  dialogref: any
  dialogRef: any
  constructor(
    private injector: Injector,
    private catSvc: CatalogService,
    private dialog: MatDialog,
    private cdRef: ChangeDetectorRef,
  ) {
    this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedAttributeValues = new SettingsVM();
  }
  ngOnInit(): void {
    //this.Refresh()
    this.GetAttributeValues();
    this.GetAttributes()
    if (this.dialogData != null) {
      this.isDialog = this.dialogData.isDialog;
      if (this.dialogData.attribId > 0) {
        this.selectedAttributeValues.parentId = this.dialogData.attribId
        this.SearchbyAtt(this.dialogData.attribId)
      }
    }
    this.selectedAttributeValues.isActive = true
  }
  ngAfterContentChecked() {
    this.cdRef.detectChanges();
  }
  GetAttributeValues() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.AttributeValues
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        console.warn(res)
        this.AttributeValues = res;
        this.dataSource = new MatTableDataSource(this.AttributeValues);
        console.warn(this.AttributeValues)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetAttributes() {
    var attrib = new SettingsVM
    attrib.isActive = true
    attrib.enumTypeId = EnumTypeVM.Attributes
    this.catSvc.SearchSettings(attrib).subscribe({
      next: (res: SettingsVM[]) => {
        this.attributes = res;
        this.selectedAttributeValues.parentId = this.attributes[0].id
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteAttributeValues(val: SettingsVM) {
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
        var stng = new SettingsVM
        stng.enumTypeId = EnumTypeVM.AttributeValues
        stng.clientId = +localStorage.getItem("RMSClientId")
        stng.id = val.id
        this.catSvc.deleteSettings(stng).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Successfuly Deleted.',
              'success'
            )
            this.selectedAttributeValues.parentId = val.parentId
            this.Reset();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetAttributeValuesForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedAttributeValues = new SettingsVM;
    this.selectedAttributeValues.id = id
    this.selectedAttributeValues.enumTypeId = EnumTypeVM.AttributeValues
    this.selectedAttributeValues.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(this.selectedAttributeValues).subscribe({
      next: (res: SettingsVM[]) => {
        this.AttributeValues = res;
        this.selectedAttributeValues = this.AttributeValues[0]
        this.SearchbyAtt(this.selectedAttributeValues.parentId)
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveAttributeValues() {
    if (this.selectedAttributeValues.parentId == 0 || this.selectedAttributeValues.parentId == undefined)
      this.userForm.controls['parentId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedAttributeValues.enumTypeId = EnumTypeVM.AttributeValues
      var att = new SettingsVM
      att.keyCode = this.selectedAttributeValues.keyCode
      att.clientId = +localStorage.getItem("RMSClientId")
      att.enumTypeId = EnumTypeVM.AttributeValues
      this.catSvc.SearchSettings(att).subscribe({
        next: (res: SettingsVM[]) => {
          if (this.Edit)
            res = res.filter(x => x.id != this.selectedAttributeValues.id)
          if (res.length > 0)
            this.catSvc.ErrorMsgBar("KeyCode  '" + this.selectedAttributeValues.keyCode + "' already exist", 5000)
          else {
            this.selectedAttributeValues.clientId = +localStorage.getItem("RMSClientId")
            if (this.Edit)
              this.UpdateAttributeValues()
            else {
              this.catSvc.SaveSettings(this.selectedAttributeValues).subscribe({
                next: (res) => {
                  this.catSvc.SuccessfullyAddMsg()
                  this.Reset();
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                  console.warn(e);
                }
              })
            }
          }
        }, error: (err) => {

        },
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateAttributeValues() {
    this.catSvc.UpdateSettings(this.selectedAttributeValues).subscribe({
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
    this.AttributeValues = []
    this.Add = true;
    this.Edit = false;
    this.selectedAttributeValues = new SettingsVM
    this.GetAttributeValues()
    this.selectedAttributeValues.isActive = true
  }
  Reset() {
    this.Add = true;
    this.Edit = false;
    this.selectedAttributeValues.description = null
    this.selectedAttributeValues.keyCode = null
    this.selectedAttributeValues.name = null
    this.SearchbyAtt(this.selectedAttributeValues.parentId)
  }
  AttributeDialog() {
    this.dialogRef = this.dialog.open(ManageAttributesComponent, {
      width: '1200px', height: '590px'
      , data: {}
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        this.GetAttributes()
      });
  }
  SearchbyAtt(id: number) {
    debugger
    var attVal = new SettingsVM
    attVal.parentId = id
    attVal.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(attVal).subscribe({
      next: (res: SettingsVM[]) => {
        this.AttributeValues = res;
        this.dataSource = new MatTableDataSource(res);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  TextChangeEvent() {
    this.selectedAttributeValues.keyCode = this.selectedAttributeValues.keyCode.replaceAll(' ', '_')
  }
}

