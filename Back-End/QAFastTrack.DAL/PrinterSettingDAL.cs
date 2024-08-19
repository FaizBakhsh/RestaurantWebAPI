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
    public class PrinterSettingDAL
    {
        #region Operations
        public bool ManagePrinterSetting(PrinterSettingDE printerStng, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManagePrinterSetting";
                cmd.Parameters.AddWithValue("@id", printerStng.Id);
                cmd.Parameters.AddWithValue ("@clientId", printerStng.ClientId);
                cmd.Parameters.AddWithValue("@categoryId", printerStng.CategoryId);
                cmd.Parameters.AddWithValue ("@subCategoryId", printerStng.SubCategoryId);
                cmd.Parameters.AddWithValue("@printerId", printerStng.PrinterId);
                cmd.Parameters.AddWithValue("@noofPrints", printerStng.NoofPrints);
                cmd.Parameters.AddWithValue("@createdOn", printerStng.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", printerStng.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", printerStng.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", printerStng.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", printerStng.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", printerStng.DBoperation.ToString());

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
        public List<PrinterSettingDE> SearchPrinterSettings(string whereClause, MySqlCommand cmd = null)
        {
            List<PrinterSettingDE> top = new List<PrinterSettingDE>();
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
                top = cmd.Connection.Query<PrinterSettingDE>("call Restaurant.SearchPrinterSetting( '" + whereClause + "')").ToList();
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
