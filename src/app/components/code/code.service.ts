import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class CodeService {
  private url = 'api/dipomex/v1/codigo_postal';
  private apiKey = '64be98d0d63ce59af30b41ddf1e0e4cca51fdf06';

  constructor(private http: HttpClient) {}

  getCodeDate(postalCode: string): Observable<any> {
    return this.http.get(this.url, {
      params: { cp: postalCode },
      headers: { apikey: this.apiKey },
    });
  }
}
