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
    public class CompanyInfoDAL
    {
        #region Operations
        public bool ManageCompanyInfo(CompanyInfoDE comInfo, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageCompanyInfo";
                cmd.Parameters.AddWithValue("@id", comInfo.Id);
                cmd.Parameters.AddWithValue ("@clientId", comInfo.ClientId);
                cmd.Parameters.AddWithValue("@name", comInfo.Name);
                cmd.Parameters.AddWithValue("@phoneNo", comInfo.PhoneNo);
                cmd.Parameters.AddWithValue("@address", comInfo.Address);
                cmd.Parameters.AddWithValue("@billNote", comInfo.BillNote);
                cmd.Parameters.AddWithValue("@logoBase64Path", comInfo.LogoBase64Path);
                cmd.Parameters.AddWithValue("@createdOn", comInfo.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", comInfo.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", comInfo.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", comInfo.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", comInfo.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", comInfo.DBoperation.ToString());

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
        public List<CompanyInfoDE> SearchCompanyInfos(string whereClause, MySqlCommand cmd = null)
        {
            List<CompanyInfoDE> top = new List<CompanyInfoDE>();
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
                top = cmd.Connection.Query<CompanyInfoDE>("call Restaurant.SearchCompanyInfo( '" + whereClause + "')").ToList();
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
