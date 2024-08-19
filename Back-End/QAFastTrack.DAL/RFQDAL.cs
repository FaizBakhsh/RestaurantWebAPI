using Dapper;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Ocsp;
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
    public class RFQDAL
    {
        #region Header Operations
        public bool INV_Manage_RFQ(RFQDE RFQ, MySqlCommand? cmd)
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
                cmd.CommandText = "INV_Manage_RFQ";
                cmd.Parameters.AddWithValue("@id", RFQ.Id);
                cmd.Parameters.AddWithValue("@clientId", RFQ.ClientId);
                cmd.Parameters.AddWithValue("@isReference", RFQ.IsReference);
                cmd.Parameters.AddWithValue("@title", RFQ.Title);
                cmd.Parameters.AddWithValue("@rFQValidity", RFQ.RFQValidity);
                cmd.Parameters.AddWithValue("@requestNoteNo", RFQ.RequestNoteNo);
                cmd.Parameters.AddWithValue("@deliveryDate", RFQ.DeliveryDate);
                cmd.Parameters.AddWithValue("@statusId", RFQ.StatusId);
                cmd.Parameters.AddWithValue("@description", RFQ.Description);
                cmd.Parameters.AddWithValue("@createdOn", RFQ.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", RFQ.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", RFQ.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", RFQ.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", RFQ.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", RFQ.DBoperation.ToString());

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
        public List<RFQDE> INV_Search_RFQ (string whereClause, MySqlCommand cmd = null)
        {
            List<RFQDE> top = new List<RFQDE>();
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
                top = cmd.Connection.Query<RFQDE>("call Restaurant.INV_Search_RFQ( '" + whereClause + "')").ToList();
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
        public bool INV_Manage_RFQLine(RFQLineDE RFQLine, MySqlCommand? cmd)
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
                cmd.CommandText = "INV_Manage_RFQLine";
                cmd.Parameters.AddWithValue("@id", RFQLine.Id);
                cmd.Parameters.AddWithValue("@clientId", RFQLine.ClientId);
                cmd.Parameters.AddWithValue("@rfqId", RFQLine.RFQId);
                cmd.Parameters.AddWithValue("@itemId", RFQLine.ItemId);
                cmd.Parameters.AddWithValue("@createdOn", RFQLine.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", RFQLine.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", RFQLine.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", RFQLine.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", RFQLine.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", RFQLine.DBoperation.ToString());

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
        public List<RFQLineDE> INV_Search_RFQLine (string whereClause, MySqlCommand cmd = null)
        {
            List<RFQLineDE> top = new List<RFQLineDE>();
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
                top = cmd.Connection.Query<RFQLineDE>("call Restaurant.INV_Search_RFQLine( '" + whereClause + "')").ToList();
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
