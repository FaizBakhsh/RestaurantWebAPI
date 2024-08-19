import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignAccountComponent } from './assign-account.component';

describe('AssignAccountComponent', () => {
  let component: AssignAccountComponent;
  let fixture: ComponentFixture<AssignAccountComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AssignAccountComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AssignAccountComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
