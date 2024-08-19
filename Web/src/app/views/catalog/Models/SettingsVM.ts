import { EnumLineField } from "../../restaurant/Models/EnumLineField";

export class SettingsVM {
    clientId: number=0
    moduleId: number=0
    module: string
    typeModuleId: number
    name: string = "";
    value: string
    description?: string;
    id: number = 0;
    parentId?: number = 0;
    isActive?: Boolean;
    uploadStatus: Boolean = false;
    keyCode?: string;
    isSystemDefined = false;
    enumTypeId: number = 0;
    settingType?: string
    parentName?: string
    typeKeyCode?: string
    typeParentId!: number
    eLFData: EnumLineField[] = new Array();
    extraFieldsData: Object
    istAccountLevel: Boolean = false;
    levelId: number = 0
    level!: string;
    accountCode?: string
    isChecked: boolean
    
}
