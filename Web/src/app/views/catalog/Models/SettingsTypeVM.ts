import { SettingsVM } from "./SettingsVM";

export class SettingsTypeVM {
    moduleId?: number=0
    clientId?: number=0
    name?: string;
    description?: string;
    id: number = 0;
    parentKeyCode?: string;
    keyCode: string = "";
    isSystemDefined = false;
    parentId: number = 0;
    isActive?: Boolean = true;
    parentName?: string
    uploadStatus: Boolean = false;
    pparentId!: number
    settings: SettingsVM[] = new Array()
    eLFieldsData: Object[] = new Array()
    eLFD: Object[] = new Array()
    isAccountLevel: Boolean = false;
}