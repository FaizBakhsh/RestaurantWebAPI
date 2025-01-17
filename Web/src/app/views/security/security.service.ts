
import { LoginVM } from './models/LoginVM';
import { EnumValueVM } from './models/EnumValueVM';
import { catchError, map } from 'rxjs/operators';
import { HttpClient, HttpEvent, HttpHandler, HttpHeaders, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { RoleVM } from './models/role-vm';
import { OnlineDBSettingVM } from '../restaurant/Models/OnlineDBSettingVM';
import { PermissionVM } from './models/permission-vm';
import { UserVM } from './models/user-vm';
import { FeatureVM } from './models/feature-vm';
import { UserRoleVM } from './models/user-role-vm';
import { Observable, Subject } from 'rxjs';
import { mapTo } from 'rxjs/operators';
import { CanActivate, Router } from '@angular/router';
import { Globals } from 'src/app/globals';


@Injectable({
  providedIn: 'root'
})
export class SecurityService {
  selectedUser: UserVM = new UserVM;
  selectedRole: RoleVM = new RoleVM;
  selectedUserRole: UserRoleVM = new UserRoleVM;
  selectedDBSetting: OnlineDBSettingVM = new OnlineDBSettingVM;
  constructor(private http: HttpClient) { }


  deleteuRole(info: any) {
    debugger
    return this.http.post(Globals.BASE_API_URL + 'UserRole/Delete', info);
  }
  DeleteUser(id: any) {
    return this.http.delete(Globals.BASE_API_URL + 'User?id=' + id);
  }
  DeleteRole(id: String) {
    return this.http.delete(Globals.BASE_API_URL + 'Role/' + id);
  }


  Login(User: LoginVM) {
    return this.http.post(Globals.BASE_API_URL + 'Account/Login', User).pipe();
  }
  GetFeatureById(id: String): Observable<FeatureVM[]> {
    return this.http.get<FeatureVM[]>(Globals.BASE_API_URL + 'Feature/' + id).pipe();
  }


  SearchUser(data: UserVM): Observable<UserVM[]> {
    return this.http.post<UserVM[]>(Globals.BASE_API_URL + 'User/Search', data).pipe();
  }
  SearchUserRole(id: any): Observable<UserRoleVM> {
    return this.http.get<UserRoleVM>(Globals.BASE_API_URL + 'UserRole/' + id).pipe();
  }
  SearchUserById(id: any): Observable<UserVM> {
    return this.http.get<UserVM>(Globals.BASE_API_URL + 'User/' + id).pipe();
  }
  SearchUserByName(search: any): Observable<UserVM[]> {
    return this.http.post<UserVM[]>(Globals.BASE_API_URL + 'User/Search', search).pipe();
  }
  SearchRole(search: any): Observable<RoleVM> {
    return this.http.post<RoleVM>(Globals.BASE_API_URL + 'Role/id', search).pipe();
  }
  SearchFeature(search: any): Observable<FeatureVM[]> {
    return this.http.post<FeatureVM[]>(Globals.BASE_API_URL + 'Feature/Search', search).pipe();
  }
  SearchPermission(search: any): Observable<PermissionVM[]> {
    return this.http.post<PermissionVM[]>(Globals.BASE_API_URL + 'Permissions/Search', search).pipe();
  }
  SearchPerms(search: any): Observable<PermissionVM[]> {
    return this.http.post<PermissionVM[]>(Globals.BASE_API_URL + 'Permissions/Permission', search).pipe();
  }


  UpdateUser(values: UserVM) {
    return this.http.put(Globals.BASE_API_URL + 'User', values);
  }
  UpdateRole(values: RoleVM) {
    return this.http.put(Globals.BASE_API_URL + 'Role', values);
  }
  UpdateUserRole(values: UserRoleVM) {
    return this.http.put(Globals.BASE_API_URL + 'UserRole', values);
  }
  UpdateFeature(values: FeatureVM) {
    return this.http.put(Globals.BASE_API_URL + 'Feature', values);
  }
  UpdatePermission(values: PermissionVM) {
    return this.http.put(Globals.BASE_API_URL + 'Permissions', values);
  }


  getRolesList() {
    //return this.http.get('/api/invoices/');
    return this.http.get<RoleVM[]>(Globals.BASE_API_URL + 'Role').pipe();
  }
  getUserList() {
    return this.http.get<UserVM[]>(Globals.BASE_API_URL + 'User').pipe();
  }
  getPermissionList() {
    return this.http.get<PermissionVM[]>(Globals.BASE_API_URL + 'Permissions').pipe();
  }
  getFeatureList() {
    return this.http.get<FeatureVM[]>(Globals.BASE_API_URL + 'Feature').pipe();
  }
  getUserRoleList() {
    return this.http.get<UserRoleVM[]>(Globals.BASE_API_URL + 'UserRole').pipe();
  }
  GetEnumValues(type: any): Observable<EnumValueVM[]> {
    return this.http.get<EnumValueVM[]>(Globals.BASE_API_URL + 'EnumValues/' + type).pipe();
  }


  SaveUser(User: any) {
    console.warn(User);
    return this.http.post(Globals.BASE_API_URL + 'User', User);
  }
  SaveRole(Role: any) {
    return this.http.post(Globals.BASE_API_URL + 'Role', Role);
  }
  SaveFeature(feature: any) {
    return this.http.post(Globals.BASE_API_URL + 'Feature', feature);
  }
  SavePermissions(permission: any) {

    return this.http.post(Globals.BASE_API_URL + 'Permissions', permission);
  }
  SaveUserRoles(URole: any) {
    return this.http.post(Globals.BASE_API_URL + 'UserRole', URole);
  }

}

