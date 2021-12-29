using DerivcoDemo.EDMX;
using DerivcoDemo.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace DerivcoDemo.Controllers
{
    public class ShoppingController : Controller
    {
        private Derivcoonline_DbEntities _DbEntities;
        private List<ShoppingCart> listOfShoppingCarts;

        private int OrderId = 0;
        private int customerId = 0;

        public ShoppingController()
        {
            _DbEntities = new Derivcoonline_DbEntities();
            listOfShoppingCarts = new List<ShoppingCart>();
        }
        // GET: Cart
        public ActionResult Index()
        {
            IEnumerable<ShoppingViewModel> listOfshoppingCartViewModels = (from ObjMenuItem in _DbEntities.MenuItems
                                                                               join
                                                                               category in _DbEntities.Categories
                                                                               on ObjMenuItem.CategoryId equals category.CategoryId
                                                                               select new ShoppingViewModel()
                                                                               {
                                                                                   ItemImagePath = ObjMenuItem.MenuItemImagePath,
                                                                                   MenuItemName = ObjMenuItem.MenuItemName,
                                                                                   MenuItemPrice = ObjMenuItem.MenuItemPrice,
                                                                                   MenuItemId = ObjMenuItem.MenuItemId,
                                                                                   MenuItemCode = ObjMenuItem.MenuItemCode,
                                                                                   MenuItemDescription = ObjMenuItem.MenuItemDescription,
                                                                                   Category = category.CategoryName
                                                                               }
                                                                              ).ToList();

            return View(listOfshoppingCartViewModels);
        }

        [HttpPost]
        public JsonResult Index(string menuItemId)
        {
            ShoppingCart objShoppingCart = new ShoppingCart();
            MenuItem ObjMenuItem = _DbEntities.MenuItems.Single(model=> model.MenuItemId.ToString() == menuItemId);
            if (Session["CartCounter"] != null)
            {
                listOfShoppingCarts = Session["CartItem"] as List<ShoppingCart>;
            }
            if (listOfShoppingCarts.Any(model => model.MenuItemId == menuItemId))
            {
                objShoppingCart = listOfShoppingCarts.Single(model => model.MenuItemId == menuItemId);
                objShoppingCart.Quantity = objShoppingCart.Quantity + 1;
                objShoppingCart.Total = objShoppingCart.Quantity * objShoppingCart.UnitPrice;
            }
            else
            {
                objShoppingCart.MenuItemId = menuItemId;
                objShoppingCart.ItemImagePath = ObjMenuItem.MenuItemImagePath;
                objShoppingCart.ItemName = ObjMenuItem.MenuItemName;
                objShoppingCart.Quantity = 1;
                objShoppingCart.Total = ObjMenuItem.MenuItemPrice;
                objShoppingCart.UnitPrice = ObjMenuItem.MenuItemPrice;
                listOfShoppingCarts.Add(objShoppingCart);
            }

            Session["CartCounter"] = listOfShoppingCarts.Count;
            Session["CartItem"] = listOfShoppingCarts;

            return Json(new { Success = true, Counter = listOfShoppingCarts.Count }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ShoppingCart()
        {
            listOfShoppingCarts = Session["CartItem"] as List<ShoppingCart>;
            return View(listOfShoppingCarts);
        }

        [HttpPost]
        public ActionResult AddOrder()
        {

            listOfShoppingCarts = Session["CartItem"] as List<ShoppingCart>;
            
            Customer customerObj = new Customer
            {
                CustomerId = customerId,
                CustomerUserName = User.Identity.Name
            };
            _DbEntities.Customers.Add(customerObj);
            _DbEntities.SaveChanges();

            customerId = customerObj.CustomerId;

            CustomerOrder orderObj = new CustomerOrder
            {
                OrderDate = DateTime.Now,
                OrderNumber = string.Format("{0:ddmmyyyyyHHmmss}", DateTime.Now),
                CustomerId = customerId
            };
            _DbEntities.CustomerOrders.Add(orderObj);
            _DbEntities.SaveChanges();


            OrderId = orderObj.OrderId;
            TempData["orderNUmber"] = orderObj.OrderNumber;

            string orderNUmber = orderObj.OrderNumber.ToString();

            foreach (var item in listOfShoppingCarts)
            {
                OrderDetail OrderDetailsObj = new OrderDetail();
                OrderDetailsObj.TotalAmount = item.Total;
                OrderDetailsObj.MenuItemId = item.MenuItemId;
                OrderDetailsObj.OrderId = OrderId;
                OrderDetailsObj.Quantity = item.Quantity;
                OrderDetailsObj.UnitPrice = item.UnitPrice;

                _DbEntities.OrderDetails.Add(OrderDetailsObj);
                _DbEntities.SaveChanges();
                
            }

            Session["CartItem"] = null;
            Session["CartCounter"] = null;

            return RedirectToAction("SendEmail");
        }


        public ActionResult SendEmail()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SendEmail(string windowUserEmail)
        {
            //User Declarations
            string subject = "Order Recieved";
            string body = "Hi, Customer " + User.Identity.Name + "order has been placed successfully";

            //Admin User Declarations
            string adminSubject = "New Order Placed By" + "\t" + User.Identity.Name;
            string adminBody = "Hi, Customer " + User.Identity.Name + "has placed a new order";
            string adminUserEmail = "demosmain21@gmail.com";

            WebMail.SmtpUseDefaultCredentials = true;

            //Send mail to User to an admin user to let them know a new order has been placed.
            WebMail.Send(windowUserEmail, subject, body, null, null, null, true, null, null);

            //Send mail to Admin User to an admin user to let them know a new order has been placed.
            WebMail.Send(adminUserEmail, adminSubject, adminBody, null, null, null, true, null, null);
            ViewBag.msg = "Email Successfully to "+ User.Identity.Name;

            return RedirectToAction("Index");
        }

    }
}