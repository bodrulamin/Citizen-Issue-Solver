import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastService } from '../services/toast.service';

import { UserService } from '../services/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {


  fg = new FormGroup({
    username: new FormControl("citizen", [Validators.pattern("[a-zA-Z0-9]{6,20}")]),
    password: new FormControl("citizen", [Validators.pattern("[a-zA-Z0-9]{6,20}")]),


  })
  constructor(
    private userService: UserService,
    private rout: Router,
    private toast: ToastService,

  ) { }

  ngOnInit(): void {
  }

  login() {
    console.log(this.fg.value);

    this.userService.signin(this.fg).subscribe(res => {
      console.log(res);

      if (res.status == 'success') {
        this.toast.info(res.msg)
        this.userService.saveUserToLocalStorage(JSON.stringify(res.data))
        this.rout.navigate(['/'])
      }
      else {

        this.toast.error(res.msg, res.status)
      }
    },err=>{
      this.toast.error(err.message,err.name);
      console.log(err);

    })


  }
}
