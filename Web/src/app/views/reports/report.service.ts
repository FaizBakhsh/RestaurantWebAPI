import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BaseSearchCriteria } from '../catalog/Models/BaseSearchCriteria';
import { Globals } from 'src/app/globals';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ReportService {

  constructor(private http: HttpClient,
  ) {

  }
  GetReport(criteria: BaseSearchCriteria, path): Observable<any> {
    return this.http.post<any>(Globals.BASE_API_URL + path, criteria, {
      responseType: 'blob' as 'json',
      observe: 'response'
    });
  }
}
