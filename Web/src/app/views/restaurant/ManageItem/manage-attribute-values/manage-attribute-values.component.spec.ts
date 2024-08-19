import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageAttributeValuesComponent } from './manage-attribute-values.component';

describe('ManageAttributeValuesComponent', () => {
  let component: ManageAttributeValuesComponent;
  let fixture: ComponentFixture<ManageAttributeValuesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageAttributeValuesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageAttributeValuesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
