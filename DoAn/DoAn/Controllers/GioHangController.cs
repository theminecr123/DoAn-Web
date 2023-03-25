using DoAn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn.Controllers
{
    public class GioHangController : Controller
    {
            MyDataDataContext data = new MyDataDataContext();
            public List<GioHang> getGioHang()
            {
                List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
                if (listGioHang == null)
                {
                    listGioHang = new List<GioHang>();
                    Session["GioHang"] = listGioHang;
                }
                return listGioHang;

            }

        public ActionResult addCart(int id, string strURL)
        {
            List<GioHang> listGioHang = getGioHang();
            GioHang sanpham = listGioHang.Find(n => n.id == id);
            if (sanpham == null)
            {
                sanpham = new GioHang(id);
                listGioHang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.quantity++;
                return Redirect(strURL);
            }
        }


        private int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tsl = listGioHang.Sum(n => n.quantity);
            }
            return tsl;
        }

        private int TongSoLuongSanPham()
        {
            int tsl = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tsl = listGioHang.Count;
            }
            return tsl;
        }
        private double TongTien()
        {
            double tt = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tt = listGioHang.Sum(n => n.thanhtien);
            }
            return tt;
        }

        public ActionResult GioHang()
        {
            List<GioHang> listGioHang = getGioHang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();

            return View(listGioHang);
        }

        public ActionResult GioHangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return PartialView();
        }
        public ActionResult XoaGioHang(int id)
        {          
            List<GioHang> listGioHang = getGioHang();
            GioHang sanpham = listGioHang.SingleOrDefault(n => n.id == id);
            if (sanpham != null)
            {
                listGioHang.RemoveAll(n => n.id == id);
                return RedirectToAction("GioHang");
            }
            return RedirectToAction("GioHang");
        }

       
        public ActionResult CapNhatGioHang(int id, FormCollection collection)
        {
            List<GioHang> listGioHang = getGioHang();
            

            GioHang sanpham = listGioHang.SingleOrDefault(n => n.id == id);

            if (sanpham != null)
            {
                sanpham.quantity = int.Parse(collection["txtSoLg"].ToString());
            }

            return RedirectToAction("GioHang");
        }

        public ActionResult XoaAllGioHang()
        {
            List<GioHang> listGioHang = getGioHang();
            listGioHang.Clear();
            return RedirectToAction("GioHang");
        }


        [HttpGet]
        public ActionResult DatHang()
        {

            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("FlatLogin", "KhachHang");
            }

            if (Session["GioHang"] == null)
            {

                return RedirectToAction("Index", "SanPham");
            }
            List<GioHang> listGioHang = getGioHang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.TongSoluongsanpham = TongSoLuongSanPham();

            return View(listGioHang);
        }

        public ActionResult DatHang(FormCollection collection)
        {
            DonHang dh = new DonHang();
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            SanPham s = new SanPham();

            List<GioHang> gh = getGioHang();
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayGiao"]);

            dh.KH_id = kh.id;
            dh.order_date = DateTime.Now;
            dh.status = 0;
            //dh.thanhtoan = false;

            data.DonHangs.InsertOnSubmit(dh);
            data.SubmitChanges();
            foreach (var item in gh)
            {
                ChiTietDonHang ctdh = new ChiTietDonHang();
                ctdh.order_id = dh.id;
                ctdh.product_id = item.id;
                ctdh.num = item.quantity;
                ctdh.price = (int)item.thanhtien;
                s = data.SanPhams.Single(n => n.id == item.id);
                s.quantity -= ctdh.num;
                data.SubmitChanges();

                data.ChiTietDonHangs.InsertOnSubmit(ctdh);
            }

            data.SubmitChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XacNhan", "GioHang");
        }

        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
    }
}