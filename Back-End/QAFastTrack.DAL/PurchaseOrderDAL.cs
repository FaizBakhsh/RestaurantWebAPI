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
    public class PurchaseOrderDAL
    {
        #region Header Operations
        public bool ManagePurchaseOrder(PurchaseOrderDE purchaseOrder, MySqlCommand? cmd = null)
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
                cmd.CommandText = "ManagePurchaseOrder";
                cmd.Parameters.AddWithValue("@id", purchaseOrder.Id);
                cmd.Parameters.AddWithValue("@pODate", purchaseOrder.PODate);
                cmd.Parameters.AddWithValue("@pONo", purchaseOrder.PONo);
                cmd.Parameters.AddWithValue("@demandNo", purchaseOrder.DemandNo);
                cmd.Parameters.AddWithValue("@supplierId", purchaseOrder.SupplierId);
                cmd.Parameters.AddWithValue("@branchId", purchaseOrder.BranchId);
                cmd.Parameters.AddWithValue("@itemId", purchaseOrder.ItemId);
                cmd.Parameters.AddWithValue("@itemsPerPkg", purchaseOrder.ItemsPerPkg);
                cmd.Parameters.AddWithValue("@noOfPkg", purchaseOrder.NoOfPkg);
                cmd.Parameters.AddWithValue("@totalQty", purchaseOrder.TotalQty);
                cmd.Parameters.AddWithValue("@pricePerPkg", purchaseOrder.PricePerPkg);
                cmd.Parameters.AddWithValue("@totalAmount", purchaseOrder.TotalAmount);
                cmd.Parameters.AddWithValue("@createdOn", purchaseOrder.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", purchaseOrder.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", purchaseOrder.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", purchaseOrder.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", purchaseOrder.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", purchaseOrder.DBoperation.ToString());

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
        public List<PurchaseOrderDE> SearchPurchaseOrders(string whereClause, MySqlCommand cmd = null)
        {
            List<PurchaseOrderDE> top = new List<PurchaseOrderDE>();
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
                top = cmd.Connection.Query<PurchaseOrderDE>("call Restaurant.SearchPurchaseOrder( '" + whereClause + "')").ToList();
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
        public bool ManagePurchaseOrderLine(PurchaseOrderLineDE poLine, MySqlCommand? cmd)
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
                cmd.CommandText = "ManagePOLine";
                cmd.Parameters.AddWithValue("@id", poLine.Id);
                cmd.Parameters.AddWithValue("@pOId", poLine.POId);
                cmd.Parameters.AddWithValue("@rawItemId", poLine.RawItemId);
                cmd.Parameters.AddWithValue("@package", poLine.Package);
                cmd.Parameters.AddWithValue("@packageItems", poLine.PackageItems);
                cmd.Parameters.AddWithValue("@totalItems", poLine.TotalItems);
                cmd.Parameters.AddWithValue("@price", poLine.Price);
                cmd.Parameters.AddWithValue("@pricePerItem", poLine.PricePerItem);
                cmd.Parameters.AddWithValue("@totalAmount", poLine.TotalAmount);
                cmd.Parameters.AddWithValue("@description", poLine.Description);
                cmd.Parameters.AddWithValue("@createdOn", poLine.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", poLine.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", poLine.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", poLine.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", poLine.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", poLine.DBoperation.ToString());

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
        public List<PurchaseOrderLineDE> SearchPurchaseOrderLines(string whereClause, MySqlCommand cmd = null)
        {
            List<PurchaseOrderLineDE> top = new List<PurchaseOrderLineDE>();
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
                top = cmd.Connection.Query<PurchaseOrderLineDE>("call Restaurant.SearchPurchaseOrderLine( '" + whereClause + "')").ToList();
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
