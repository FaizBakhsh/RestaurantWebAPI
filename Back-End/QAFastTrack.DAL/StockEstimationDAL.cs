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
    public class StockEstimationDAL
    {
        #region Operations

        public bool ManageStockEstimation(StockEstimationDE stkEst, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageStockEstimation";
                cmd.Parameters.AddWithValue("@id", stkEst.Id);
                cmd.Parameters.AddWithValue("@GroupId", stkEst.GroupId);
                cmd.Parameters.AddWithValue("@OrderNo", stkEst.OrderNo);
                cmd.Parameters.AddWithValue("@date", stkEst.Date);
                cmd.Parameters.AddWithValue("@item", stkEst.Item);
                cmd.Parameters.AddWithValue("@createdOn", stkEst.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", stkEst.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", stkEst.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", stkEst.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", stkEst.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", stkEst.DBoperation.ToString());

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
        public List<StockEstimationDE> SearchStockEstimations(string whereClause, MySqlCommand cmd = null)
        {
            List<StockEstimationDE> top = new List<StockEstimationDE>();
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
                top = cmd.Connection.Query<StockEstimationDE>("call Restaurant.SearchStockEstimation( '" + whereClause + "')").ToList();
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
