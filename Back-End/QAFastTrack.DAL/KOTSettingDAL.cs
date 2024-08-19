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
    public class KOTSettingDAL
    {
        #region Operations
        public bool ManageKOTSetting(KOTSettingDE kotstng, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageKOTSetting";
                cmd.Parameters.AddWithValue("@id", kotstng.Id);
                cmd.Parameters.AddWithValue ("@clientId", kotstng.ClientId);
                cmd.Parameters.AddWithValue("@kDSName", kotstng.KDSName);
                cmd.Parameters.AddWithValue("@printerId", kotstng.PrinterId);
                cmd.Parameters.AddWithValue("@kitchenBell", kotstng.KitchenBell);
                cmd.Parameters.AddWithValue("@createdOn", kotstng.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", kotstng.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", kotstng.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", kotstng.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", kotstng.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", kotstng.DBoperation.ToString());

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
        public List<KOTSettingDE> SearchKOTSettings(string whereClause, MySqlCommand cmd = null)
        {
            List<KOTSettingDE> top = new List<KOTSettingDE>();
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
                top = cmd.Connection.Query<KOTSettingDE>("call Restaurant.SearchKOTSetting( '" + whereClause + "')").ToList();
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
