import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageSubRecipeComponent } from './manage-sub-recipe.component';

describe('ManageSubRecipeComponent', () => {
  let component: ManageSubRecipeComponent;
  let fixture: ComponentFixture<ManageSubRecipeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageSubRecipeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageSubRecipeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
