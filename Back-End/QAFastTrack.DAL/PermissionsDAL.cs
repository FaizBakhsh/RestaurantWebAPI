using Dapper;
using Restaurant.Core.Entities.Security;
using MySql.Data.MySqlClient;

using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class PermissionsDAL
    {

        #region Operations

        public bool ManagePermission(PermissionDE Perm, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                cmd.CommandText = "ManagePermission";
                cmd.Parameters.AddWithValue ("@id", Perm.Id);
                cmd.Parameters.AddWithValue ("@routeId", Perm.RouteId);
                cmd.Parameters.AddWithValue ("@userId", Perm.UserId);
                cmd.Parameters.AddWithValue ("@roleId", Perm.RoleId);
                cmd.Parameters.AddWithValue ("@permissionId", Perm.PermissionId);
                cmd.Parameters.AddWithValue ("@createdOn", Perm.CreatedOn);
                cmd.Parameters.AddWithValue ("@createdById", Perm.CreatedById);
                cmd.Parameters.AddWithValue ("@modifiedOn", Perm.ModifiedOn);
                cmd.Parameters.AddWithValue ("@modifiedById", Perm.ModifiedById);
                cmd.Parameters.AddWithValue ("@isActive", Perm.IsActive);
                cmd.Parameters.AddWithValue ("@DBoperation", Perm.DBoperation.ToString ());

                cmd.ExecuteNonQuery ();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Parameters.Clear ();
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<PermissionDE> SearchPermissions(string whereClause, MySqlCommand cmd = null)
        {
            List<PermissionDE> top = new List<PermissionDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<PermissionDE>("call restaurant.SearchPermissions( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion

    }
}
