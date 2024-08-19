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
    public class IssueStockDAL
    {
        #region Operations

        public bool ManageIssueStock(IssueStockDE issueStock, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageIssueStock";
                cmd.Parameters.AddWithValue("@id", issueStock.Id);
                cmd.Parameters.AddWithValue("@issuingBranchId", issueStock.IssuingBranchId);
                cmd.Parameters.AddWithValue("@receivingBranchId", issueStock.ReceivingBranchId);
                cmd.Parameters.AddWithValue("@issueDate", issueStock.IssueDate);
                cmd.Parameters.AddWithValue("@categoryId", issueStock.CategoryId);
                cmd.Parameters.AddWithValue("@keyword", issueStock.Keyword);
                cmd.Parameters.AddWithValue("@createdOn", issueStock.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", issueStock.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", issueStock.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", issueStock.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", issueStock.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", issueStock.DBoperation.ToString());

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
        public List<IssueStockDE> SearchIssueStocks(string whereClause, MySqlCommand cmd = null)
        {
            List<IssueStockDE> top = new List<IssueStockDE>();
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
                top = cmd.Connection.Query<IssueStockDE>("call Restaurant.SearchIssueStock( '" + whereClause + "')").ToList();
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
