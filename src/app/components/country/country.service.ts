import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class CountryService {
  private url = 'https://restcountries.com/v3.1/all';
  //
  constructor(private http: HttpClient) {}

  getCountryData(): Observable<any> {
    return this.http.get(this.url);
  }
}
