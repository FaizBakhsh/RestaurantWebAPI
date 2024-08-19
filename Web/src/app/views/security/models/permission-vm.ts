export class PermissionVM {
    id?: number;
    route?: string;
    user?: string;
    role?: string;
    resource?: string;
    isActive: boolean = true;
    userId?: string = '';
    roleId: number = 0;
    routeId: number;
    permissionId: number;
    permission?: string;
    isReadOnly?: boolean
}