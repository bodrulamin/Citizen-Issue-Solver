import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddCategoryComponent } from './components/add-category/add-category.component';
import { AddShoutComponent } from './components/add-shout/add-shout.component';
import { BlankComponent } from './components/blank/blank.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { IndexComponent } from './components/index/index.component';
import { ShoutsComponent } from './components/shouts/shouts.component';
import { SubscriptionComponent } from './components/subscription/subscription.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';

const routes: Routes = [

  {
    path: '', component: HomeComponent, children: [
      { path: '', component: ShoutsComponent },
      { path: 'dashboard', component: DashboardComponent },
      { path: 'blank.html', component: BlankComponent },
      { path: 'addcategory', component: AddCategoryComponent },
      { path: 'addshout', component: AddShoutComponent },
      { path: 'shouts', component: ShoutsComponent },
      { path: 'subscription', component: SubscriptionComponent },
    ]
  },

  { path: 'cis', component: IndexComponent },

  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
