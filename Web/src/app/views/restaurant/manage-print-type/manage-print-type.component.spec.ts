import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManagePrintTypeComponent } from './manage-print-type.component';

describe('ManagePrintTypeComponent', () => {
  let component: ManagePrintTypeComponent;
  let fixture: ComponentFixture<ManagePrintTypeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManagePrintTypeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManagePrintTypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
