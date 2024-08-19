using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Acc
{
    public class OpeningBalanceDetailDE : BaseDomain
    {
        public int CoaCodeId { get; set; }
        public string? YearCode { get; set; }
        public int CoaDebitAmt { get; set; }
        public int CoaCreditAmt { get; set; }
    }
}
