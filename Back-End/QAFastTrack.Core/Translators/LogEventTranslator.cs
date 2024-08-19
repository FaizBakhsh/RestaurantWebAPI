using Restaurant.Core.Entities;
using Restaurant.Core.Extenstions;
using Restaurant.Core.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Translators
{
    public static class LogEventTranslator
    {
        public static List<LogEventVM> ToTranslate ( this List<LogEventDE> mod )
        {
            return mod.Select (ur => new LogEventVM ()
            {
                Id = ur.Id,
                message = ur.Message,
                date = ur.Date.ToDateTimeString(),
                user = ur.User,
            }).ToList ();
        }
    }
}
