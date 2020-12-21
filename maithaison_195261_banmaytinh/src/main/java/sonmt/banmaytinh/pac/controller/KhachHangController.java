package sonmt.banmaytinh.pac.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import sonmt.banmaytinh.pac.model.Giohang;
import sonmt.banmaytinh.pac.model.Hoadon;
import sonmt.banmaytinh.pac.model.Maytinh;
import sonmt.banmaytinh.pac.model.OrderDetail;
import sonmt.banmaytinh.pac.paypal.PaymentServices;
import sonmt.banmaytinh.pac.repository.BinhLuanRepository;
import sonmt.banmaytinh.pac.repository.ChiTietHoaDonRepository;
import sonmt.banmaytinh.pac.repository.GioHangRepository;
import sonmt.banmaytinh.pac.repository.HoaDonRepository;
import sonmt.banmaytinh.pac.repository.HopThuRepository;
import sonmt.banmaytinh.pac.repository.KhachHangRepository;
import sonmt.banmaytinh.pac.repository.MayTinhRepository;
import sonmt.banmaytinh.pac.repository.PhanHoiRepository;
import sonmt.banmaytinh.pac.service.JoinQueryService;

@Controller
@RequestMapping(value = "/trangkhachhang")
public class KhachHangController {
	
	@Autowired
	private KhachHangRepository khachHangRepository;

	@Autowired
	private GioHangRepository gioHangRepository;
	
	@Autowired
	private MayTinhRepository mayTinhRepository;
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	@Autowired
	private ChiTietHoaDonRepository chiTietHoaDonRepository;
	
	@Autowired
	private BinhLuanRepository binhLuanRepository;
	
	@Autowired
	private PhanHoiRepository phanHoiRepository;
	
	@Autowired
	private JoinQueryService joinQueryService;
	
	//vao trang gio hang
	@RequestMapping(value = "/tranggiohang/{makh}")
	public String GetTrangGioHang(@PathVariable int makh,
			Model hotenkhachhang,
			Model danhsachsanpham,
			Model tongtienthanhtoan,
			Model thongtinkhachhang,
			Model soluongsanpham)
	{
		//ho ten va danh sach san pham
		hotenkhachhang.addAttribute("hoten", SecurityContextHolder.getContext().getAuthentication().getName());	
		
		List<Giohang> dssp = gioHangRepository.TimToanBoSanPham(makh);
		danhsachsanpham.addAttribute("danhsachsanpham", dssp);
		
		int tongtien = 0;
		int soluongsanpham1 = 0;
		//tong tien thanh toan
		for (Giohang sp : dssp) {
			tongtien+=sp.getGia()*sp.getSoluong();
			soluongsanpham1++;
		}
		soluongsanpham.addAttribute("soluongsanpham1", soluongsanpham1);
		//tong tien thanh toan
		tongtienthanhtoan.addAttribute("tongtien", tongtien);
		//thong tin khach hang
		thongtinkhachhang.addAttribute("ttkh", khachHangRepository.findByMakh(makh));
		return "/khachhang/TrangGioHang"; 
	}
	
	//xu ly them vao gio hang
	@RequestMapping(value = "/xulythemvaogiohang/{masanpham}")
	public String XuLyThemVaoGioHang(@PathVariable String masanpham)
	{
		//lay thong tin de chen
		//ma khach hang
		int makh = Integer.parseInt(SecurityContextHolder.getContext().getAuthentication().getName());
		// thong tin may tinh
		Maytinh mt = mayTinhRepository.TimKiemMayTinh(masanpham);
		//tim kiem trong gio hang
		Giohang giohang = gioHangRepository.TimKiemTrongGioHang1(masanpham, makh);
		//neu chua co trong gio
		if(giohang==null)
		{
			//them vao gio hang
			gioHangRepository.ThemVaoGioHang1(masanpham, mt.getTensanpham(), makh, mt.getGia(), 1);
		}
		else {
			System.out.println("Đã có trong giỏ hàng");
		}
		//neu da co trong gio
		
		return "redirect:/trangchu";	
	}
	
