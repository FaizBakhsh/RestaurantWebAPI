import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, NgForm, FormBuilder } from '@angular/forms';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { CatalogService } from '../../catalog/catalog.service';
import { RestaurantService } from '../restaurant.service';
import { SettingsTypeVM } from '../../catalog/Models/SettingsTypeVM';
import { ActivatedRoute } from '@angular/router';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ItemVM } from '../Models/ItemVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { throws } from 'assert';

@Component({
  selector: 'app-enum-line-fields',
  templateUrl: './enum-line-fields.component.html',
  styleUrls: ['./enum-line-fields.component.css']
})
export class EnumLineFieldsComponent implements OnInit {
  Edit: boolean = false;
  holdValues: boolean = false;
  Add: boolean = true;
  Heading?: string = ""
  fields: SettingsTypeVM[] = [];
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'isActive', 'description', 'eLFData', 'actions'];
  dataSource: any;
  displayedcolumns: string[] = []
  Settings: SettingsVM[] = [];
  typeId: number = 0
  List: SettingsVM[] = [];
  searchedStng?: SettingsVM[];
  group!: FormGroup;
  Id: number = 0;
  FieldData = [];
  data: object[] = []
  columnNames: any;
  columnnames: any;
  columns: any;
  DataSource: any
  datasource: any
  selectedSettings: SettingsVM
  constructor(
    private cdref: ChangeDetectorRef,
    public catLogSvc: CatalogService,
    private route: ActivatedRoute,
    public resSvc: RestaurantService) {
    this.selectedSettings = new SettingsVM();
  }
  ngOnInit(): void {
    this.GetDataAgaintsType()
    this.GetField();
    this.selectedSettings.isActive = true
  }
  GetDataAgaintsType() {

    this.FieldData.length = 0
    this.Id = 0
    this.route.queryParams.subscribe(params => {
      this.typeId = + params['type']
      if (!Number.isNaN(this.typeId)) {

        this.Add = true
        this.Edit = false
        this.selectedSettings = new SettingsVM;
        var type = new SettingsTypeVM()
        type.id = params['type'];
        this.catLogSvc.SearchSettingsType(type).subscribe({
          next: (res: SettingsTypeVM[]) => {

            this.Heading = res[0].name
            this.selectedSettings.enumTypeId = + params['type'];
            this.Search()
            //  if (!this.holdValues)
            //this.GetField();
          }, error: (e) => {
            this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
          }
        })
      }
      else {
        this.selectedSettings = new SettingsVM;
        this.GetSettings();
        this.Add = true;
        this.Edit = false;
      }
    })
  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
    this.cdref.markForCheck();
  }
  Refresh() {
    this.FieldData.length = 0
    this.Id = 0
    this.holdValues = false
    this.ngOnInit();
  }
  GetField() {
    this.route.queryParams.subscribe(params => {
      this.typeId = + params['type']
      if (!Number.isNaN(this.typeId)) {
        this.selectedSettings.enumTypeId = + params['type'];
        if (this.selectedSettings.enumTypeId != EnumTypeVM.ItemGroup) {
          var stng = new SettingsTypeVM
          stng.pparentId = this.selectedSettings.enumTypeId
          //stng.clientId=+localStorage.getItem("RMSClientId")
          this.catLogSvc.SearchSettingsType(stng).subscribe((res: SettingsTypeVM[]) => {

            this.fields = res;
            if (this.fields.length > 0) {
              const formGroup = {};
              this.fields.forEach(formControl => {
                // this.group.addControl(formControl.name, new FormControl(''));
                formGroup[formControl.name] = new FormControl('');
              });
              this.group = new FormGroup(formGroup);
            } else this.fields = []
          });
        } else this.fields = []
      }
    })
  }
  GetSettings() {
    var stng = new SettingsVM
    stng.clientId=+localStorage.getItem("RMSClientId")
    this.catLogSvc.SearchSettings(stng).subscribe((res: SettingsVM[]) => {
      this.Settings = res;
      this.dataSource = new MatTableDataSource(res);
    });
  }
  capitalize(s: string): string {
    return s.charAt(0).toUpperCase() + s.slice(1);
  }
  SearchByType() {
    var type = new SettingsTypeVM
    type.id = this.typeId;
    this.catLogSvc.SearchSettingsType(type).subscribe({
      next: (value: SettingsTypeVM[]) => {
        this.data = []
        this.columnNames = undefined
        this.columns = undefined
        this.DataSource = undefined
        if (value[0].eLFieldsData.length > 0) {
          value[0].eLFieldsData.forEach(x => {
            this.data.push(x);
            this.DataSource = new MatTableDataSource(this.data)
          })
        } else {
          this.data = this.Settings
          this.DataSource = new MatTableDataSource(this.data)
        }
        if (this.data.length > 0) {
          this.columnNames = Object.keys(this.data[0]);
          this.columns = Object.keys(this.data[0]);
          this.columns.push("actions")
        }
      }, error(err) {

      },
    })
  }
  Search() {
    var stng = new SettingsVM();
    stng.enumTypeId = this.selectedSettings.enumTypeId
    this.catLogSvc.SearchSettings(stng).subscribe((res: SettingsVM[]) => {
      this.Settings = res
      this.dataSource = new MatTableDataSource(res);
      this.columnnames = Object.keys(this.Settings[0].extraFieldsData);
      this.displayedcolumns = Object.keys(this.Settings[0].extraFieldsData);
      this.displayedcolumns.unshift("name")
      this.displayedcolumns.push("isActive")
      this.displayedcolumns.push("description")
      this.displayedcolumns.push("actions")
      var data = [];
      this.Settings.forEach(element => {
        var list = { ...element.extraFieldsData, ...element }
        // var list = element.extraFieldsData
        data.push(list)
      });
      this.datasource = new MatTableDataSource(data);
      this.SearchByType();
    });
  }
  Submit() {
    if (!this.userForm.invalid) {
      var stng = new SettingsVM();
      stng.enumTypeId = this.selectedSettings.enumTypeId;
      this.catLogSvc.SearchSettings(stng).subscribe((res: SettingsVM[]) => {
        this.searchedStng = res
        var list = res
        if (this.Edit)
          list = list.filter(x => x.id != this.selectedSettings.id)
        var find = list.find(x => x.name == this.selectedSettings.name)

        if (find == undefined) {
          if (this.fields.length != 0)
            Object.keys(this.group.controls).forEach(async (key: any) => {

              const obstractControl = this.group.get(key);
              this.Id = this.Id + 1
              var DbOperation;
              if (this.Edit)
                DbOperation = 2
              else
                DbOperation = 1
              const newRow = {
                "id": this.Id, "eumLineId": 0, "fieldValue": obstractControl.value, "fieldName": key,
                "isActive": true, "dBoperation": DbOperation
              }
              this.FieldData.push(newRow)
              this.selectedSettings.eLFData = this.FieldData
            })
          if (this.Edit)
            this.UpdateSettings()
          else
            this.SaveSettings();
        } else this.catLogSvc.ErrorMsgBar(this.Heading + " with this name already exist ", 5000)
      });
    }
    else
      this.catLogSvc.ErrorMsgBar("Please Fill all required Fields", 5000)
  }
  UpdateSettings() {
    console.warn(this.selectedSettings)
    this.catLogSvc.UpdateSettings(this.selectedSettings).subscribe({
      next: (value) => {
        this.catLogSvc.SuccessMsgBar("Successfully Updated", 6000)
        this.holdValues = true
        this.GetDataAgaintsType();
        window.scrollTo(0, 0);
        //this.group.reset();
      }, error: (err) => {
        console.warn(err)
        this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  SaveSettings() {
    this.catLogSvc.SaveSettings(this.selectedSettings).subscribe({
      next: (value) => {
        this.catLogSvc.SuccessMsgBar("Successfully Added", 6000)
        this.holdValues = true
        this.GetDataAgaintsType();
        window.scrollTo(0, 0);
        // this.group.reset();
      }, error: (err) => {
        console.warn(err)
        this.catLogSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetForEdits(row: any) {
    this.Edit = true
    this.Add = false
    if (this.fields.length > 0) {
      this.selectedSettings.id = row.Id
      this.selectedSettings.enumTypeId = row.TypeId
      this.selectedSettings.name = row.Name
      this.selectedSettings.description = row.description
      if (row.IsActive == 1)
        this.selectedSettings.isActive = true
      else
        this.selectedSettings.isActive = false
      Object.keys(row).forEach(x => {
        const obstractControl = this.group.get(x);
        if (obstractControl != undefined)
          this.group.controls[x].setValue(row[x])
      })
    }
    else
      this.selectedSettings = row
    window.scrollTo(0, 0)
  }
  GetForEdit(row: SettingsVM) {

    this.Edit = true
    this.Add = false
    this.selectedSettings = row
    this.List[0] = row
    for (let index = 0; index < row.eLFData.length; index++) {
      var FieldName = row.eLFData[index].fieldName;
      var FieldValue = row.eLFData[index].fieldValue
      this.group.get(FieldName)?.setValue(FieldValue);
      this.group.controls[FieldName].setValue(FieldValue)
    }
    window.scrollTo(0, 0)
  }
  Delete(id: number) {
    var item = new ItemVM()
    item.groupId = id;
    this.resSvc.SearchItem(item).subscribe((res: ItemVM[]) => {
      if (res.length == 0) {

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
            this.catLogSvc.DeleteSettings(id).subscribe((data) => {
              Swal.fire(
                'Deleted!',
                'Successfully deleted.',
                'success'
              )
              this.GetDataAgaintsType();
            })
          }
        })
      }
      else if (res.length == 1)
        this.catLogSvc.ErrorMsgBar("Unable to delete because it contains a child!", 5000)
      else
        this.catLogSvc.ErrorMsgBar("Unable to delete because it contains Children!", 5000)
    });
  }
}
