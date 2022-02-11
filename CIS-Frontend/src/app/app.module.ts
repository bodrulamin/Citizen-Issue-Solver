import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { MainsidebarComponent } from './components/mainsidebar/mainsidebar.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { BlankComponent } from './components/blank/blank.component';
import { AddCategoryComponent } from './components/add-category/add-category.component';
import { ShoutsComponent } from './components/shouts/shouts.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AddShoutComponent } from './components/add-shout/add-shout.component';
import { UserService } from './services/user.service';
import { ConfigService } from './services/config.service';
import { ShoutService } from './services/shout.service';
import { CategoryService } from './services/category.service';
import { IndexComponent } from './components/index/index.component';
import { CategorySidebarComponent } from './components/category-sidebar/category-sidebar.component';
import { ProviderSidebarComponent } from './components/provider-sidebar/provider-sidebar.component';
import { CommonModule } from '@angular/common';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';


import { SubscriptionComponent } from './components/subscription/subscription.component';
import { ToastrService } from './services/toastr.service';
@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    RegisterComponent,
    MainsidebarComponent,
    DashboardComponent,
    BlankComponent,
    AddCategoryComponent,
    ShoutsComponent,
    NavbarComponent,
    AddShoutComponent,
    IndexComponent,
    CategorySidebarComponent,
    ProviderSidebarComponent,
    SubscriptionComponent
  ],

  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
    CommonModule,
    BrowserAnimationsModule,
  ],
  
  providers: [
    UserService,
    ConfigService,
    ShoutService,
    CategoryService,
    ToastrService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
