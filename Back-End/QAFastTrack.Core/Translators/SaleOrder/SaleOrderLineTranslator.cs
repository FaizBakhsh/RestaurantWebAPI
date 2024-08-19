using Restaurant.Core.Entities;
using Restaurant.Core.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Translators.SaleOrder
{
    public static class SaleOrderLineTranslators
    {
        public static List<SaleOrderLineVM> ToTranslate ( this List<SaleOrderLineDE> mod )
        {
            return mod.Select (ur => new SaleOrderLineVM ()
            {
                Id = ur.Id,
                itemCode = ur.ItemCode,
                itemName = ur.ItemName,
                price = ur.Price,
                qty=ur.QTY,
                lineTotal = ur.LineTotal,
            }).ToList ();
        }

    }
}
