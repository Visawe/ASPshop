using MyInetShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyInetShop.Controllers
{
    public class HomeController : Controller
    {
        MyModel context = new MyModel();
        public ActionResult Index()
        {
            IList<Category> categories = context.Categories.Local.ToList();
            return View(MakeTreeFromCategory());
        }

        public ActionResult ShowProduct(int id)
        {
            Category category  = context.Categories.Find(id);
            
                return View(category.Products);
        }

        public ActionResult ShowProductsbyCategory(int id)
        {
            Category category = context.Categories.Find(id);
            
            return View(category.Products.ToList());

        }

        public ActionResult ShowProductbyId(int id)
        {
            Product product = context.Products.Find(id);
            return View(product);
        }

        private Dictionary<int, List<Category>> MakeTreeFromCategory()
        {
            Dictionary<int, List<Category>> TreeCategories = new Dictionary<int, List<Category>>();
            IList<Category> categories = context.Categories.ToList();
            foreach (Category category in categories)
            {
                if (category.ParentCategory == null)
                {
                    int index = 0;
                    AddCategoryInTree(TreeCategories, category, index);
                }
                else
                {
                    AddCategoryInTree(TreeCategories, category, (int)category.ParentCategoryId);
                }
            }
            return TreeCategories;
        }

        private static void AddCategoryInTree(Dictionary<int, List<Category>> TreeCategories, Category category, int index)
        {
            if (!TreeCategories.ContainsKey(index))
            {
                TreeCategories.Add(index, new List<Category>());
            }
            TreeCategories[index].Add(category);
        }
    }
}