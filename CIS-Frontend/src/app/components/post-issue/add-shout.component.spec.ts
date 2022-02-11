import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddShoutComponent } from './add-shout.component';

describe('AddShoutComponent', () => {
  let component: AddShoutComponent;
  let fixture: ComponentFixture<AddShoutComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddShoutComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddShoutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
