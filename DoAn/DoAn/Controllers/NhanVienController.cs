using DoAn.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace DoAn.Controllers
{
    public class NhanVienController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        // GET: Admin

       
        

      
        [AllowAnonymous]
        public ActionResult FlatLogin()
        {
            return View();
        }

        /*Login*/
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult FlatLogin(FormCollection collection)
        {
            var email = collection["email"];
            var password = collection["password"];
            var nv = data.NhanViens.SingleOrDefault(n => n.email == email && n.password == password);
            if (nv != null)
            {
                ViewBag.ThongBao = "Đã đăng nhập!";
                Session["TaiKhoan"] = nv;
                Session["IDuser"] = nv.role_id;
                Session["Name"] = nv.fullname;
                if(nv.role_id == 1)
                {
                    Session["RoleName"] = "Admin";
                }
                
                return RedirectToAction("Index", "NhanVien");
            }
            else
            {
                ViewBag.ThongBao = "Sai thông tin!";

                return View();
            }
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Index()
        {

            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("FlatLogin", "NhanVien");
            }

            return View();
        }

        public List<DonHang> getDonHang()
        {
            List<DonHang> listDonHang = Session["DonHang"] as List<DonHang>;
            if (listDonHang == null)
            {
                listDonHang = new List<DonHang>();
                Session["listDonHang"] = listDonHang;
            }
            return listDonHang;

        }

        public List<NhanVien> getNhanVien()
        {
            List<NhanVien> listNhanVien = Session["NhanVien"] as List<NhanVien>;
            if (listNhanVien == null)
            {
                listNhanVien = new List<NhanVien>();
                Session["listNhanVien"] = listNhanVien;
            }
            return listNhanVien;

        }
         public List<SanPham> getSanPham()
        {
            List<SanPham> listSanPham = Session["SanPham"] as List<SanPham>;
            if (listSanPham == null)
            {
                listSanPham = new List<SanPham>();
                Session["listSanPham"] = listSanPham;
            }
            return listSanPham;

        }

        public ActionResult DonHang()
        {
            var all_dh = (from s in data.DonHangs select s).OrderBy(m => m.id);
            return View(all_dh);
        }

        public ActionResult NhanVien()
        {
            var all_nv = (from s in data.NhanViens select s).OrderBy(m => m.id);
            return View(all_nv);
        }

        

        public ActionResult KhachHang()
        {
            var all_kh = (from s in data.KhachHangs select s).OrderBy(m => m.id);
            return View(all_kh);
        }


        


        public string ProcessUpload(HttpPostedFileBase file)
        {
            if (file == null)
            {
                return "";
            }
            file.SaveAs(Server.MapPath("~/Content/images/" + file.FileName));
            return "/Content/images/" + file.FileName;
        }

        /*DonHang*/

        //-----------------------------------------
        public ActionResult Delete(int id)
        {
            var D_NhanVien = data.DonHangs.First(m => m.id == id);
            return View(D_NhanVien);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_NhanVien = data.DonHangs.Where(m => m.id == id).First();
            data.DonHangs.DeleteOnSubmit(D_NhanVien);
            data.SubmitChanges();
            return RedirectToAction("DonHang");
        }
        /*end DonHang*/

        /*NhanVien*/
        public ActionResult CreateNV()
        {
            if (int.Parse(Session["IDuser"].ToString()) == 1)
                return View();
            else
            {
                ViewBag.ErrorAccess = "Bạn không có quyền truy cập trang này!";
                return RedirectToAction("Index", "NhanVien");
            }
        }
        [HttpPost]
        public ActionResult CreateNV(FormCollection collection, NhanVien s)
        {
            var fullname = collection["fullname"];
            var email = collection["email"];
            var phone_number = collection["phone_number"];
            var address = collection["address"];
            var password = collection["password"];
            var role_id = collection["role_id"];
            

            if (string.IsNullOrEmpty(fullname))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                s.fullname = fullname.ToString();
                s.email = email.ToString();
                s.phone_number = phone_number;
                s.address = address;
                s.password = password;

                data.NhanViens.InsertOnSubmit(s);
                data.SubmitChanges();
                return RedirectToAction("NhanVien");
            }
            return this.CreateNV();
        }
       
        public ActionResult EditNV(int id)
        {
            var E_NhanVien = data.NhanViens.First(m => m.id == id);
            return View(E_NhanVien);
        }
        [HttpPost]
        public ActionResult EditNV(int id, FormCollection collection)
        {
            var NhanVien = data.NhanViens.First(m => m.id == id);
            var fullname = collection["fullname"];
            var email = collection["email"];
            var phone_number = collection["phone_number"];
            var address = collection["address"];
            var password = collection["password"];
            var role_id = int.Parse(collection["role_id"]);
            NhanVien.id = id;




            if (string.IsNullOrEmpty(fullname))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                NhanVien.fullname = fullname;
                NhanVien.email = email;
                NhanVien.phone_number = phone_number;
                NhanVien.address = address;
                NhanVien.password = password;
                NhanVien.role_id = role_id;
                UpdateModel(NhanVien);


                data.SubmitChanges();
                return RedirectToAction("NhanVien");
            }

            return this.EditNV(id);
        }



        //-----------------------------------------
        public ActionResult DeletenV(int id)
        {
            var D_NhanVien = data.NhanViens.First(m => m.id == id);
            return View(D_NhanVien);
        }
        [HttpPost]
        public ActionResult DeleteNV(int id, FormCollection collection)
        {
            var D_NhanVien = data.NhanViens.Where(m => m.id == id).First();
            data.NhanViens.DeleteOnSubmit(D_NhanVien);
            data.SubmitChanges();
            return RedirectToAction("NhanVien");
        }
        /*end NhanVien*/

        /*SanPham*/
        public ActionResult SanPham()
        {
            var all_sp = (from s in data.SanPhams select s).OrderBy(m => m.id);
            return View(all_sp);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(SanPham model)
        {
            data.SanPhams.InsertOnSubmit(model);
            try
            {
                data.SubmitChanges();
                return Json(new { success = true });

            }
            catch (Exception ex)
            {
                return Json(new { success = false });

            }
        }

        public ActionResult abc()
        {
            return View();
        }

        /*end SanPham*/



    }
}