import { Component, OnInit } from '@angular/core';

import { CategoryService } from 'src/app/services/category.service';
import { ConfigService } from 'src/app/services/config.service';
import { Category } from './category.model';

@Component({
  selector: 'app-add-category',
  templateUrl: './add-category.component.html',
  styleUrls: ['./add-category.component.css']
})
export class AddCategoryComponent implements OnInit {
  categories: any
  c = new Category()
  constructor(
    private categoryService: CategoryService,
    private config: ConfigService
  ) { }

  ngOnInit(): void {
    this.updateCategories()
  }

  addcategory() {

    this.categoryService.addCategory(this.c).subscribe(res => {
      console.log(res);
      this.updateCategories()
      this.config.showToast(res)

    })


  }



  delete(cat: Category) {
    this.categoryService.deleteCategory(cat).subscribe(res => {
      this.updateCategories()
      this.config.showToast(res)
    })
  }

  updateCategories() {
    this.categoryService.getAll().subscribe(res => {
      this.categories = res.data.category
    })
  }
}
