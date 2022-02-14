import { Component, OnInit } from '@angular/core';
import { CategoryService } from 'src/app/services/category.service';
import {ToastService} from "../../services/toast.service";

@Component({
  selector: 'app-subscription',
  templateUrl: './subscription.component.html',
  styleUrls: ['./subscription.component.css']
})
export class SubscriptionComponent implements OnInit {

  constructor(
    private categoryService: CategoryService,
    private toast: ToastService
  ) { }

  categories:any
  ngOnInit(): void {

    this.categoryService.getAll().subscribe(res=>{
      this.categories = res.data.category
    })
  }

  subscribe(catname: string){
    console.log(catname + 'subscribe')
    this.toast.success('Subscribed to ' + catname)
  }
  unsubscribe(catname: string){
    this.toast.success('Unubscribed to ' + catname)
  }

}
