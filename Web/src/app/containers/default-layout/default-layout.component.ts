import { Globals } from 'src/app/globals';
import { CatalogService } from './../../views/catalog/catalog.service';
import { RestaurantService } from './../../views/restaurant/restaurant.service';
import { ItemsService } from './../../views/items/items.service';
import { Component, OnInit, ChangeDetectorRef, IterableDiffers } from '@angular/core';
import { INavData } from '@coreui/angular';
import { navItems } from './_nav';
import { SettingsTypeVM } from 'src/app/views/catalog/Models/SettingsTypeVM';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { BehaviorSubject } from 'rxjs';
import { SecurityService } from 'src/app/views/security/security.service';
import { Roles } from 'src/app/views/catalog/Models/Enums/Roles'
import { UserVM } from 'src/app/views/security/models/user-vm';
@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',
})
export class DefaultLayoutComponent implements OnInit {
  navItems: INavData[] = [];
  url!: string
  items: INavData[] = [];
  values: INavData[] = [];
  subValues: INavData[] = [];
  subVals: INavData[] = [];
  subVal: INavData[] = [];
  menuList = []
  //public navItems = navItems;
  SettingsType?: SettingsTypeVM[] = undefined;
  Type?: SettingsTypeVM = undefined;
  refresh = new BehaviorSubject<boolean>(true);
  Settings: SettingsVM[] = [];
  settings: SettingsVM[] = [];
  subSettings: SettingsVM[] = [];
  public perfectScrollbarConfig = {
    suppressScrollX: true,
  };

  constructor(
    public differ: IterableDiffers,
    public secSvc: SecurityService,
    private snack: MatSnackBar,
    public catSvc: CatalogService,
  ) {
  }
  ngOnInit(): void {
    this.catSvc.refresh$.subscribe(() => {
      this.GetSettings();
    })
    this.GetSettings();
  }
  GetSettings() {

    var menu = {}
    this.menuList = []
    this.settings = []
    this.subSettings = []
    this.subSettings = []

    this.navItems = []
    navItems.splice(0, navItems.length);
    var stng = new SettingsVM();
    stng.isActive = true
    var user = new UserVM
    user.id = localStorage.getItem("RMSUserId")
    user.roleId = +localStorage.getItem("RMSRoleId")
    this.catSvc.SearchActiveMenu(user).subscribe({
      next: (res: SettingsVM[]) => {
        this.Settings = res
        this.subSettings = res
        this.settings = res
        var moduleIds: number[]
        this.menuList = []
        var mIds = localStorage.getItem("RMSModuleIds")
        if (mIds != null) {
          var Ids = mIds.split(",")
          moduleIds = Ids.map(str => parseInt(str));
        } else
          moduleIds = []
        this.settings = this.settings?.filter(x =>
          (x.enumTypeId == EnumTypeVM.BackOffice && moduleIds.includes(x.id)) && x.clientId == 0 ||
          (x.enumTypeId == EnumTypeVM.BackOffice && x.isSystemDefined == true
            && +localStorage.getItem("RMSRoleId") == Roles.SuperAdmin && x.clientId == 0));
        this.settings.forEach(element => {
          var SubSettings = this.subSettings?.filter(x => x.parentId == element.id)
          this.subValues = []
          SubSettings.forEach((abb, fIndex) => {
            var subSubSetting = this.Settings?.filter(x => x.parentId == abb.id)
            this.subVals = []


            subSubSetting.forEach((ab, index) => {
              var ad = { name: (fIndex + 1) + "." + (index + 1) + ". " + ab.name, url: Globals.webUrl + ab.keyCode }
              this.subVals.push(ad)
            })

            var url = ""
            if (this.subVals.length > 0)
              url = ""
            else
              url = Globals.webUrl
            var ac = { name: (fIndex + 1) + ". " + abb.name, children: this.subVals, url: url + abb.keyCode }
            this.subValues.push(ac)
          })
          var url = ""
          if (this.subValues.length > 0)
            url = ""
          else
            url = Globals.webUrl
          menu = { name: element.name, children: this.subValues, url: url + element.keyCode }
          debugger
          this.menuList.push(menu)
          //this.catSvc.triggerRefresh()
        });
        navItems.splice(0, navItems.length);
        navItems.push(...this.menuList)
        this.navItems = navItems;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Failed to load Side Menu", 8000)
      }
    })
  }
}