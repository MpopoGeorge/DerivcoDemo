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
        [Display(Name = "Customer ID", AutoGenerateFilter = false)]
        public Guid MenuItemId { get; set; }


        [Display(Name = "Category ID", AutoGenerateFilter = false)]
        public int CategoryId { get; set; }


        [Display(Name = "Code", AutoGenerateFilter = false)]

        [Required]
        public string MenuItemCode { get; set; }

        [Required]
        [Display(Name = "Name", AutoGenerateFilter = false)]
        public string MenuItemName { get; set; }

        [Required]
        [Display(Name = "Description", AutoGenerateFilter = false)]
        public string MenuItemDescription { get; set; }


        [Required]
        [Display(Name = "Price", AutoGenerateFilter = false)]
        public decimal MenuItemPrice { get; set; }


        [Required]
        [Display(Name = "Thumbnail", AutoGenerateFilter = false)]
        public HttpPostedFileBase ItemImagePath { get; set; }

        [Required]
        [Display(Name = "Category", AutoGenerateFilter = false)]
        public IEnumerable<SelectListItem> CategorySelectListItem { get; set; }

    }
}