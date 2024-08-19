using Newtonsoft.Json;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.WPF.Services
{
    public class ExpenseService
    {
        HttpClient client;
        List<ExpenseDE> expenseList;
        public ExpenseService ( )
        {
            client = new HttpClient ();
            expenseList = new List<ExpenseDE> ();
        }
        public async Task<List<ExpenseDE>> GetExpenses ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "Expenses");
            expenseList = JsonConvert.DeserializeObject<List<ExpenseDE>> (response);
            if (expenseList != null)
                return expenseList;
            else
            {
                expenseList = new List<ExpenseDE> ();
                return expenseList;
            }
        }
        public async Task<List<ExpenseDE>> SearchExpenses ( )
        {
            try
            {
                var expenses = new ExpenseDE ();
                expenses.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Expenses/Search", expenses);
                var jsonString = await response.Content.ReadAsStringAsync ();
                expenseList = JsonConvert.DeserializeObject<List<ExpenseDE>> (jsonString);
                if (expenseList != null)
                    return expenseList;
                else
                {
                    expenseList = new List<ExpenseDE> ();
                    return expenseList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return expenseList;
        }
        public async Task<HttpResponseMessage> UpdateExpense ( ExpenseDE Expense )
        {
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "Expenses", Expense);
            return response;
        }
        public async Task<HttpResponseMessage> PostExpense ( ExpenseDE Expense )
        {
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Expenses", Expense);
                return response;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return new HttpResponseMessage ();
        }
    }
}
