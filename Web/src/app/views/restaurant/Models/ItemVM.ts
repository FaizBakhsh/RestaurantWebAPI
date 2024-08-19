import { Sizes } from './Enums/Sizes';
import { RecipeVM } from './RecipeVM';
import { SizeVM } from './SizeVM';
import { RuntimeModifierVM } from './RuntimeModifierVM';
export class ItemVM {
  clientId: number = 0
  id: number = 0
  itemCode!: string;
  itemName!: string;
  price!: GLfloat;
  qty!: number;
  categoryId: number = 0;
  subCategoryId: number = 0;
  isActive: boolean;
  inclusiveTax: boolean = true;
  category!: string;
  subCategory!: string
  group?: string;
  itemGroup: string
  size?: string
  store?: string;
  uom?: string
  kds?: string;
  supplier?: string
  branch?: string;
  brand?: string
  color?: string;
  fontColor?: string
  itemType?: string;
  groupId: number = 0;
  brandId: number = 0;
  branchId: number = 0;
  sizeId: number = 0;
  storeId: number = 0;
  colorId: number = 0;
  fontColorId: number = 0;
  kdsId: string;
  uomId: number = 0;
  supplierId: number = 0;
  itemTypeId: number = 0;
  description?: string
  fontSize?: string
  actualPrice!: GLfloat;
  tax!: GLfloat
  kdsId2: number = 0;
  makingTime?: string;
  alarmTime?: string;
  totalItemsAllowed!: number
  startDate?: Date
  currentMargin?: GLfloat;
  barCode?: string;
  target?: GLfloat
  optionalModifier?: boolean = false
  endDate?: Date
  manualQty?: boolean = false
  vendorId: number = 0;
  isCritical?: boolean;
  minOrderLevel?: string;
  packingQty?: number
  maxOrderLevel?: string;
  packingName?: string;
  proposedMargin?: GLfloat;
  proposedPrice?: GLfloat;
  kDS2?: string
  VendorName?: string
  parentId: number = 0;
  isDealItem?: boolean = false;
  typeId!: number;
  stageQty!: number;
  stageId: number = 0
  stage?: string
  dealName?: string
  orderType?: string
  menuItemId: number = 0;
  menuItem?: string
  imageName?: string
  imageSize?: string
  base64FilePath?: string
  Sizes?: SizeVM[] = new Array();
  itemRecipes: RecipeVM[] = new Array();
  productAttribs?: ProductAttribVm[] = new Array();
  kdsIds: number[]
  modifiers: RuntimeModifierVM[] = new Array()
  type: string;
}

export class ProductAttribVm {
  id!: number
  clientId: number = 0
  productId?: number = 0;
  product?: string
  attributeValue?: string
  attribute?: string
  attribId: number = 0
  attribValId: number;
  sizeName?: string;
  groupId: number = 0
  kdsId?: string
  itemId?: number = 0;
  price!: GLfloat;
  tax?: GLfloat;
  cost?: GLfloat;
  actualPrice!: GLfloat;
  suggestedMargin?: GLfloat;
  currentMargin?: GLfloat;
  suggestedPrice?: GLfloat;
  isActive: boolean = true;
  inclusiveTax: boolean = true
  attribValues?: number[];
  dBoperation?: number;
  addMode: boolean = false
  editMode: boolean = false
}