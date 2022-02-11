import {Injectable} from '@angular/core';
import {HotToastService} from "@ngneat/hot-toast";

@Injectable({
  providedIn: 'root'
})
export class ToastService {

  constructor(
    private toast: HotToastService
  ) {
  }

  info(title = "", message = "") {
    this.toast.info(title + "" + message);
  }

  success(title = "", message = "") {
    this.toast.success(title + "" + message);
  }

  error(title = "", message = "") {
    // this.toast.show(message);
    //
    // this.toast.warning(message);
    this.toast.error(title + "" + message);

  }
}
