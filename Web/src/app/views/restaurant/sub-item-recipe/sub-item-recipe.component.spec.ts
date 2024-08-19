import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SubItemRecipeComponent } from './sub-item-recipe.component';

describe('SubItemRecipeComponent', () => {
  let component: SubItemRecipeComponent;
  let fixture: ComponentFixture<SubItemRecipeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SubItemRecipeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SubItemRecipeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
