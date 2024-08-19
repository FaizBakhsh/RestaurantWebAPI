using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Security;

namespace Restaurant.Service.IServices
{
    public interface IPermissionService
    {
        List<PermissionDE> SearchPermissions ( PermissionDE mod );
        List<PermissionDE> SearchPerms ( PermissionDE mod );
        List<PermissionDE> GetPermsByUserOrRole ( string UserId, int RoleId );
        bool ManagementPermissions ( List<PermissionDE> perms );
        List<SettingsDE> GetRoutes ( );
    }
}
