import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CategoryService } from 'src/app/services/category.service';
import { ConfigService } from 'src/app/services/config.service';
import { ShoutService } from 'src/app/services/shout.service';
import { UserService } from 'src/app/services/user.service';
import { Shout } from '../shouts/shout.model';

@Component({
  selector: 'app-add-shout',
  templateUrl: './add-shout.component.html',
  styleUrls: ['./add-shout.component.css']
})
export class AddShoutComponent implements OnInit {

  shout = new Shout()
  categories: any
  constructor(
    private shoutService: ShoutService,
    private categoryService: CategoryService,
    private rout: Router,
    private userService: UserService,
    private config: ConfigService
  ) { }

  ngOnInit(): void {

    this.categoryService.getAll().subscribe(res => {
      console.log(res);

      this.categories = res.data.category

    })

    let gotShout = history.state.shout
    if (gotShout) {
      this.shout = gotShout;
    }
  }

  postShout() {
    this.shout.shouterId = this.userService.getUserFromLocalStorate().id
console.log("add-shout " + JSON.stringify(this.shout));


    this.shoutService.addShout(this.shout).subscribe(res => {
      console.log(res);
      this.config.showToast(res)
      this.rout.navigateByUrl("/shouts")

    })
  }

}
