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

namespace Restaurant.Core.Entities
{
    public class SaleOrderDAL
    {
        #region Header Operations
        public bool ManageSaleOrder(SaleOrderDE so, MySqlCommand cmd)
        {
            bool retVal = false;
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
                cmd.CommandText = "ManageSaleOrder";
                cmd.Parameters.AddWithValue("@id", so.Id);
                cmd.Parameters.AddWithValue ("@clientId", so.ClientId);
                cmd.Parameters.AddWithValue("@bankId", so.BankId);
                cmd.Parameters.AddWithValue ("@custTypeId", so.CustTypeId);
                cmd.Parameters.AddWithValue ("@userId", so.UserId);
                cmd.Parameters.AddWithValue ("@isPaid", so.IsPaid);
                cmd.Parameters.AddWithValue ("@gST", so.GST);
                cmd.Parameters.AddWithValue("@service", so.Service);
                cmd.Parameters.AddWithValue ("@discountNarration", so.DiscountNarration);
                cmd.Parameters.AddWithValue ("@voucherNarration", so.VoucherNarration);
                cmd.Parameters.AddWithValue("@netTotal", so.NetTotal);
                cmd.Parameters.AddWithValue("@total", so.Total);
                cmd.Parameters.AddWithValue ("@deliveryCharges", so.DeliveryCharges);
                cmd.Parameters.AddWithValue ("@pOSFee", so.POSFee);
                cmd.Parameters.AddWithValue("@statusId", so.StatusId);
                cmd.Parameters.AddWithValue ("@billStatusId", so.BillStatusId);
                cmd.Parameters.AddWithValue("@discount", so.Discount);
                cmd.Parameters.AddWithValue ("@terminalId", so.TerminalId);
                cmd.Parameters.AddWithValue("@discountValue", so.DiscountValue);
                cmd.Parameters.AddWithValue("@gSTValue", so.GSTValue);
                cmd.Parameters.AddWithValue("@paymentMethodId", so.PaymentMethodId);
                cmd.Parameters.AddWithValue("@dispatchedTime", so.DispatchedTime);
                cmd.Parameters.AddWithValue("@deliveryTime", so.DeliveryTime);
                cmd.Parameters.AddWithValue("@shiftId", so.ShiftId);
                cmd.Parameters.AddWithValue("@riderId", so.RiderId);
                cmd.Parameters.AddWithValue("@billTitle", so.BillTitle);
                cmd.Parameters.AddWithValue("@discountTypeId", so.DiscountTypeId);
                cmd.Parameters.AddWithValue("@name", so.Name);
                cmd.Parameters.AddWithValue("@address", so.Address);
                cmd.Parameters.AddWithValue("@note", so.Note);
                cmd.Parameters.AddWithValue("@guest", so.Guest);
                cmd.Parameters.AddWithValue("@restaurantId", so.RestaurantId);
                cmd.Parameters.AddWithValue("@orderTypeId", so.OrderTypeId);
                cmd.Parameters.AddWithValue("@sourceId", so.SourceId);
                cmd.Parameters.AddWithValue("@phoneNo", so.PhoneNo);
                cmd.Parameters.AddWithValue("@waiterId", so.WaiterId);
                cmd.Parameters.AddWithValue("@customerId", so.CustomerId);
                cmd.Parameters.AddWithValue("@tableNo", so.TableNo);
                cmd.Parameters.AddWithValue ("@comments", so.Comments);
                cmd.Parameters.AddWithValue ("@date", so.Date);
                cmd.Parameters.AddWithValue ("@time", so.Time);
                cmd.Parameters.AddWithValue ("@cashReceived", so.CashReceived);
                cmd.Parameters.AddWithValue ("@remainingCash", so.RemainingCash);
                cmd.Parameters.AddWithValue("@createdOn", so.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", so.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", so.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", so.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", so.IsActive);
                cmd.Parameters.AddWithValue ("@isSent", so.IsSent);
                cmd.Parameters.AddWithValue("@DBoperation", so.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                retVal = true;
            }
            catch (Exception )
            {
               throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
                cmd.Parameters.Clear ();
            }
            return retVal;
        }
        public List<SaleOrderDE> SearchSaleOrders ( string whereClause, MySqlCommand cmd = null )
        {
            List<SaleOrderDE> top = new List<SaleOrderDE> ();
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
                top = cmd.Connection.Query<SaleOrderDE> ("call Restaurant.SearchSaleOrder( '" + whereClause + "')").ToList ();
                return top;
            }
            catch (Exception )
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        #endregion
        #region Line Operations
        public bool ManageSaleOrderLine(SaleOrderLineDE sol, MySqlCommand cmd)
        {
            bool retVal= false;
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
                cmd.CommandText = "ManageSaleOrderLine";
                cmd.Parameters.AddWithValue("@id", sol.Id);
                cmd.Parameters.AddWithValue ("@clientId", sol.ClientId);
                cmd.Parameters.AddWithValue ("@isComp", sol.IsComp);
                cmd.Parameters.AddWithValue ("@discountValue", sol.DiscountValue);
                cmd.Parameters.AddWithValue ("@discountKeyId", sol.DiscountKeyId);
                cmd.Parameters.AddWithValue("@saleOrderId", sol.SaleOrderId);
                cmd.Parameters.AddWithValue ("@statusId", sol.StatusId);
                cmd.Parameters.AddWithValue("@itemId", sol.ItemId);
                cmd.Parameters.AddWithValue ("@sizeId", sol.SizeId);
                cmd.Parameters.AddWithValue ("@dealId", sol.DealId);
                cmd.Parameters.AddWithValue("@comments", sol.Comments);
                cmd.Parameters.AddWithValue ("@complimentaryNarration", sol.ComplimentaryNarration);
                cmd.Parameters.AddWithValue ("@rModId", sol.RModId);
                cmd.Parameters.AddWithValue ("@isRMod", sol.IsRMod);
                cmd.Parameters.AddWithValue ("@kDSId", sol.KDSId);
                cmd.Parameters.AddWithValue ("@addOnNo", sol.AddOnNo);
                cmd.Parameters.AddWithValue ("@isDeleted", sol.IsDeleted);
                cmd.Parameters.AddWithValue("@qTY", sol.QTY);
                cmd.Parameters.AddWithValue ("@optionalModifier", sol.OptionalModifier);
                cmd.Parameters.AddWithValue ("@isDealItem", sol.IsDealItem);
                cmd.Parameters.AddWithValue("@price", sol.Price);
                cmd.Parameters.AddWithValue("@lineTotal", sol.LineTotal);
                cmd.Parameters.AddWithValue("@createdOn", sol.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", sol.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", sol.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", sol.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", sol.IsActive);
                cmd.Parameters.AddWithValue ("@isSent", sol.IsSent);
                cmd.Parameters.AddWithValue("@DBoperation", sol.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                retVal=true;
            }
            catch (Exception )
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
                cmd.Parameters.Clear ();
            }
            return retVal;
        }
        public List<SaleOrderLineDE> SearchSaleOrderLine ( string whereClause, MySqlCommand cmd = null )
        {
            List<SaleOrderLineDE> top = new List<SaleOrderLineDE> ();
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
                top = cmd.Connection.Query<SaleOrderLineDE> ("call Restaurant.SearchSaleOrderLine( '" + whereClause + "')").ToList ();
                return top;
            }
            catch (Exception )
            {
                throw;
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
