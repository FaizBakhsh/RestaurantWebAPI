using Newtonsoft.Json;
using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Services
{
    public class CategoryService : BaseService
    {
        //HttpClient client;
        List<CategoryDE> categoryList;
        public CategoryService()
        {
            client = new HttpClient();
            categoryList = new List<CategoryDE>();
        }
        public async Task<List<CategoryDE>> GetCategories()
        {
            var response = await client.GetStringAsync(Globals.BASE_API_URL+ "Category");
            categoryList = JsonConvert.DeserializeObject<List<CategoryDE>>(response);
            if (categoryList != null)
            {
                return categoryList;
            }
            else
            {
                categoryList = new List<CategoryDE>();
                return categoryList;
            }
        }
    }
}
