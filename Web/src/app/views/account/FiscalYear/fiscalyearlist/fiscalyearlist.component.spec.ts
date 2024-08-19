import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FiscalyearlistComponent } from './fiscalyearlist.component';

describe('FiscalyearlistComponent', () => {
  let component: FiscalyearlistComponent;
  let fixture: ComponentFixture<FiscalyearlistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FiscalyearlistComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FiscalyearlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
