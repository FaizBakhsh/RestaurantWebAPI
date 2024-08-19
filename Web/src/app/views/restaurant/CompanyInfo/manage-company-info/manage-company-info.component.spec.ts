import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageCompanyInfoComponent } from './manage-company-info.component';

describe('ManageCompanyInfoComponent', () => {
  let component: ManageCompanyInfoComponent;
  let fixture: ComponentFixture<ManageCompanyInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageCompanyInfoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageCompanyInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
