using Dapper;
using Restaurant.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.DAL;

namespace Restaurant.DAL
{
    public class SaleDetailRefundDAL
    {
        #region DB Operations
        public bool ManageSaleDetailRefund ( SaleDetailRefundDE sdr, MySqlCommand cmd )
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                cmd.CommandText = "ManageSaleDetailRefund";
                cmd.Parameters.AddWithValue ("@id", sdr.Id);
                cmd.Parameters.AddWithValue ("@clientId", sdr.ClientId);
                cmd.Parameters.AddWithValue ("@saleOrderId", sdr.SaleOrderId);
                cmd.Parameters.AddWithValue ("@itemName", sdr.ItemName);
                cmd.Parameters.AddWithValue ("@reason", sdr.Reason);
                cmd.Parameters.AddWithValue ("@qTY", sdr.QTY);
                cmd.Parameters.AddWithValue ("@discount", sdr.Discount);
                cmd.Parameters.AddWithValue ("@typeId", sdr.TypeId);
                cmd.Parameters.AddWithValue ("@terminalId", sdr.TerminalId);
                cmd.Parameters.AddWithValue ("@makeStatusId", sdr.MakeStatusId);
                cmd.Parameters.AddWithValue ("@pOSFee", sdr.POSFee);
                cmd.Parameters.AddWithValue ("@dC", sdr.DC);
                cmd.Parameters.AddWithValue ("@svcChrgs", sdr.SvcChrgs);
                cmd.Parameters.AddWithValue ("@date", sdr.Date);
                cmd.Parameters.AddWithValue ("@time", sdr.Time);
                cmd.Parameters.AddWithValue ("@gST", sdr.GST);
                cmd.Parameters.AddWithValue ("@price", sdr.Price);
                cmd.Parameters.AddWithValue ("@gross", sdr.Gross);
                cmd.Parameters.AddWithValue ("@createdOn", sdr.CreatedOn);
                cmd.Parameters.AddWithValue ("@createdById", sdr.CreatedById);
                cmd.Parameters.AddWithValue ("@modifiedOn", sdr.ModifiedOn);
                cmd.Parameters.AddWithValue ("@modifiedById", sdr.ModifiedById);
                cmd.Parameters.AddWithValue ("@isActive", sdr.IsActive);
                cmd.Parameters.AddWithValue ("@DBoperation", sdr.DBoperation.ToString ());

                cmd.ExecuteNonQuery ();
                return true;
            }
            catch (Exception )
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
                cmd.Parameters.Clear ();
            }
        }
        public List<SaleDetailRefundDE> SearchSaleDetailRefunds ( string whereClause, MySqlCommand cmd = null )
        {
            List<SaleDetailRefundDE> top = new List<SaleDetailRefundDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                top = cmd.Connection.Query<SaleDetailRefundDE> ("call Restaurant.SearchSaleDetailRefund( '" + whereClause + "')").ToList ();
                return top;
            }
            catch (Exception exp)
            {

                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        #endregion
    }
}
