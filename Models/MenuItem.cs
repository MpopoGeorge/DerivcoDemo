//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DerivcoDemo.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class MenuItem
    {
        public System.Guid MenuItemId { get; set; }
        [Display(Name = "A person")]
        public int CategoryId { get; set; }
        [Display(Name = "Core")]
        public string MenuItemCode { get; set; }
        [Display(Name = "Name")]
        public string MenuItemName { get; set; }
        [Display(Name = "Image")]
        public string MenuItemImagePath { get; set; }
        [Display(Name = "Price")]
        public decimal MenuItemPrice { get; set; }
        [Display(Name = "Description")]
        public string MenuItemDescription { get; set; }
    }
}