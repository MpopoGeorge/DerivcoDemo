using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DerivcoDemo.ViewModels
{
    public class MenuItemViewModel
    {
        public Guid MenuItemId { get; set; }
        public int CategoryId { get; set; }

        [Required]
        public string MenuItemCode { get; set; }

        [Required]
        public string MenuItemName { get; set; }

        public string MenuItemDescription { get; set; }

        [Required]
        public decimal MenuItemPrice { get; set; }
        
        [Required]
        public HttpPostedFileBase ItemImagePath { get; set; }

        [Required]
        public IEnumerable<SelectListItem> CategorySelectListItem { get; set; }

    }
}