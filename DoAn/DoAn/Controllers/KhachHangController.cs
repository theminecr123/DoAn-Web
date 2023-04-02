using DoAn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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
                Session["IDuser"] = kh.role_id;
                Session["Name"] = kh.fullname;
                return RedirectToAction("Index", "SanPham");
            }
            else
            {
                ViewBag.ThongBao = "Sai thông tin tài khoản";
                return View();
            }
        }

            public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ProfileKH()
        {
            return View();
        }

        // GET: KhachHang
        public ActionResult Index()
        {
            return View();
        }
    }
}