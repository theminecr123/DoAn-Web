using DoAn.common;
using DoAn.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace DoAn.Controllers
{
    public class KhachHangController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();

        public bool CheckUser( string email)
        {
            var check = data.KhachHangs.Any(n => n.email == email);
            if (check == true)
                return true;

            return false;
        }

        public static string HashPassword(string password)
        {
            using (var sha256 = new SHA256Managed())
            {
                var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }
        
        [HttpGet]
        public ActionResult FlatModernSignup()
        {
            return View("FlatLogin");
        }

        [HttpPost]
        public ActionResult FlatModernSignUp(FormCollection collection, KhachHang kh)
        {
            var fullname = collection["fullname"];
            var userPass = collection["password"];
            var passConfirm = collection["passConfirm"];
            var email = collection["email"];
            var phone_number = collection["phone_number"];

            if (CheckUser(email) == true)
            {
                ViewData["TrungEmail"] = "Email đã tồn tại!";
                return View("FlatLogin");
                
            }

            else if (String.IsNullOrEmpty(passConfirm))
            {
                ViewData["NhappasswordXacNhan"] = "Nhập Mật khẩu xác nhận!";
            }

            else
            {
                if (!userPass.Equals(passConfirm))
                {
                    ViewData["passwordGiongNhau"] = "Mật khẩu và Mật khẩu xác nhận phải giống nhau";
                }
                else
                {
                    kh.fullname = fullname;
                    kh.password = HashPassword(userPass);
                    kh.email = email;
                    kh.phone_number = phone_number;
                    kh.role_id = 2;

                    data.KhachHangs.InsertOnSubmit(kh);
                    data.SubmitChanges();

                    return RedirectToAction("FlatLogin", "KhachHang");
                }

            }
            return View("FlatLogin");
        }


        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult FlatLogin()
        {
            return View();
        }


    public static bool VerifyPassword(string password, string hashedPassword)
    {
        using (var sha256 = new SHA256Managed())
        {
            var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            var hashedString = BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            return hashedString.Equals(hashedPassword);
        }
    }
        /*Login*/
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult FlatLogin(FormCollection collection)
        {
            var email = collection["email"];
            var password = collection["password"];
            var kh = data.KhachHangs.SingleOrDefault(n => n.email == email);

            if (kh != null && VerifyPassword(password, kh.password))
            {
                ViewBag.ThongBao = "Đã đăng nhập!";
                Session["TaiKhoan"] = kh;
                Session["IDKH"] = kh.id;
                Session["IDuser"] = kh.role_id;
                Session["Name"] = kh.fullname;
                Session["Address"] = kh.address;
                return RedirectToAction("Index", "SanPham");
            }
            else
            {
                ViewData["CheckMK"] = "Sai Thông Tin tài khoản! ";
                return View();
            }
        }

            public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Info(int? id)
        {
            
            if (id == null || Session["IDKH"] == null)
                return RedirectToAction("Index", "Home");
            else if(id != int.Parse(Session["IDKH"].ToString()))
            {
                return RedirectToAction("Info", "KhachHang", new {id = int.Parse(Session["IDKH"].ToString()) });

            }
            var kh = data.KhachHangs.First(x=>x.id == id);
            return View(kh);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("FlatLogin", "KhachHang");

            }
            var kh = data.KhachHangs.First(m => m.id == id);
            return View(kh);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            

            var kh = data.KhachHangs.First(m => m.id == id);
            var fullname = collection["fullname"];
            var email = collection["email"];
            var address = collection["address"];

            
            kh.id = id;         
                kh.fullname = fullname;
                kh.address = address;
                data.SubmitChanges();
            Session["TaiKhoan"] = kh;
            Session["IDKH"] = kh.id;
            Session["IDuser"] = kh.role_id;
            Session["Name"] = kh.fullname;
            Session["Address"] = kh.address;
            return RedirectToAction("Info", "KhachHang", new { id = kh.id });
           
                     



        }
        public ActionResult changePassword(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("FlatLogin", "KhachHang");

            }
            var kh = data.KhachHangs.First(m => m.id == id);
            return View(kh);
        }

        [HttpPost]
        public ActionResult changePassword(int id, FormCollection collection)
        {
            var kh = data.KhachHangs.First(m => m.id == id);
            var oldPassword = collection["oldPassword"];
            var password = collection["password"];
            var confirmPassword = collection["confirmPassword"];
            kh.id = id;
            if (!Equals(password, confirmPassword))
            {
                ViewData["passwordGiongNhau"] = "Mật khẩu và Mật khẩu xác nhận phải giống nhau";
                return View(kh);
            }

            if (VerifyPassword(oldPassword, kh.password))
            {
                kh.password = HashPassword(password);
                data.SubmitChanges();
                return RedirectToAction("Info", "KhachHang", new { id = kh.id });

            }

            else
            {
                ViewData["saiMK"] = "Mật khẩu sai";
                return View(kh);
            }
        }

        public ActionResult resetPass(string email)
        {
            Random random = new Random();
            
            int otp = random.Next(100000, 999999); 
            ViewBag.OTP = otp;
            //string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/common/neworder.html"));
            //content = content.Replace("{{otp}}", otp.ToString());
          
            //var toEmail = email;

            //new MailHelper().SendMail(email, "Ricie - Web bán gạo hàng đầu Hutech.", content);
            //new MailHelper().SendMail(toEmail, "Ricie - Web bán gạo hàng đầu Hutech.", content);

            return View();
        }

        // GET: KhachHang
        public ActionResult Index()
        {
            return RedirectToAction("FlatLogin", "KhachHang");
        }


    }
}