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
    public class PurchaseReturnDAL
    {
        #region Header Operations
        public bool ManagePurchaseReturn(PurchaseReturnDE purRet, MySqlCommand? cmd )
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
                cmd.CommandText = "ManagePurchaseReturn";
                cmd.Parameters.AddWithValue("@id", purRet.Id);
                cmd.Parameters.AddWithValue("@branchId", purRet.BranchId);
                cmd.Parameters.AddWithValue("@supplierId", purRet.SupplierId);
                cmd.Parameters.AddWithValue("@invoiceNo", purRet.InvoiceNo);
                cmd.Parameters.AddWithValue("@returnDate", purRet.ReturnDate);
                cmd.Parameters.AddWithValue("@createdOn", purRet.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", purRet.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", purRet.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", purRet.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", purRet.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", purRet.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
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
        public List<PurchaseReturnDE> SearchPurchaseReturns(string whereClause, MySqlCommand cmd = null)
        {
            List<PurchaseReturnDE> top = new List<PurchaseReturnDE>();
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
                top = cmd.Connection.Query<PurchaseReturnDE>("call Restaurant.SearchPurchaseReturn( '" + whereClause + "')").ToList();
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
                cmd.Parameters.Clear();
            }
        }
        #endregion
        #region Line Operations
        public bool ManagePurchaseReturnLine(PurchaseReturnLineDE prLine, MySqlCommand? cmd )
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
                cmd.CommandText = "ManagePRLine";
                cmd.Parameters.AddWithValue("@id", prLine.Id);
                cmd.Parameters.AddWithValue("@pRId", prLine.PRId);
                cmd.Parameters.AddWithValue("@itemId", prLine.ItemId);
                cmd.Parameters.AddWithValue("@uOMId", prLine.UOMId);
                cmd.Parameters.AddWithValue("@totalItems", prLine.TotalItems);
                cmd.Parameters.AddWithValue("@pricePerItem", prLine.PricePerItem);
                cmd.Parameters.AddWithValue("@totalAmt", prLine.TotalAmt);
                cmd.Parameters.AddWithValue("@date", prLine.Date);
                cmd.Parameters.AddWithValue("@returnQty", prLine.ReturnQty);
                cmd.Parameters.AddWithValue("@createdOn", prLine.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", prLine.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", prLine.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", prLine.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", prLine.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", prLine.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
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
        public List<PurchaseReturnLineDE> SearchPurchaseReturnLines(string whereClause, MySqlCommand cmd = null)
        {
            List<PurchaseReturnLineDE> top = new List<PurchaseReturnLineDE>();
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
                top = cmd.Connection.Query<PurchaseReturnLineDE>("call Restaurant.SearchPurchaseReturnLine( '" + whereClause + "')").ToList();
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
