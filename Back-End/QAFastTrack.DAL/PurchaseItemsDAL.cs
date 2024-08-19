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
    public class PurchaseItemsDAL
    {
        #region Header Operations
        public bool ManagePurchaseItems(PurchaseItemsDE purchaseItems, MySqlCommand? cmd = null)
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
                cmd.CommandText = "ManagePurchaseItems";
                cmd.Parameters.AddWithValue("@id", purchaseItems.Id);
                cmd.Parameters.AddWithValue("@date", purchaseItems.Date);
                cmd.Parameters.AddWithValue("@branchId", purchaseItems.BranchId);
                cmd.Parameters.AddWithValue("@grn", purchaseItems.GRN);
                cmd.Parameters.AddWithValue("@storeId", purchaseItems.StoreId);
                cmd.Parameters.AddWithValue("@supplierId", purchaseItems.SupplierId);
                cmd.Parameters.AddWithValue("@groupId", purchaseItems.GroupId);
                cmd.Parameters.AddWithValue("@itemId", purchaseItems.ItemId);
                cmd.Parameters.AddWithValue("@itemsPerPkg", purchaseItems.ItemsPerPkg);
                cmd.Parameters.AddWithValue("@noOfPkg", purchaseItems.NoOfPkg);
                cmd.Parameters.AddWithValue("@totalQty", purchaseItems.TotalQty);
                cmd.Parameters.AddWithValue("@pricePerPkg", purchaseItems.PricePerPkg);
                cmd.Parameters.AddWithValue("@totalAmount", purchaseItems.TotalAmount);
                cmd.Parameters.AddWithValue("@description", purchaseItems.Description);
                cmd.Parameters.AddWithValue("@pricePerItem", purchaseItems.PricePerItem);
                cmd.Parameters.AddWithValue("@purchaseTypeId", purchaseItems.PurchaseTypeId);
                cmd.Parameters.AddWithValue("@invoiceNo", purchaseItems.InvoiceNo);
                cmd.Parameters.AddWithValue("@poNo", purchaseItems.PoNo);
                cmd.Parameters.AddWithValue("@expiryDate", purchaseItems.ExpiryDate);
                cmd.Parameters.AddWithValue("@ttlAmount", purchaseItems.TtlAmount);
                cmd.Parameters.AddWithValue("@createdOn", purchaseItems.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", purchaseItems.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", purchaseItems.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", purchaseItems.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", purchaseItems.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", purchaseItems.DBoperation.ToString());

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
        public List<PurchaseItemsDE> SearchPurchaseItems(string whereClause, MySqlCommand cmd = null)
        {
            List<PurchaseItemsDE> top = new List<PurchaseItemsDE>();
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
                top = cmd.Connection.Query<PurchaseItemsDE>("call Restaurant.SearchPurchaseItems( '" + whereClause + "')").ToList();
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
        public bool ManagePurchaseItemsLine(PurchaseItemsLineDE piLine, MySqlCommand? cmd)
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
                cmd.CommandText = "ManagePILine";
                cmd.Parameters.AddWithValue("@id", piLine.Id);
                cmd.Parameters.AddWithValue("@pIId", piLine.PIId);
                cmd.Parameters.AddWithValue("@rawItemId", piLine.RawItemId);
                cmd.Parameters.AddWithValue("@package", piLine.Package);
                cmd.Parameters.AddWithValue("@packageItems", piLine.PackageItems);
                cmd.Parameters.AddWithValue("@totalItems", piLine.TotalItems);
                cmd.Parameters.AddWithValue("@price", piLine.Price);
                cmd.Parameters.AddWithValue("@pricePerItem", piLine.PricePerItem);
                cmd.Parameters.AddWithValue("@totalAmount", piLine.TotalAmount);
                cmd.Parameters.AddWithValue("@branchId", piLine.BranchId);
                cmd.Parameters.AddWithValue("@description", piLine.Description);
                cmd.Parameters.AddWithValue("@expiry", piLine.Expiry);
                cmd.Parameters.AddWithValue("@createdOn", piLine.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", piLine.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", piLine.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", piLine.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", piLine.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", piLine.DBoperation.ToString());

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
        public List<PurchaseItemsLineDE> SearchPurchaseItemsLine(string whereClause, MySqlCommand cmd = null)
        {
            List<PurchaseItemsLineDE> top = new List<PurchaseItemsLineDE>();
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
                top = cmd.Connection.Query<PurchaseItemsLineDE>("call Restaurant.SearchPurchaseItemsLine( '" + whereClause + "')").ToList();
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
