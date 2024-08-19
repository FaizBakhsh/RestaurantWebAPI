import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageOrderSourceComponent } from './manage-order-source.component';

describe('ManageOrderSourceComponent', () => {
  let component: ManageOrderSourceComponent;
  let fixture: ComponentFixture<ManageOrderSourceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageOrderSourceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageOrderSourceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
