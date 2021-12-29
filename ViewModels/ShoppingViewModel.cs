using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DerivcoDemo.ViewModels
{
    public class ShoppingViewModel
    {
        public Guid MenuItemId { get; set; }
        public string MenuItemCode { get; set; }
        public string MenuItemName { get; set; }
        public decimal? MenuItemPrice { get; set; }
        public string MenuItemDescription { get; set; }
        public string ItemImagePath { get; set; }
        public string Category { get; set; }
    }

}