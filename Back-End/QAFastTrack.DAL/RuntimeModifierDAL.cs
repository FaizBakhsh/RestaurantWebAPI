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
    public class RuntimeModifierDAL
    {
        #region Operations

        public bool ManageRuntimeModifier(RuntimeModifierDE _rtM, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageRuntimeModifier";
                cmd.Parameters.AddWithValue("@id", _rtM.Id);
                cmd.Parameters.AddWithValue ("@clientId", _rtM.ClientId);
                cmd.Parameters.AddWithValue("@menuItemId", _rtM.MenuItemId);
                cmd.Parameters.AddWithValue("@rawItemId", _rtM.RawItemId);
                cmd.Parameters.AddWithValue("@typeId", _rtM.TypeId);
                cmd.Parameters.AddWithValue("@kDSId", _rtM.KDSId);
                cmd.Parameters.AddWithValue("@kDS2Id", _rtM.KDS2Id);
                cmd.Parameters.AddWithValue("@qty", _rtM.Qty);
                cmd.Parameters.AddWithValue("@stageId", _rtM.StageId);
                cmd.Parameters.AddWithValue("@stageQtyAllowed", _rtM.StageQtyAllowed);
                cmd.Parameters.AddWithValue("@modifierName", _rtM.ModifierName);
                cmd.Parameters.AddWithValue("@imageBase64Path", _rtM.ImageBase64Path);
                cmd.Parameters.AddWithValue("@price", _rtM.Price);
                cmd.Parameters.AddWithValue("@createdOn", _rtM.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _rtM.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _rtM.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _rtM.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _rtM.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _rtM.DBoperation.ToString());

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
            }
        }
        public List<RuntimeModifierDE> SearchRuntimeModifiers(string whereClause, MySqlCommand cmd = null)
        {
            List<RuntimeModifierDE> top = new List<RuntimeModifierDE>();
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
                top = cmd.Connection.Query<RuntimeModifierDE>("call Restaurant.SearchRuntimeModifier( '" + whereClause + "')").ToList();
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
