import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-provider-sidebar',
  templateUrl: './provider-sidebar.component.html',
  styleUrls: ['./provider-sidebar.component.css']
})
export class ProviderSidebarComponent implements OnInit {

  constructor(private rout: Router) { }

  ngOnInit(): void {
  }


}
