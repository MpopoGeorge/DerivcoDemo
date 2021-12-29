using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DerivcoDemo.ViewModels
{
    public class ShoppingCart
    {
        public string MenuItemId { get; set; }
        public decimal Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal Total { get; set; }

        public string ItemImagePath { get; set; }
        public string ItemName { get; set; }

    }
}