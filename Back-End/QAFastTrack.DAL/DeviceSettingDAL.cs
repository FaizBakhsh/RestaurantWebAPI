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
    public class DeviceSettingDAL
    {
        #region Operations
        public bool ManageDeviceSetting(DeviceSettingDE devStng, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageDeviceSetting";
                cmd.Parameters.AddWithValue("@id", devStng.Id);
                cmd.Parameters.AddWithValue ("@clientId", devStng.ClientId);
                cmd.Parameters.AddWithValue("@deviceId", devStng.DeviceId);
                cmd.Parameters.AddWithValue("@screenNo", devStng.ScreenNo);
                cmd.Parameters.AddWithValue("@terminal", devStng.Terminal);
                cmd.Parameters.AddWithValue("@isEnable", devStng.IsEnable);
                cmd.Parameters.AddWithValue("@createdOn", devStng.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", devStng.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", devStng.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", devStng.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", devStng.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", devStng.DBoperation.ToString());

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
        public List<DeviceSettingDE> SearchDeviceSettings(string whereClause, MySqlCommand cmd = null)
        {
            List<DeviceSettingDE> top = new List<DeviceSettingDE>();
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
                top = cmd.Connection.Query<DeviceSettingDE>("call Restaurant.SearchDeviceSetting( '" + whereClause + "')").ToList();
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
