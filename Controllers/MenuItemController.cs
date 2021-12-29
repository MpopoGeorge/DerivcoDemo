using DerivcoDemo.EDMX;
using DerivcoDemo.ViewModels;
using System;
using System.IO;
using System.Linq;
using System.Web.Mvc;

namespace DerivcoDemo.Controllers
{
    public class MenuItemController : Controller
    {
        private Derivcoonline_DbEntities _DbEntities;
        public MenuItemController()
        {
            _DbEntities = new Derivcoonline_DbEntities();
        }
        // GET: MenuItem
        public ActionResult Index()
        {
            MenuItemViewModel itemViewModel = new MenuItemViewModel();
            itemViewModel.CategorySelectListItem = (from category in _DbEntities.Categories
              select new SelectListItem()
              {
                  Text = category.CategoryName,
                  Value = category.CategoryId.ToString(),
                  Selected = true
               });
            return View(itemViewModel);
        }

        [HttpPost]
        public JsonResult Index(MenuItemViewModel itemViewModel)
        {
            string menuItemImage = Guid.NewGuid() + Path.GetExtension(itemViewModel.ItemImagePath.FileName);
            itemViewModel.ItemImagePath.SaveAs(Server.MapPath("~/Images/" + menuItemImage));

            MenuItem menuItem = new MenuItem();
            menuItem.MenuItemImagePath = "~/Images/" + menuItemImage;
            menuItem.CategoryId = itemViewModel.CategoryId;
            menuItem.MenuItemDescription = itemViewModel.MenuItemDescription;
            menuItem.MenuItemCode = itemViewModel.MenuItemCode;
            menuItem.MenuItemName = itemViewModel.MenuItemName;
            menuItem.MenuItemPrice = itemViewModel.MenuItemPrice;
            menuItem.MenuItemId = Guid.NewGuid();
            _DbEntities.MenuItems.Add(menuItem);
            _DbEntities.SaveChanges();

            return Json(new { Success = true, Message = "Item Added Successfully."},JsonRequestBehavior.AllowGet);
        }
     }
}