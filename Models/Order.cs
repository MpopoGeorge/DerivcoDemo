using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DerivcoDemo.ViewModels
{
    public class Order
    {
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public string OrderNumber { get; set; }
        public string CustomerId { get; set; }

    }
}