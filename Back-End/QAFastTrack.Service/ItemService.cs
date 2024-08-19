using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.ViewModel;
using Restaurant.DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class ItemService
    {
        #region Class Members/Class Variables

        private ItemDAL _itemDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        private RecipeDAL _recipeDAL;
        private SizeDAL _sizeDAL;
        private RuntimeModifierDAL _modifierDAL;

        #endregion
        #region Constructors
        public ItemService()
        {
            _sizeDAL = new SizeDAL();
            _recipeDAL = new RecipeDAL();
            _itemDAL = new ItemDAL();
            _modifierDAL = new RuntimeModifierDAL ();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        #endregion
        #region Item
        public ItemDE ManagementItem(ItemDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                //RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.item.ToString (), mod.ClientId, "ClientId");
                if (mod.KDSIds != null)
                    mod.KDSId = string.Join(",", mod.KDSIds.ToArray());
                retVal = _itemDAL.ManageItem(mod);
                if (mod.ItemRecipes != null)
                    foreach (var recipe in mod.ItemRecipes)
                    {
                        recipe.Id = _corDAL.GetNextIdByClient (TableNames.itemrecipe.ToString (), mod.ClientId, "ClientId");
                        recipe.EntityId = mod.Id;
                        recipe.GroupId = mod.GroupId;
                        recipe.SizeId = mod.SizeId;
                        retVal = _recipeDAL.ManageRecipe(recipe);
                    }
                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                {
                    if (mod.ProductAttribs.Count > 0)
                        foreach (var line in mod.ProductAttribs)
                        {
                            if (line.AttribValues != null)
                                foreach (var attrib in line.AttribValues)
                                {
                                    line.IsActive = true;
                                    line.ItemId = mod.Id;
                                    line.GroupId = mod.GroupId;
                                    line.AttribValId = attrib;
                                    if (line.DBoperation == DBoperations.Insert)
                                        line.Id = _corDAL.GetNextIdByClient (TableNames.size.ToString (), mod.ClientId, "ClientId");
                                    retVal = _sizeDAL.ManageSize(line);
                                }
                        }
                }
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                //RestaurantDataContext.EndTransaction(cmd);
                // return retVal;
            }
            catch (Exception ex)
            {
                // RestaurantDataContext.CancelTransaction(cmd);
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
                string whereClause = " Where 1=1";
                mod.ProductAttribs = _sizeDAL.SearchSizes(whereClause += $" AND ItemId={mod.Id} and  IsActive={true}");
            }
            return mod;
        }
        public List<ItemDE> SearchItems(ItemDE mod)
        {
            List<ItemDE> Item = new List<ItemDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.ItemTypeId != default)
                    whereClause += $" AND ItemTypeId={mod.ItemTypeId}";
                if (mod.GroupId != default && mod.GroupId != 0)
                    whereClause += $" AND GroupId={mod.GroupId}";
                if (mod.MenuItemId != default && mod.MenuItemId != 0)
                    whereClause += $" AND MenuItemId={mod.MenuItemId}";
                if (mod.ItemTypeId != default && mod.ItemTypeId != 0)
                    whereClause += $" AND ItemTypeId={mod.ItemTypeId}";
                if (mod.CategoryId != default && mod.CategoryId != 0)
                    whereClause += $" AND CategoryId={mod.CategoryId}";
                if (mod.SubCategoryId != default && mod.SubCategoryId != 0)
                    whereClause += $" AND SubCategoryId={mod.SubCategoryId}";
                if (mod.ItemCode != default)
                    whereClause += $" AND ItemCode like ''" + mod.ItemCode + "''";
                if (mod.ItemName != default)
                    whereClause += $" AND ItemName like ''" + mod.ItemName + "''";
                if (mod.StageQty != default)
                    whereClause += $" AND StageQty={mod.StageQty}";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.DealName != default)
                    whereClause += $" AND DealName like ''" + mod.DealName + "''";
                if (mod.StageId != default && mod.StageId != 0)
                    whereClause += $" AND StageId={mod.StageId}";
                if (mod.Stage != default)
                    whereClause += $" AND Stage like ''" + mod.Stage + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                if (mod.IsDealItem != default)
                    whereClause += $" AND IsDealItem ={mod.IsDealItem}";
                Item = _itemDAL.SearchItems(whereClause);
                foreach (var line in Item)
                {
                    if (line.KDSId != null)
                    {
                        List<string> result = line.KDSId.Split(',').ToList();
                        line.KDSIds = new List<int>();
                        foreach (var kds in result)
                        {
                            line.KDSIds.Add(int.Parse(kds));
                        }
                    }
                    whereClause = "where 1=1";
                    line.ItemRecipes = _recipeDAL.SearchRecipes(whereClause += $" AND EntityId={line.Id}  AND ClientId={line.ClientId}  AND SizeId={line.SizeId} AND IsActive ={true}");
                }
                foreach (var item in Item)
                {
                    whereClause = " Where 1=1";
                    item.ProductAttribs = _sizeDAL.SearchSizes(whereClause += $" AND ItemId={item.Id}  AND ClientId={item.ClientId} and  IsActive={true}");
                    whereClause = " Where 1=1";
                    item.Modifiers = _modifierDAL.SearchRuntimeModifiers (whereClause += $" AND MenuItemId={item.Id} AND ClientId={item.ClientId} and  IsActive={true}");
                }
                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return Item;
        }

        #endregion
    }
}
