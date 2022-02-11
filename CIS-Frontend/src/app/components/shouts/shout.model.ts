export enum ShoutStatus {
  draft = 'draft', started = 'started', completed = 'completed'
}

export class Shout {
  id: number = 0
  shouterId: number = 0
  actionTakerId = 0;
  categoryId = 0;
  shoutTitle = '';
  shoutmessage = '';
  address = ''
  status = ShoutStatus.draft;
  isReadmore = true;
  date = new Date()
  categoryName: any
  shouterName: any
  photo: any
}
