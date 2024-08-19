using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class SettingsTypeDAL
    {
        #region Operations
        public bool ManageSettingsType(SettingsTypeDE stngType, MySqlCommand cmd = null)
        {
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
                cmd.CommandText = "ManageSettingsType";
                cmd.Parameters.AddWithValue("@id", stngType.Id);
                cmd.Parameters.AddWithValue ("@clientId", stngType.ClientId);
                cmd.Parameters.AddWithValue ("@moduleId", stngType.ModuleId);
                cmd.Parameters.AddWithValue("@name", stngType.Name);
                cmd.Parameters.AddWithValue("@description", stngType.Description);
                cmd.Parameters.AddWithValue("@keyCode", stngType.KeyCode);
                cmd.Parameters.AddWithValue("@isSystemDefined", stngType.IsSystemDefined);
                cmd.Parameters.AddWithValue("@uploadStatus", stngType.UploadStatus);
                cmd.Parameters.AddWithValue("@parentId", stngType.ParentId);
                cmd.Parameters.AddWithValue ("@IsAccountLevel", stngType.IsAccountLevel);
                cmd.Parameters.AddWithValue("@createdOn", stngType.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", stngType.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", stngType.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", stngType.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", stngType.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", stngType.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<SettingsTypeDE> SearchSettingsTypes(string whereClause, MySqlCommand cmd = null)
        {
            List<SettingsTypeDE> top = new List<SettingsTypeDE>();
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
                top = cmd.Connection.Query<SettingsTypeDE>("call Restaurant.SearchSettingsType( '" + whereClause + "')").ToList();
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
