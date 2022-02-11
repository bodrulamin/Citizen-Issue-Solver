import { Component, OnInit } from '@angular/core';
import { CategoryService } from 'src/app/services/category.service';

@Component({
  selector: 'app-subscription',
  templateUrl: './subscription.component.html',
  styleUrls: ['./subscription.component.css']
})
export class SubscriptionComponent implements OnInit {

  constructor(
    private categoryService: CategoryService
  ) { }

  categories:any
  ngOnInit(): void {

    this.categoryService.getAll().subscribe(res=>{
      this.categories = res.data.category
    })
  }

}
