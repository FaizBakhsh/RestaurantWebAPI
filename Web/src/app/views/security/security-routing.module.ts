import { CreateUserDialogComponent } from './manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';
import { AssignRoleToUserComponent } from './assign-role-to-user/assign-role-to-user.component';
import { ManageRoleComponent } from "./manage-role/manage-role.component";
import { ManageUserComponent } from "./manage-user/manage-user.component";
import { Component } from "@angular/core";
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { AuthorizationCheck } from './AuthorizationCheck';
import { ManagePermissionsComponent } from './manage-permissions/manage-permissions.component';
import { RouteIds } from '../catalog/Models/Enums/RouteIds';

const routes: Routes = [
  {
    path: "userRegistration",
    component: CreateUserDialogComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: "roles",
    component: ManageRoleComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.Roles, ''] },
    pathMatch: "full",
  },
  {
    path: "perms",
    component: ManagePermissionsComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.Permissions, ''] },
    pathMatch: "full",
  },
  {
    path: "users",
    component: ManageUserComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.Users, ''] },
    pathMatch: "full",
    // canActivate: [AuthorizationCheck]
  },
  {
    path: "userrole",
    component: AssignRoleToUserComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full",
    // canActivate: [AuthorizationCheck]
  },


];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SecurityRoutingModule { }

