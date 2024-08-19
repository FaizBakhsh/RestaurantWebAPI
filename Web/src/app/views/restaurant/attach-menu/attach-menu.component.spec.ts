import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AttachMenuComponent } from './attach-menu.component';

describe('AttachMenuComponent', () => {
  let component: AttachMenuComponent;
  let fixture: ComponentFixture<AttachMenuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AttachMenuComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AttachMenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
