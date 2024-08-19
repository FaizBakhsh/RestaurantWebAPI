import { EmployeeSalaryVM } from './Models/EmployeeSalaryVM';
import { EmployeeAttendanceVM } from './Models/EmployeeAttendanceVM';
import { StaffVM } from './Models/StaffVM';
import { EmployeeVM } from './Models/EmployeeVM';
import { EmployeeSaleVM } from './Models/EmployeeSaleVM';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';

@Injectable({
  providedIn: 'root'
})
export class EmployeeManagementService {

  constructor(private http: HttpClient) { }
  selectedEmpSalary: EmployeeSalaryVM = new EmployeeSalaryVM;
  selectedEmployeeAttendance: EmployeeAttendanceVM = new EmployeeAttendanceVM;


  UpdateEmployeeSalary(EmployeeSalary: EmployeeSalaryVM) {
    return this.http.put(Globals.BASE_API_URL + 'EmployeeSalary', EmployeeSalary);
  }
  GetEmployeeSalaryById(id: number): Observable<EmployeeSalaryVM> {

    return this.http.get<EmployeeSalaryVM>(Globals.BASE_API_URL + 'EmployeeSalary/' + id).pipe()
  }
  SearchEmployeeSalary(EmployeeSalary: EmployeeSalaryVM): Observable<EmployeeSalaryVM[]> {
    return this.http.post<EmployeeSalaryVM[]>(Globals.BASE_API_URL + 'EmployeeSalary/Search', EmployeeSalary).pipe();
  }
  GetEmployeeSalary(): Observable<EmployeeSalaryVM[]> {
    return this.http.get<EmployeeSalaryVM[]>(Globals.BASE_API_URL + 'EmployeeSalary').pipe();
  }
  SaveEmployeeSalary(EmployeeSalary: EmployeeSalaryVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'EmployeeSalary', EmployeeSalary);
  }
  DeleteEmployeeSalary(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'EmployeeSalary/' + id);
  }


  UpdateEmployeeAttendance(value: EmployeeAttendanceVM) {
    return this.http.put(Globals.BASE_API_URL + 'EmployeeAttendance', value);
  }
  GetEmployeeAttendanceById(id: number): Observable<EmployeeAttendanceVM> {

    return this.http.get<EmployeeAttendanceVM>(Globals.BASE_API_URL + 'EmployeeAttendance/' + id).pipe()
  }
  SearchEmployeeAttendance(value: EmployeeAttendanceVM): Observable<EmployeeAttendanceVM[]> {
    return this.http.post<EmployeeAttendanceVM[]>(Globals.BASE_API_URL + 'EmployeeAttendance/Search', value).pipe();
  }
  GetEmployeeAttendance(): Observable<EmployeeAttendanceVM[]> {
    return this.http.get<EmployeeAttendanceVM[]>(Globals.BASE_API_URL + 'EmployeeAttendance').pipe();
  }
  SaveEmployeeAttendance(value: EmployeeAttendanceVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'EmployeeAttendance', value);
  }
  DeleteEmployeeAttendance(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'EmployeeAttendance/' + id);
  }

  UpdateStaff(value: StaffVM) {
    return this.http.put(Globals.BASE_API_URL + 'Staff', value);
  }
  GetStaffById(id: number): Observable<StaffVM> {

    return this.http.get<StaffVM>(Globals.BASE_API_URL + 'Staff/' + id).pipe()
  }
  SearchStaff(value: StaffVM): Observable<StaffVM[]> {
    return this.http.post<StaffVM[]>(Globals.BASE_API_URL + 'Staff/Search', value).pipe();
  }
  GetStaff(): Observable<StaffVM[]> {
    return this.http.get<StaffVM[]>(Globals.BASE_API_URL + 'Staff').pipe();
  }
  SaveStaff(value: StaffVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Staff', value);
  }
  DeleteStaff(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Staff/' + id);
  }

  UpdateEmployeeSale(value: EmployeeSaleVM) {
    return this.http.put(Globals.BASE_API_URL + 'EmployeeSale', value);
  }
  GetEmployeeSaleById(id: number): Observable<EmployeeSaleVM> {

    return this.http.get<EmployeeSaleVM>(Globals.BASE_API_URL + 'EmployeeSale/' + id).pipe()
  }
  SearchEmployeeSale(value: EmployeeSaleVM): Observable<EmployeeSaleVM[]> {
    return this.http.post<EmployeeSaleVM[]>(Globals.BASE_API_URL + 'EmployeeSale/Search', value).pipe();
  }
  GetEmployeeSale(): Observable<EmployeeSaleVM[]> {
    return this.http.get<EmployeeSaleVM[]>(Globals.BASE_API_URL + 'EmployeeSale').pipe();
  }
  SaveEmployeeSale(value: EmployeeSaleVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'EmployeeSale', value);
  }
  DeleteEmployeeSale(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'EmployeeSale/' + id);
  }



  UpdateEmployee(Employee: EmployeeVM) {
    return this.http.put(Globals.BASE_API_URL + 'Employee', Employee);
  }
  GetEmployeeById(id: number): Observable<EmployeeVM[]> {

    return this.http.get<EmployeeVM[]>(Globals.BASE_API_URL + 'Employee/' + id).pipe()
  }
  SearchEmployee(Employee: EmployeeVM): Observable<EmployeeVM[]> {
    return this.http.post<EmployeeVM[]>(Globals.BASE_API_URL + 'Employee/Search', Employee).pipe();
  }
  GetEmployee(): Observable<EmployeeVM[]> {
    return this.http.get<EmployeeVM[]>(Globals.BASE_API_URL + 'Employee').pipe();
  }
  SaveEmployee(Employee: EmployeeVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Employee', Employee);
  }
  DeleteEmployee(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Employee/' + id);
  }
}
