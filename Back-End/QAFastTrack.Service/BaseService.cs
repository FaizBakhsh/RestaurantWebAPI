using AutoMapper;
using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Mappers;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public abstract class BaseService
    {
        public Logger _logger;
        public string? _entity { get; set; }
        internal MySqlCommand? cmd;
        public CoreDAL _coreDAL;
        public BaseService ( )
        {
            _coreDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        public IMapper GetMapper ( )
        {

            var config = new MapperConfiguration (cfg =>
            {
                cfg.AddProfile (new AutoMapperProfile ());
            });

            return config.CreateMapper ();
        }
    }
}
