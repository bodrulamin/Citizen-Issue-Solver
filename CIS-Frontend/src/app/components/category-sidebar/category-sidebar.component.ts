import { Component, OnInit } from '@angular/core';
import { CategoryService } from 'src/app/services/category.service';

@Component({
  selector: 'app-category-sidebar',
  templateUrl: './category-sidebar.component.html',
  styleUrls: ['./category-sidebar.component.css']
})
export class CategorySidebarComponent implements OnInit {

  categories: any
  constructor(private catService:CategoryService) { }

  ngOnInit(): void {
   this.catService.getAll().subscribe(res=>{
     console.log(res);
   
     this.categories = res.data.category
   }) 
  }

}
