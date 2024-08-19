import { ComponentFixture, TestBed } from '@angular/core/testing';

import { KitchenDemandComponent } from './kitchen-demand.component';

describe('KitchenDemandComponent', () => {
  let component: KitchenDemandComponent;
  let fixture: ComponentFixture<KitchenDemandComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ KitchenDemandComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(KitchenDemandComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
