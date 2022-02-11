import { Injectable } from '@angular/core';
import { ToastService } from './toast.service';

@Injectable({
  providedIn: 'root'
})
export class ConfigService {
  header = { "Content-Type": "application/json" }

  host = 'http://localhost:8080'

  signupApi = this.host + '/signup'
  signinApi = this.host + '/signin'

  userAddApi = this.host + '/user/add'
  userUpdateApi = this.host + '/user/update'
  userDeleteApi = this.host + '/user/delete'
  userGetAllApi = this.host + '/user/getAll'
  userGetOneApi = this.host + '/user/getOne/'


  categoryAddApi = this.host + '/category/add'
  categoryUpdateApi = this.host + '/category/update'
  categoryDeleteApi = this.host + '/category/delete'
  categoryGetAllApi = this.host + '/category/getAll'
  categoryGetOneApi = this.host + '/category/getOne/'

  shoutAddApi = this.host + '/shout/add'
  shoutUpdateApi = this.host + '/shout/update'
  shoutDeleteApi = this.host + '/shout/delete'
  shoutGetAllApi = this.host + '/shout/getAll'
  shoutGetOneApi = this.host + '/shout/getOne/'
  shoutUpdateStatusApi = this.host + '/shout/updatestatus'

  constructor(private toast:ToastService) { }

  showToast(res: any) {
    switch (res.status) {
      case 'success':
        this.toast.success(res.msg)

        break;
      case 'failed':
        this.toast.error(res.msg)

        break;

      default:
        break;
    }
  }

}
