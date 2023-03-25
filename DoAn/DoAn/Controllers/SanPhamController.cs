using DoAn.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Web.UI;
using X.PagedList;
using Microsoft.Ajax.Utilities;

namespace DoAn.Controllers
{
    public class SanPhamController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        // GET: SanPham
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            var all_sp = (from s in data.SanPhams select s).OrderBy(m => m.id); 
            int pageSize = 6;
            int pageNum = page ?? 1;
            return View(all_sp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Detail(int id)
        {
            var sp = data.SanPhams.Where(m => m.id == id).First();
            if(sp != null)
            {
                return View(sp);
            }
            else
            {
                return HttpNotFound();
            }
            
        }
    }
}