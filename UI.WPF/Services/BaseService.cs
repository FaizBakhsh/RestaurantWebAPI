using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Services
{
    public class BaseService : IBaseService
    {
        public HttpClient? client;
    }
}
