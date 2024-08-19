import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageUOMConversionComponent } from './manage-uomconversion.component';

describe('ManageUOMConversionComponent', () => {
  let component: ManageUOMConversionComponent;
  let fixture: ComponentFixture<ManageUOMConversionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageUOMConversionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageUOMConversionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
