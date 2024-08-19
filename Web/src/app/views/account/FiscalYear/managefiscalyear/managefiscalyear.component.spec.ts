import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManagefiscalyearComponent } from './managefiscalyear.component';

describe('ManagefiscalyearComponent', () => {
  let component: ManagefiscalyearComponent;
  let fixture: ComponentFixture<ManagefiscalyearComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManagefiscalyearComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManagefiscalyearComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
