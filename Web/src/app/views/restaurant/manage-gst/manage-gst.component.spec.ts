import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageGSTComponent } from './manage-gst.component';

describe('ManageGSTComponent', () => {
  let component: ManageGSTComponent;
  let fixture: ComponentFixture<ManageGSTComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageGSTComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageGSTComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
