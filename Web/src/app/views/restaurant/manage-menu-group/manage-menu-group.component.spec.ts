import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageMenuGroupComponent } from './manage-menu-group.component';

describe('ManageMenuGroupComponent', () => {
  let component: ManageMenuGroupComponent;
  let fixture: ComponentFixture<ManageMenuGroupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageMenuGroupComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageMenuGroupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
