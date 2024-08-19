import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EnumLineFieldsComponent } from './enum-line-fields.component';

describe('EnumLineFieldsComponent', () => {
  let component: EnumLineFieldsComponent;
  let fixture: ComponentFixture<EnumLineFieldsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EnumLineFieldsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EnumLineFieldsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
