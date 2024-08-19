import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StockEstimationComponent } from './stock-estimation.component';

describe('StockEstimationComponent', () => {
  let component: StockEstimationComponent;
  let fixture: ComponentFixture<StockEstimationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ StockEstimationComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(StockEstimationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
