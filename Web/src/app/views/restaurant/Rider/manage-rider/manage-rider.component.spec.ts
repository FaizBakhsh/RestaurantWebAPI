import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageRiderComponent } from './manage-rider.component';

describe('ManageRiderComponent', () => {
  let component: ManageRiderComponent;
  let fixture: ComponentFixture<ManageRiderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageRiderComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageRiderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
