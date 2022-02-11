import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Observable } from 'rxjs';
import { ConfigService } from './config.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  constructor(
    private http: HttpClient,
    private config: ConfigService
  ) { }

  signin(form: FormGroup): Observable<any> {
    return this.http.post(this.config.signinApi, form.value, { headers: this.config.header })
  }

  signup(form: FormGroup): Observable<any> {
    return this.http.post(this.config.signupApi, form.value)
  }

  saveUserToLocalStorage(userString: string) {
    localStorage.setItem('user', userString);

  }
  userString: any
  getUserFromLocalStorate() {

    let lu = localStorage.getItem('user')


    if (lu != null) {
      try {
        this.userString = JSON.parse(lu)
        return this.userString.user;
      } catch (e) {
        console.log(" errror " + e);

      }

    }
    return ""
  }

  clearLogin() {
    localStorage.removeItem('user');
  }

  isLoggedIn() {

 let user=  this.getUserFromLocalStorate() 


    if (user == undefined || user == "") {
      return false;
    } else {
      return true;
    }

  }

  isProvider() {

    if (this.isLoggedIn() && this.getUserFromLocalStorate().usertype == 'provider') {
      return true;
    }
    return false;
  }

  isCitizen() {
    if (this.isLoggedIn() && this.getUserFromLocalStorate().usertype == 'citizen') {
      return true;
    }
    return false;

  }



 
  getOne(id:string):Observable<any>{
    return this.http.get(this.config.userGetOneApi+id, { headers: this.config.header })
   }
 
 

}
