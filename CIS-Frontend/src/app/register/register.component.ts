import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '../services/toast.service';

import { UserService } from '../services/user.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  userType = 'citizen'

  fg = new FormGroup({
    fullname: new FormControl(""),

    username: new FormControl(""),
    password: new FormControl(""),
    password2: new FormControl(""),
    email: new FormControl(""),
    address: new FormControl(""),
    usertype: new FormControl(""),
  })



  constructor(
    private activatedRout: ActivatedRoute,
    private rout: Router,
    private userService: UserService,
    private toast:ToastService,
    ) { }

  ngOnInit(): void {
    this.setUserType();


  }
  register(){
    this.fg.get('usertype')?.setValue(this.userType)

    this.userService.signup(this.fg).subscribe(res=>{
      console.log(res);
      if(res.status == 'success'){
          this.toast.success(res.message,res.status)
        this.userService.saveUserToLocalStorage(JSON.stringify(res.data))
        this.rout.navigate(['/'])
      }
      else{

          this.toast.error(res.message)
      }
    })

  }

  setUserType() {
    this.activatedRout.queryParams.subscribe(params => {
      switch (params['userType']) {
        case 'citizen':
        case 'provider': this.userType = params['userType']
          break;
      }

    })
  }
}
