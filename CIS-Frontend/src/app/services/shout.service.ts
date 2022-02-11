import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Shout } from '../components/shouts/shout.model';
import { ConfigService } from './config.service';

@Injectable({
  providedIn: 'root'
})
export class ShoutService {

  constructor(
    private http: HttpClient,
    private config: ConfigService
  ) { }


  addShout(c: FormData) {
    return this.http.post<any>(this.config.shoutAddApi, c)
  }


  getAll(): Observable<any> {
    return this.http.get(this.config.shoutGetAllApi, { headers: this.config.header })
  }
  getAllOfCurrentCitizen(shouterId: string): Observable<any> {
    return this.http.get(this.config.shoutGetAllApi + "/" + shouterId, { headers: this.config.header })
  }

   getAllOfCurrentProvider(providerId: string): Observable<any> {
    return this.http.get(this.config.shoutGetAllApi + "/" + providerId, { headers: this.config.header })
  }
  getOne(id: string): Observable<any> {
    return this.http.get(this.config.shoutGetOneApi + id, { headers: this.config.header })
  }

  deleteShout(c: Shout) {
    return this.http.post<any>(this.config.shoutDeleteApi, JSON.stringify(c), { headers: this.config.header })
  }

  updateShoutStatus(c: Shout) {
    return this.http.post<any>(this.config.shoutUpdateStatusApi, JSON.stringify(c), { headers: this.config.header })
  }


}
