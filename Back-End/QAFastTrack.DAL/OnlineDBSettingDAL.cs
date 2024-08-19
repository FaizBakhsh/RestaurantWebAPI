using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class OnlineDBSettingDAL
    {
        #region Operations
        public bool ManageOnlineDBSetting(OnlineDBSettingDE oDBStng, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageOnlineDBSetting";
                cmd.Parameters.AddWithValue("@id", oDBStng.Id);
                cmd.Parameters.AddWithValue ("@clientId", oDBStng.ClientId);
                cmd.Parameters.AddWithValue("@serverName", oDBStng.ServerName);
                cmd.Parameters.AddWithValue("@dataBaseName", oDBStng.DataBaseName);
                cmd.Parameters.AddWithValue("@userName", oDBStng.UserName);
                cmd.Parameters.AddWithValue("@password", oDBStng.Password);
                cmd.Parameters.AddWithValue("@createdOn", oDBStng.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", oDBStng.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", oDBStng.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", oDBStng.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", oDBStng.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", oDBStng.DBoperation.ToString());

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
        public List<OnlineDBSettingDE> SearchOnlineDBSettings(string whereClause, MySqlCommand cmd = null)
        {
            List<OnlineDBSettingDE> top = new List<OnlineDBSettingDE>();
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
                top = cmd.Connection.Query<OnlineDBSettingDE>("call Restaurant.SearchOnlineDBSetting( '" + whereClause + "')").ToList();
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
