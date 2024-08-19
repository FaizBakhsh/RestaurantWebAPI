using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class RecipeService
    {
        #region Class Members/Class Variables

        private RecipeDAL _RecipeDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public RecipeService()
        {
            _RecipeDAL = new RecipeDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Recipe
        public bool ManagementRecipe(RecipeDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.itemrecipe.ToString (), mod.ClientId, "ClientId");
                retVal = _RecipeDAL.ManageRecipe(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<RecipeDE> SearchRecipes(RecipeDE mod)
        {
            List<RecipeDE> Recipes = new List<RecipeDE>();
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
                if (mod.GroupId != default && mod.GroupId!=0)
                    whereClause += $" AND GroupId={mod.GroupId}";
                if (mod.RecipeTypeId != default && mod.RecipeTypeId != 0)
                    whereClause += $" AND RecipeTypeId={mod.RecipeTypeId}";
                if (mod.RecipeModifierId != default && mod.RecipeModifierId != 0)
                    whereClause += $" AND RecipeModifierId={mod.RecipeModifierId}";
                if (mod.EntityId != default && mod.EntityId != 0)
                    whereClause += $" AND EntityId={mod.EntityId}";
                if (mod.ItemId != default && mod.ItemId != 0)
                    whereClause += $" AND ItemId={mod.ItemId}";
                if (mod.RawItemId != default && mod.RawItemId != 0)
                    whereClause += $" AND RawItemId={mod.RawItemId}";
                if (mod.SizeId != default && mod.SizeId != 0)
                    whereClause += $" AND SizeId={mod.SizeId}";
                if (mod.OrderTypeId != default && mod.OrderTypeId != 0)
                    whereClause += $" AND OrderTypeId={mod.OrderTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Recipes = _RecipeDAL.SearchRecipes(whereClause);

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
            return Recipes;
        }
        #endregion
    }
}
