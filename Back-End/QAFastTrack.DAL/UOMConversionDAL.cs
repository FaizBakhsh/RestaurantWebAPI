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
    public class UOMConversionDAL
    {
        #region Operations
        public bool ManageUOMConversion(UOMConversionDE uomCnvrsn, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageUOMConversion";
                cmd.Parameters.AddWithValue("@id", uomCnvrsn.Id);
                cmd.Parameters.AddWithValue ("@clientId", uomCnvrsn.ClientId);
                cmd.Parameters.AddWithValue("@uOMId", uomCnvrsn.UOMId);
                cmd.Parameters.AddWithValue("@conversionRate", uomCnvrsn.ConversionRate);
                cmd.Parameters.AddWithValue("@convertedUOMId", uomCnvrsn.ConvertedUOMId);
                cmd.Parameters.AddWithValue("@qTY", uomCnvrsn.QTY);
                cmd.Parameters.AddWithValue("@createdOn", uomCnvrsn.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", uomCnvrsn.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", uomCnvrsn.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", uomCnvrsn.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", uomCnvrsn.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", uomCnvrsn.DBoperation.ToString());

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
        public List<UOMConversionDE> SearchUOMConversions(string whereClause, MySqlCommand cmd = null)
        {
            List<UOMConversionDE> top = new List<UOMConversionDE>();
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
                top = cmd.Connection.Query<UOMConversionDE>("call Restaurant.SearchUOMConversion( '" + whereClause + "')").ToList();
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
