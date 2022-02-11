import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

fullname = ''
  constructor(
    public userService: UserService,
    public rout: Router,
  ) { }

  ngOnInit(): void {
    this.fullname = this.userService.getUserFromLocalStorate().fullname
  }

  logout(){
    this.userService.clearLogin()
    this.rout.navigateByUrl('/login')

  }
  
  profileBtnClicked(){
    if(!this.userService.isLoggedIn()){
    this.rout.navigateByUrl("/login")

    }
    
  }
}
