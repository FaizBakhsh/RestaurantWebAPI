import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AttachSubItemComponent } from './attach-sub-item.component';

describe('AttachSubItemComponent', () => {
  let component: AttachSubItemComponent;
  let fixture: ComponentFixture<AttachSubItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AttachSubItemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AttachSubItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
