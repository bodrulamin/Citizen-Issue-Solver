import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-blank',
  templateUrl: './blank.component.html',
  styleUrls: ['./blank.component.css']
})
export class BlankComponent implements OnInit {

  formGroup = new FormGroup({
    fullname: new FormControl("",[]),
    username: new FormControl("",[]),
  });
  constructor(
    private http: HttpClient
  ) { }

  ngOnInit(): void {
  }

  login(){
    console.log(this.formGroup.value);
    this.http.post("https://localhost:8080/test",this.formGroup.value).subscribe(res=>{
      console.log(res);
      
    })
    
  }
}
