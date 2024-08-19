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
    public class SettingsDAL
    {
        #region Operations
        public bool ManageSettings(SettingsDE stng, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageSettings";
                cmd.Parameters.AddWithValue("@id", stng.Id);
                cmd.Parameters.AddWithValue ("@clientId", stng.ClientId);
                cmd.Parameters.AddWithValue ("@moduleId", stng.ModuleId);
                cmd.Parameters.AddWithValue("@name", stng.Name);
                cmd.Parameters.AddWithValue("@description", stng.Description);
                cmd.Parameters.AddWithValue("@keyCode", stng.KeyCode);
                cmd.Parameters.AddWithValue ("@value", stng.Value);
                cmd.Parameters.AddWithValue ("@levelId", stng.LevelId);
                cmd.Parameters.AddWithValue ("@accountCode", stng.AccountCode);
                cmd.Parameters.AddWithValue("@isSystemDefined", stng.IsSystemDefined);
                cmd.Parameters.AddWithValue("@uploadStatus", stng.UploadStatus);
                cmd.Parameters.AddWithValue("@parentId", stng.ParentId);
                cmd.Parameters.AddWithValue("@enumTypeId", stng.EnumTypeId);
                cmd.Parameters.AddWithValue("@createdOn", stng.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", stng.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", stng.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", stng.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", stng.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", stng.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
                cmd.Parameters.Clear();
            }
        }
        public List<SettingsDE> SearchSettingss(string whereClause, MySqlCommand cmd = null)
        {
            List<SettingsDE> top = new List<SettingsDE>();
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
                top = cmd.Connection.Query<SettingsDE>("call Restaurant.SearchSettings( '" + whereClause + "')").ToList();
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