	//cap nhat so luong
	@RequestMapping(value = "/capnhatsoluong/{masanpham}")
	public String CapNhatSoLuong(@PathVariable String masanpham,
			@RequestParam(required = true)int soluong)
	{
		//ma khach hang
		int makh = Integer.parseInt(SecurityContextHolder.getContext().getAuthentication().getName());	
		gioHangRepository.CapNhatSoLuong1(masanpham, makh, soluong);
		
		//redirectAttributes.addAttribute("masanpham", masanpham);
		return "redirect:/trangkhachhang/tranggiohang/"+Integer.toString(makh);
	}
	
	//xu ly xoa bot khoi gio hang
	@RequestMapping(value = "/xulyxoakhoigiohang/{masanpham}")
	public String XuLyXoaKhoiGioHang(@PathVariable String masanpham)
	{
		// 
		int makh = Integer.parseInt(SecurityContextHolder.getContext().getAuthentication().getName());
		//Maytinh mt = mayTinhRepository.TimKiemMayTinh(masanpham);
		
		//xoa khoi gio
		gioHangRepository.XoaKhoiGioHang(makh, masanpham);
		return "redirect:/trangkhachhang/tranggiohang/"+Integer.toString(makh);
	}
	
	//xuat hoa don khong qua paypal
	@RequestMapping(value = "/xuathoadon/{makh}")
	public String XuatHoaDon(@PathVariable int makh)
	{
		//them hoa don
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		String ngaydathang = formatter.format(date);  
		hoaDonRepository.ThemHoaDon(makh, ngaydathang, false, 0);
		
		//tim hoa don vua moi them
		Hoadon hoadon = hoaDonRepository.TimHoaDonVuaMoiThem(makh);
		
		//them chi tiet hoa don
		List<Giohang> dssp = gioHangRepository.TimToanBoSanPham(makh);
		for (Giohang sp : dssp) {
			chiTietHoaDonRepository.ThemChiTietHoaDon(hoadon.getMahoadon(), sp.getMasanpham(), sp.getSoluong());
			//update so luong may tinh
			mayTinhRepository.CapNhatSoLuong(sp.getMasanpham(), sp.getSoluong());
		}
		
		//xoa gio hang
		gioHangRepository.XoaToanBoKhoiGioHang(makh);
		
		return "redirect:/trangchu";
	}
	
	//chon thanh toan paypal
	@RequestMapping(value = "/chonthanhtoanpaypal/{makh}")
	public String ThanhToanPayPal(@PathVariable int makh,HttpServletRequest request,HttpServletResponse response)
	{
		/*String product = request.getParameter("product");
        String subtotal = request.getParameter("subtotal");
        String shipping = request.getParameter("shipping");
        String tax = request.getParameter("tax");
        String total = request.getParameter("total");*/
		List<Giohang> dssp = gioHangRepository.TimToanBoSanPham(makh);
		int tongtien = 0;
		
		//tong tien thanh toan
		for (Giohang sp : dssp) {
			tongtien+=sp.getGia()*sp.getSoluong();	
		}
		
        OrderDetail orderDetail = new OrderDetail(dssp, Integer.toString(tongtien), "0", "0", Integer.toString(tongtien));
        
        try {
        	
        	PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);
            //System.out.println(approvalLink);
            //response.sendRedirect(approvalLink);
            return "redirect:" + approvalLink;
		} catch (PayPalRESTException e) {
			// TODO: handle exception
			request.setAttribute("errorMessage", e.getMessage());
			return "error";
		}
        	
