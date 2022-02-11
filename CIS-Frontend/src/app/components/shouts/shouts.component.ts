import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { CategoryService } from 'src/app/services/category.service';
import { ConfigService } from 'src/app/services/config.service';
import { ShoutService } from 'src/app/services/shout.service';
import { UserService } from 'src/app/services/user.service';
import { Shout, ShoutStatus } from './shout.model';
import {ToastService} from "../../services/toast.service";

@Component({
  selector: 'app-shouts',
  templateUrl: './shouts.component.html',
  styleUrls: ['./shouts.component.css']
})
export class ShoutsComponent implements OnInit {


  localUser: any
  shouts: Shout[] = []
  methodToGetShouts: any
  shoutStatus = ShoutStatus
  allShouts: Shout[] = []
  constructor(
    private shoutService: ShoutService,
    private rout: Router,
    public userService: UserService,
    private toast: ToastService,
    private config: ConfigService,
    private activatedRout: ActivatedRoute,
    private categoryService: CategoryService
  ) { }

  ngOnInit(): void {
    if (this.userService.isProvider()) {
      this.methodToGetShouts = this.reloadAllShout
      //this.methodToGetShouts = this.reloadShoutForProvider
    } else if (this.userService.isCitizen()) {
      this.methodToGetShouts = this.reloadShoutOfUser

    } else {
      this.methodToGetShouts = this.reloadAllShout
    }

    this.methodToGetShouts()

  }

  filterStatus() {


    this.activatedRout.queryParams.subscribe(params => {
      let status = params['status']
      console.log(status);


      if (status) {
        this.shouts = this.allShouts.filter(s => s.status == status)
        console.log("filterd");


      } else {
        this.shouts = this.allShouts;
        console.log('ese');

      }
    })


  }
  reloadShoutForProvider() {
    this.localUser = this.userService.getUserFromLocalStorate()

    this.shoutService.getAllOfCurrentProvider(this.localUser.id).subscribe(res => {
      console.log(res);
      this.setShouts(res)

      this.filterStatus()
    })
  }

  setShouts(res: any) {

    this.allShouts = res.data.shout

    this.allShouts.forEach(s => {
      this.categoryService.getOne(s.categoryId.toString()).subscribe(res => {
        console.log(res);

        s.categoryName = res.data.category.name
      })
      this.userService.getOne(s.shouterId.toString()).subscribe(res => {
        console.log("shouter name" + JSON.stringify(res));

        s.shouterName = res.data.user.fullname
      })


    })


  }

  reloadShoutOfUser() {

    this.localUser = this.userService.getUserFromLocalStorate()

    this.shoutService.getAllOfCurrentCitizen(this.localUser.id).subscribe(res => {
      console.log(res);
      this.setShouts(res)

      this.filterStatus()
    })
  }
  reloadAllShout() {

    this.localUser = this.userService.getUserFromLocalStorate()

    this.shoutService.getAll().subscribe(res => {
      console.log(res);
      this.setShouts(res)

      this.filterStatus()
    })
  }

  loginToShout() {
    if (this.userService.isLoggedIn()) {
      this.rout.navigate(['/addshout'])
    } else if (!this.userService.isLoggedIn()) {
      this.toast.info("Please login to create a shout")
      this.rout.navigate(['/login'])
    }
  }
  delete(s: Shout) {
    this.shoutService.deleteShout(s).subscribe(res => {
      console.log(res);
      this.config.showToast(res)
      this.methodToGetShouts()
    })
  }


  edit(s: Shout) {
    this.rout.navigate(['/addshout'], { state: { shout: s } })
  }

  showText(s: Shout) {
    s.isReadmore = !s.isReadmore

  }

  start(s: Shout) {


    switch (s.status) {
      case ShoutStatus.started:
        this.toast.info("Issue solving process is already started!")
        break;

      case ShoutStatus.completed:
        this.toast.info("The issue is solved !")
        break;

      case ShoutStatus.draft:
        s.status = ShoutStatus.started
        s.actionTakerId = this.userService.getUserFromLocalStorate().id
        this.shoutService.updateShoutStatus(s).subscribe(res => {
          if (res.status == 'success') {
            this.toast.success("Issue is marked as started")
          }

        })
        break;
      default:
        break;
    }




  }
  markAsCompleted(s: Shout) {

    if (s.status == this.shoutStatus.draft) {
      this.toast.error("Please start the process first!")
    } else if (s.status == this.shoutStatus.started) {

      s.status = ShoutStatus.completed
      this.shoutService.updateShoutStatus(s).subscribe(res => {
        this.toast.success("Message","Issue Marked as completed successfully !")

      })
    } else if (s.status == this.shoutStatus.completed) {
      s.status = ShoutStatus.completed
      this.toast.info("The issue is solved !")

    }



  }

  getStatusClass(s: Shout) {
    switch (s.status) {
      case ShoutStatus.started:
        return "article-badge-item bg-info"


      case ShoutStatus.completed:
        return "article-badge-item bg-success"


      case ShoutStatus.draft:
        return "article-badge-item bg-danger"

      default:
        break;
    }

    return "article-badge-item bg-danger"
  }


  getUrl(photo: any) {
    return "url('"+photo+"')";
  }
}
