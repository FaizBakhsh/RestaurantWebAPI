import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable, Subject } from 'rxjs';
import { Globals } from 'src/app/globals';
import { SettingsTypeVM } from './Models/SettingsTypeVM';
import { SettingsVM } from './Models/SettingsVM';
import { RestaurantService } from '../restaurant/restaurant.service';
import { NotificationTemplateVM } from './Models/NotificationTemplateVM';
import { NotificationVM } from './Models/NotificationVM';
import { ClientsVM } from './Models/ClientsVM';
import { StorageData } from './Models/StorageData';
import * as moment from 'moment';
import { Router } from '@angular/router';
import { PermissionVM } from '../security/models/permission-vm';
import { Roles } from './Models/Enums/Roles';


@Injectable({
  providedIn: 'root'
})
export class CatalogService {
  permissions: PermissionVM[] = []
  selectedSettings: SettingsVM = new SettingsVM;
  selectedSettingsType: SettingsTypeVM = new SettingsTypeVM;
  isLoading: boolean = false
  totalRecords: number; pageSizes: number[]; defaultPageSize: number
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    private resSvc: RestaurantService,
    private http: HttpClient
  ) { }
  private refreshSubject = new Subject<void>();
  // Observable to listen for refresh events
  refresh$ = this.refreshSubject.asObservable();
  // Trigger a refresh event
  triggerRefresh() {
    this.refreshSubject.next();
  }
  isPdfBlank(blob: Blob): Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => {
        try {
          const text = (reader.result as string).trim(); // Remove leading and trailing white space
          const isBlank = text.length === 0; // Check if text content is empty
          resolve(isBlank);
        } catch (error) {
          console.error('Error checking PDF content:', error);
          reject(error);
        }
      };
      reader.onerror = reject;
      reader.readAsText(blob);
    });
  }

  setDate(date) {
    if (date != null) {
      date = moment(date).toDate()
      date = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()))
    }
    return date
  }

  SuccessfullyUpdateMsg() {
    this.SuccessMsgBar(" Successfully Updated!", 5000)
  }
  SuccessfullyAddMsg() {
    this.SuccessMsgBar(" Successfully Added!", 5000)
  }
  SuccessMsgBar(Message: string, Duration?: number) {
    if (Duration == undefined || Duration == null)
      Duration = 5000
    this.snack.open(Message, 'Ok', { duration: Duration, verticalPosition: 'bottom', panelClass: ['blue-snackbar'] });
  }
  InfoMsgBar(Message: string, Duration?: number) {
    if (Duration == undefined || Duration == null)
      Duration = 5000
    this.snack.open(Message, 'Ok', { duration: Duration, verticalPosition: 'bottom', panelClass: ['green-snackbar'] });
  }
  ErrorMsgBar(Message?: string, Duration?: number) {
    if (Duration == undefined)
      Duration = 5000
    if (Message == null)
      Message = "Error Occurred"
    this.snack.open(Message, 'Close', { duration: Duration, verticalPosition: 'bottom', panelClass: ['red-snackbar'] });
  }
  getCapitalLettersAsString(inputString: string): string {
    const capitalLettersArray = inputString.match(/[A-Z]/g);
    if (!capitalLettersArray) {
      return "";
    }
    const capitalLettersString = capitalLettersArray.join("");
    return capitalLettersString;
  }

  UpdateSettings(value: SettingsVM) {
    return this.http.put(Globals.BASE_API_URL + 'Settings', value);
  }
  GetSettingsById(id: number): Observable<SettingsVM> {
    return this.http.get<SettingsVM>(Globals.BASE_API_URL + 'Settings/' + id).pipe()
  }
  SearchSettings(value: SettingsVM): Observable<SettingsVM[]> {
    return this.http.post<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/Search', value).pipe();
  }
  SearchAccounts(value: SettingsVM): Observable<SettingsVM[]> {
    return this.http.post<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/Accounts', value).pipe();
  }
  GetSettings(): Observable<SettingsVM[]> {
    return this.http.get<SettingsVM[]>(Globals.BASE_API_URL + 'Settings').pipe();
  }
  SaveSettings(value: SettingsVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Settings', value);
  }
  deleteSettings(value: SettingsVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Settings/Update', value);
  }
  DeleteSettings(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Settings/' + id);
  }
  SearchEnumLine(value: SettingsVM): Observable<SettingsVM[]> {
    return this.http.post<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/EnumLine', value).pipe();
  }
  SearchMenu(value: SettingsVM): Observable<SettingsVM[]> {
    return this.http.post<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/Menu', value).pipe();
  }
  SearchActiveMenu(value): Observable<SettingsVM[]> {
    return this.http.post<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/ActiveMenu', value).pipe();
  }


  UpdateSettingsType(value: SettingsTypeVM) {
    return this.http.put(Globals.BASE_API_URL + 'SettingsType', value);
  }
  GetSettingsTypeById(id: number): Observable<SettingsTypeVM> {
    return this.http.get<SettingsTypeVM>(Globals.BASE_API_URL + 'SettingsType/' + id).pipe()
  }
  SearchSettingsType(value: SettingsTypeVM): Observable<SettingsTypeVM[]> {
    return this.http.post<SettingsTypeVM[]>(Globals.BASE_API_URL + 'SettingsType/Search', value).pipe();
  }
  GetSettingsType(): Observable<SettingsTypeVM[]> {
    return this.http.get<SettingsTypeVM[]>(Globals.BASE_API_URL + 'SettingsType').pipe();
  }
  SearchEnums(value: SettingsTypeVM): Observable<SettingsTypeVM[]> {
    return this.http.post<SettingsTypeVM[]>(Globals.BASE_API_URL + 'SettingsType/Enum', value).pipe();
  }
  SaveSettingsType(value: SettingsTypeVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'SettingsType', value);
  }
  DeleteSettingsType(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'SettingsType/' + id);
  }


  UpdateNotificationTemplate(NotificationTemplate: NotificationTemplateVM) {
    return this.http.put(Globals.BASE_API_URL + 'NotificationTemplate', NotificationTemplate);
  }
  GetNotificationTemplateById(id: number): Observable<NotificationTemplateVM> {

    return this.http.get<NotificationTemplateVM>(Globals.BASE_API_URL + 'NotificationTemplate/' + id).pipe()
  }
  SearchNotificationTemplate(NotificationTemplate: NotificationTemplateVM): Observable<NotificationTemplateVM[]> {
    return this.http.post<NotificationTemplateVM[]>(Globals.BASE_API_URL + 'NotificationTemplate/Search', NotificationTemplate).pipe();
  }
  GetNotificationTemplate(): Observable<NotificationTemplateVM[]> {
    return this.http.get<NotificationTemplateVM[]>(Globals.BASE_API_URL + 'NotificationTemplate').pipe();
  }
  SaveNotificationTemplate(NotificationTemplate: NotificationTemplateVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'NotificationTemplate', NotificationTemplate);
  }
  DeleteNotificationTemplate(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'NotificationTemplate/' + id);
  }
  UpdateClients(value: ClientsVM): Observable<ClientsVM> {
    return this.http.put<ClientsVM>(Globals.BASE_API_URL + 'Clients', value);
  }
  GetClientsById(id: number): Observable<ClientsVM[]> {
    return this.http.get<ClientsVM[]>(Globals.BASE_API_URL + 'Clients/' + id).pipe()
  }
  SearchClients(value: ClientsVM): Observable<ClientsVM[]> {
    return this.http.post<ClientsVM[]>(Globals.BASE_API_URL + 'Clients/Search', value).pipe();
  }
  GetClients(): Observable<ClientsVM[]> {
    return this.http.get<ClientsVM[]>(Globals.BASE_API_URL + 'Clients').pipe();
  }
  SaveClients(value: ClientsVM): Observable<ClientsVM> {
    return this.http.post<ClientsVM>(Globals.BASE_API_URL + 'Clients', value);
  }
  DeleteClients(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Clients/' + id);
  }


  SendMail(Mail: NotificationVM) {
    return this.http.post(Globals.BASE_API_URL + 'Notification', Mail);
  }
  // uploadPDF(pdfBlob: Blob, mail): Observable<any> {
  //   debugger
  //   const formData = new FormData();
  //   formData.append('pdfFile', pdfBlob, 'myfile.pdf');
  //   formData.append('mail', mail)
  //   mail.attachment = formData
  //   return this.http.post<any>(Globals.BASE_API_URL + 'Notification/Attachment', formData);
  // }
  sendMailwithPdf(mail: NotificationVM): Observable<any> {
    const formData = new FormData();
    formData.append('attachment', mail.attachment, "myFile.pdf");
    formData.append('senderMail', mail.senderMail);
    formData.append('receiverMail', mail.receiverMail);
    formData.append('mailSubject', mail.mailSubject);
    formData.append('mailBody', mail.mailBody);
    return this.http.post(Globals.BASE_API_URL + 'Notification/Mail', formData)
  }
  SetProject(data) {
    var perms = localStorage.getItem("RMSPermissions")
    localStorage.clear()
    if (data.permissions)
      localStorage.setItem("RMSPermissions", JSON.stringify(data.permissions))
    else
      localStorage.setItem("RMSPermissions", perms)
    localStorage.setItem("RMSRole", data.role)
    localStorage.setItem("RMSRole", data.role)
    localStorage.setItem("RMSModuleIds", data.moduleIds)
    localStorage.setItem("RMSClient", data.client)
    localStorage.setItem("RMSUserName", data.email)
    localStorage.setItem("RMSUserId", data.id)
    localStorage.setItem("RMSClientId", data.clientId ? data.clientId : 0)
    localStorage.setItem("RMSToken", data.token)
    localStorage.setItem("RMSRoleId", data.roleId)
    if (data.roleId == Roles.SuperAdmin) {
      data.superAdminId = data.id
      data.superAdminName = data.email
    }
    if (data.roleId == Roles.ClientAdmin) {
      localStorage.setItem("RMSClientId", data.cLTId)
      localStorage.setItem("RMSModuleIds", data.cLTModuleIds)
    }
    localStorage.setItem("RMSSuperAdminId", data.superAdminId)
    localStorage.setItem("RMSSuperAdminName", data.superAdminName)

    if (data.roleId == Roles.SuperAdmin)
      this.route.navigate(['/client/cltList']);
    else this.route.navigate(['/catalog/home']);
  }
  openCltData(clt: ClientsVM) {
    var _data = new StorageData()
    _data.role = "Client Admin"
    _data.id = clt.userId
    _data.roleId = Roles.ClientAdmin
    _data.token = localStorage.getItem("RMSToken")
    _data.moduleIds = clt.moduleIds
    _data.cLTModuleIds = clt.moduleIds
    _data.clientId = clt.id
    _data.cLTId = clt.id
    _data.client = clt.clientName
    _data.email = clt.email
    _data.superAdminId = localStorage.getItem("RMSSuperAdminId")
    _data.superAdminName = localStorage.getItem("RMSSuperAdminName")
    this.SetProject(_data)
  }
  CheckandSet() {
    var roleId = +localStorage.getItem("RMSRoleId")
    if (+localStorage.getItem("RMSRoleId") == Roles.SuperAdmin)
      this.route.navigate(['/client/cltList']);
    else this.route.navigate(['/catalog/home']);
  }
  getPermission(keyCode): boolean {
    var isReadOnly: boolean = null
    var perms = localStorage.getItem("RMSPermissions")
    if (perms != null)
      this.permissions = JSON.parse(localStorage.getItem("RMSPermissions"))
    if (this.permissions != null && this.permissions.length > 0) {
      var perm = this.permissions.find(x => x.routeId == keyCode)
      if (perm != null)
        isReadOnly = perm.isReadOnly
    }
    return isReadOnly;
  }
}
