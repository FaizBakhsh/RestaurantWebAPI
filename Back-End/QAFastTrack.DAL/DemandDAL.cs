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
    public class DemandDAL
    {
        #region Operations
        public bool ManageDemand(DemandDE demand, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageDemand";
                cmd.Parameters.AddWithValue("@id", demand.Id);
                cmd.Parameters.AddWithValue("@branchId", demand.BranchId);
                cmd.Parameters.AddWithValue("@itemId", demand.ItemId);
                cmd.Parameters.AddWithValue("@date", demand.Date);
                cmd.Parameters.AddWithValue("@createdOn", demand.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", demand.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", demand.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", demand.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", demand.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", demand.DBoperation.ToString());

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
        public List<DemandDE> SearchDemands(string whereClause, MySqlCommand cmd = null)
        {
            List<DemandDE> top = new List<DemandDE>();
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
                top = cmd.Connection.Query<DemandDE>("call Restaurant.SearchDemand( '" + whereClause + "')").ToList();
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
