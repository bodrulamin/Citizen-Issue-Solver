import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Category } from '../components/add-category/category.model';
import { ConfigService } from './config.service';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(
    private http: HttpClient,
    private config: ConfigService
  ) { }

  
  addCategory(c:Category){
   return this.http.post<any>(this.config.categoryAddApi, JSON.stringify(c), { headers: this.config.header })
  }


  getAll():Observable<any>{
   return this.http.get(this.config.categoryGetAllApi, { headers: this.config.header })
  }

  getOne(id:string):Observable<any>{
    return this.http.get(this.config.categoryGetOneApi+id, { headers: this.config.header })
   }
 
  deleteCategory(c:Category){
   return this.http.post<any>(this.config.categoryDeleteApi, JSON.stringify(c), { headers: this.config.header })
  }




}
