import { Component } from '@angular/core';
import { IssueStockVM } from '../Models/IssueStockVM';
import { InventoryService } from '../inventory.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { BranchVM } from '../../restaurant/Models/BranchVM';
import { RestaurantService } from '../../restaurant/restaurant.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { __values } from 'tslib';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-issuestock',
  templateUrl: './issuestock.component.html',
  styleUrls: ['./issuestock.component.css']
})
export class IssuestockComponent {
  proccessing :boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  IssueStock? : IssueStockVM[]
  Branches?:BranchVM[]
  Category?:SettingsVM[]
  selectedIssStock:IssueStockVM
  dataSource?: any
  displayedColumns: string[] = ['date', 'keyword', 'issuingBranch', 'receivingBranch', 'category', 'actions'];
  constructor(private invtSvc: InventoryService,
    private resSvc:RestaurantService,
    private catSvc : CatalogService ){
     this.selectedIssStock= new IssueStockVM
    }
  ngOnInit(){
    this.proccessing=false
    this.Add = true;
    this.Edit = false;
    this.selectedIssStock= new IssueStockVM
    this.GetIssueStock()
    this.GetBranch()
    this.GetCategory()

  }
  GetIssueStock(){
  this.invtSvc.GetIssueStock().subscribe({
    next:(value:IssueStockVM[])=> {
      debugger
      console.warn(value)
      this.IssueStock=value
      this.dataSource = new MatTableDataSource(this.IssueStock)
    }, error:(err)=> {
      this.catSvc.ErrorMsgBar("Error Occured", 5000)
    },
  })
  }
  GetBranch(){
      this.resSvc.GetBranch().subscribe({
        next:(value:BranchVM[])=> {
       this.Branches=value
        },error:(err)=> {
          this.catSvc.ErrorMsgBar("error occured" , 5000)
        },
      })
    }
    GetCategory(){
      debugger
      var stng = new SettingsVM
      stng.enumTypeId = EnumTypeVM.ItemCategory
      this.catSvc.SearchSettings(stng).subscribe({
        next:(value:SettingsVM[])=> {
       this.Category=value
        },error:(err)=> {
          this.catSvc.ErrorMsgBar("error occured" , 5000)
        },
      })
    }
    SaveIssueStock(){
      debugger
      this.proccessing=true
      this.invtSvc.SaveIssueStock(this.selectedIssStock).subscribe({
        next:(value)=> {
          this.proccessing=false
          this.catSvc.SuccessMsgBar("Successfully Added" , 5000)
          this.ngOnInit()
        },error:(err)=> {
          this.proccessing=false
          this.catSvc.ErrorMsgBar("Error Occured", 5000)
        },
      })
    }
    EditIssueStock(value:IssueStockVM){
      debugger
      this.Add=false;
      this.Edit=true;
      this.selectedIssStock = value
    }
    DeleteIssueStock(value:IssueStockVM){
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
          this.invtSvc.DeleteIssueStock(value.id).subscribe({
            next: (data: any) => {
              Swal.fire(
                'Deleted!',
                'Successfully deleted.',
                'success'
              )
              this.GetIssueStock();
            }, error: (e) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 5000)
              console.warn(e);
            }
          })
        }
      })
    }
    UpdateIssueStock(){
      this.proccessing=true
      this.invtSvc.UpdateIssueStock(this.selectedIssStock).subscribe({
        next:(value)=> {
          this.proccessing=false
          this.catSvc.SuccessMsgBar("Successfully Updated" , 5000)
          this.ngOnInit()   
        },error:(err)=> {
          this.proccessing=false
          this.catSvc.ErrorMsgBar("Error Occured", 5000)
        },
      })
    }
  }

