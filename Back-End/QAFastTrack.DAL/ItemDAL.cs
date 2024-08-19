using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using Restaurant.Core.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class ItemDAL
    {
        #region Operations
        public bool ManageItem(ItemDE item, MySqlCommand? cmd = null)
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
                cmd.CommandText = "ManageItem";
                cmd.Parameters.AddWithValue("@id", item.Id);
                cmd.Parameters.AddWithValue ("@clientId", item.ClientId);
                cmd.Parameters.AddWithValue("@groupId", item.GroupId);
                cmd.Parameters.AddWithValue("@tax", item.Tax);
                cmd.Parameters.AddWithValue("@actualPrice", item.ActualPrice);
                cmd.Parameters.AddWithValue("@menuItemId", item.MenuItemId);
                cmd.Parameters.AddWithValue("@proposedPrice", item.ProposedPrice);
                cmd.Parameters.AddWithValue("@branchId", item.BranchId);
                cmd.Parameters.AddWithValue("@brandId", item.BrandId);
                cmd.Parameters.AddWithValue("@colorId", item.ColorId);
                cmd.Parameters.AddWithValue("@fontSize", item.FontSize);
                cmd.Parameters.AddWithValue("@fontColorId", item.FontColorId);
                cmd.Parameters.AddWithValue("@description", item.Description);
                cmd.Parameters.AddWithValue("@uOMId", item.UOMId);
                cmd.Parameters.AddWithValue("@kDSId", item.KDSId);
                cmd.Parameters.AddWithValue("@sizeId", item.SizeId);
                cmd.Parameters.AddWithValue("@storeId", item.StoreId);
                cmd.Parameters.AddWithValue("@supplierId", item.SupplierId);
                cmd.Parameters.AddWithValue("@itemTypeId", item.ItemTypeId);
                cmd.Parameters.AddWithValue("@typeId", item.TypeId);
                cmd.Parameters.AddWithValue("@parentId", item.ParentId);
                cmd.Parameters.AddWithValue("@stageId", item.StageId);
                cmd.Parameters.AddWithValue("@stageQty", item.StageQty);
                cmd.Parameters.AddWithValue("@isDealItem", item.IsDealItem);
                cmd.Parameters.AddWithValue("@kDSId2", item.KDSId2);
                cmd.Parameters.AddWithValue("@makingTime", item.MakingTime);
                cmd.Parameters.AddWithValue("@alarmTime", item.AlarmTime);
                cmd.Parameters.AddWithValue("@totalItemsAllowed", item.TotalItemsAllowed);
                cmd.Parameters.AddWithValue("@startDate", item.StartDate);
                cmd.Parameters.AddWithValue("@currentMargin", item.CurrentMargin);
                cmd.Parameters.AddWithValue("@proposedMargin", item.ProposedMargin);
                cmd.Parameters.AddWithValue("@barCode", item.BarCode);
                cmd.Parameters.AddWithValue("@target", item.Target);
                cmd.Parameters.AddWithValue("@optionalModifier", item.OptionalModifier);
                cmd.Parameters.AddWithValue("@endDate", item.EndDate);
                cmd.Parameters.AddWithValue("@manualQty", item.ManualQty);
                cmd.Parameters.AddWithValue("@vendorId", item.VendorId);
                cmd.Parameters.AddWithValue("@isCritical", item.IsCritical);
                cmd.Parameters.AddWithValue("@minOrderLevel", item.MinOrderLevel);
                cmd.Parameters.AddWithValue("@packingQty", item.PackingQty);
                cmd.Parameters.AddWithValue("@maxOrderLevel", item.MaxOrderLevel);
                cmd.Parameters.AddWithValue("@packingName",  item.PackingName);
                cmd.Parameters.AddWithValue("@categoryId", item.CategoryId);
                cmd.Parameters.AddWithValue("@subCategoryId", item.SubCategoryId);
                cmd.Parameters.AddWithValue("@itemName", item.ItemName);
                cmd.Parameters.AddWithValue("@itemCode", item.ItemCode);
                cmd.Parameters.AddWithValue("@qty", item.Qty);
                cmd.Parameters.AddWithValue("@price", item.Price);
                cmd.Parameters.AddWithValue("@imageName", item.ImageName);
                cmd.Parameters.AddWithValue("@imageSize", item.ImageSize);
                cmd.Parameters.AddWithValue("@base64FilePath", item.Base64FilePath);
                cmd.Parameters.AddWithValue("@createdOn", item.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", item.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", item.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", item.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", item.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", item.DBoperation.ToString());

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
        public List<ItemDE> SearchItems(string whereClause, MySqlCommand? cmd = null)
        {
            List<ItemDE> top = new List<ItemDE>();
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
                top = cmd.Connection.Query<ItemDE>("call Restaurant.SearchItem( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception exp)
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