		//return "redirect:/trangchu";
	}
	
	//xem lai hoa don
	@RequestMapping(value = "/review_payment")
	public String review_payment(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
         
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.getPaymentDetails(paymentId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
             
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("shippingAddress", shippingAddress);
             
            request.setAttribute("paymentId", paymentId);
            request.setAttribute("payerID", payerId);
            //String url = "/khachhang/review";
            return "/khachhang/review"; 
            //request.getRequestDispatcher(url).forward(request, response);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            return "error";
            //request.getRequestDispatcher("error.jsp").forward(request, response);
        }      
	}
	
	//xu ly thanh toan paypal
	@RequestMapping(value = "/tienhanhthanhtoanpaypal")
	public String TienHanhThanhToanPaypal(HttpServletRequest request,HttpServletResponse response)
	{
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
             
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);          
 
            //request.getRequestDispatcher("receipt.jsp").forward(request, response);
            return "/khachhang/receipt"; 
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            //request.getRequestDispatcher("error.jsp").forward(request, response);
            return "error";
        }
        finally {
        	//xoa gio hang
        	int makh = Integer.parseInt(SecurityContextHolder.getContext().getAuthentication().getName());
        	
        	//them hoa don
    		Date date = new Date();
    		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    		String ngaydathang = formatter.format(date);  
    		hoaDonRepository.ThemHoaDon(makh, ngaydathang, false, 1);
    		
    		//tim hoa don vua moi them
    		Hoadon hoadon = hoaDonRepository.TimHoaDonVuaMoiThem(makh);
    		
    		//them chi tiet hoa don
    		List<Giohang> dssp = gioHangRepository.TimToanBoSanPham(makh);
    		for (Giohang sp : dssp) {
    			chiTietHoaDonRepository.ThemChiTietHoaDon(hoadon.getMahoadon(), sp.getMasanpham(), sp.getSoluong());
    			//update so luong may tinh
    			mayTinhRepository.CapNhatSoLuong(sp.getMasanpham(), sp.getSoluong());
    		}
    		
    		gioHangRepository.XoaToanBoKhoiGioHang(makh);	
        }
	}
	
	//vao trang thong tin khach hang
	@RequestMapping(value = "/trangthongtinkhachhang/{makh}")
	public String getTrangThongTinKhachHang(@PathVariable int makh,
			Model hotenkhachhang,
			Model thongtinkhachhang)
	{
		hotenkhachhang.addAttribute("hoten", SecurityContextHolder.getContext().getAuthentication().getName());	
		thongtinkhachhang.addAttribute("ttkh", khachHangRepository.findByMakh(makh));
		return "/khachhang/TrangThongTinKhachHang";
	}
	
	//sua thong tin khach hang
	@RequestMapping(value = "/trangthongtinkhachhang/xulysuathongtinkhachhang/{makh}")
	public String XuLySuaThongTin(@PathVariable int makh,
			@RequestParam String matkhau,
			@RequestParam String xacnhanmatkhau,
			@RequestParam String diachi,
			@RequestParam String sodienthoai)
	{
		if(!matkhau.isEmpty() && !xacnhanmatkhau.isEmpty())
		{
			if(matkhau.equals(xacnhanmatkhau))
			{
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				matkhau = passwordEncoder.encode(matkhau);
				khachHangRepository.ThayDoiMatKhau(makh, matkhau);
			}
			else {
				System.out.println("Mật khẩu không đúng");
			}
		}
		if(!diachi.isEmpty())
		{
			khachHangRepository.ThayDoiDiaChi(makh, diachi);
		}
		
		if(!sodienthoai.isEmpty())
		{
			if(isValidPhone(sodienthoai))
			{
				khachHangRepository.ThayDoiSoDienThoai(makh, sodienthoai);	
			}
			else {
				
			}
		}
		
		return "redirect:/trangchu";
	}
	
	//luu binh luan
	@RequestMapping(value = "/luubinhluan/{masanpham}")
	public String LuuBinhLuan(@PathVariable String masanpham,@RequestParam String binhluan)
	{
		if(binhluan.length() > 100)
		{
			System.out.println("Bình luận quá dài");
		}
		else if (binhluan.length() == 0) {
			System.out.println("Phải điền chữ vào");
		}
		else {
			int makh = Integer.parseInt(SecurityContextHolder.getContext().getAuthentication().getName());
			Date date = new Date();
    		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    		String ngaybinhluan = formatter.format(date);  
    		
    		binhLuanRepository.ThemBinhLuan(makh, masanpham, ngaybinhluan, binhluan, false);
		}
		return "redirect:/trangchitietsanpham/" + masanpham;
	}
	
	//luu phan hoi
	@RequestMapping(value = "/luuphanhoi/{masanpham}/{mabinhluan}")
	public String LuuPhanHoi(@PathVariable String masanpham,@PathVariable int mabinhluan,@RequestParam(required = false) String phanhoi)
	{
		if(phanhoi.length() > 100)
		{
			System.out.println("Bình luận quá dài");
		}
		else if (phanhoi.length() == 0) {
			System.out.println("Phải điền chữ vào");
		}
		else {
			int makh = Integer.parseInt(SecurityContextHolder.getContext().getAuthentication().getName());
			Date date = new Date();
    		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    		String ngayphanhoi = formatter.format(date);  
    		
    		phanHoiRepository.ThemPhanHoi(mabinhluan, makh, ngayphanhoi, phanhoi);
    		//binhLuanRepository.ThemBinhLuan(makh, masanpham, ngaybinhluan, phanhoi, false);			
		}
		return "redirect:/trangchitietsanpham/" + masanpham;
	}
	
	//vao trang hoa don
	@RequestMapping(value = "/tranghoadon/{makh}")
	public String GetTrangHoaDon(@PathVariable int makh,
			Model hotenkhachhang,			
			Model danhsachhoadon)
	{
		hotenkhachhang.addAttribute("hoten", SecurityContextHolder.getContext().getAuthentication().getName());	
		//thongtinkhachhang.addAttribute("ttkh", khachHangRepository.findByMakh(makh));
		
		danhsachhoadon.addAttribute("danhsachhoadon", hoaDonRepository.TimTatCaHoaDonCua(makh));
		
		return "/khachhang/TrangHoaDon";
	}
	
	//vao trang chi tiet hoa don
	@RequestMapping(value = "/trangchitiethoadon/{makh}/{mahoadon}")
	public String ChiTietHoaDon(@PathVariable int makh,
			@PathVariable int mahoadon,
			Model hoadon,
			Model hotenkhachhang,
			Model thongtinkhachhang,
			Model chitiethoadon)
	{
		hotenkhachhang.addAttribute("hoten", SecurityContextHolder.getContext().getAuthentication().getName());	
		hoadon.addAttribute("hoadon", hoaDonRepository.TimHoaDonTheoMa(mahoadon));
		
		thongtinkhachhang.addAttribute("ttkh", khachHangRepository.findByMakh(makh));
		chitiethoadon.addAttribute("chitiethoadon", joinQueryService.danhSachBills(mahoadon));
		
		return "/khachhang/TrangChiTietHoaDon";
	}
	
	@RequestMapping(value = "/xoataikhoan/{makh}")
	public String XoaTaiKhoan(@PathVariable int makh)
	{
		khachHangRepository.VoHieuHoa(makh, false);
		String thongbao = "remove account successfully!!!";
		return "redirect:/dangxuat?thongbao="+thongbao;
	}
	
	//kiem tra so dien thoai
	public boolean isValidPhone(String phone) 
	{ 
		if(phone.length() == 10)
		{
			if(phone.charAt(0)=='0')
			{
				if(phone.charAt(1) == 3 || phone.charAt(1) == 8 || phone.charAt(1) == 9)
				{
					System.out.println("Số điện thoại hợp lệ");
					return true;
				}
				else {
					System.out.println("Số điện thoại không hợp lệ");
					return false;
				}
			}
			else {
				System.out.println("Đầu số điện thoại không hợp lệ");
				return false;
			}
		}
		else {
			System.out.println("Độ dài không hợp lệ");
			return false;
		}
	} 

}







