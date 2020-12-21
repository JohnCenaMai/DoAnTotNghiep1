package sonmt.banmaytinh.pac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sonmt.banmaytinh.pac.mailtext.MyConstants;
import sonmt.banmaytinh.pac.model.Banphim;
import sonmt.banmaytinh.pac.model.Bonho;
import sonmt.banmaytinh.pac.model.Boxuly;
import sonmt.banmaytinh.pac.model.Chatlieu;
import sonmt.banmaytinh.pac.model.Chitiethoadon;
import sonmt.banmaytinh.pac.model.Dohoa;
import sonmt.banmaytinh.pac.model.Hedieuhanh;
import sonmt.banmaytinh.pac.model.Loa;
import sonmt.banmaytinh.pac.model.Manhinh;
import sonmt.banmaytinh.pac.model.Maytinh;
import sonmt.banmaytinh.pac.model.Pin;
import sonmt.banmaytinh.pac.model.Ram;
import sonmt.banmaytinh.pac.model.TongChiTheoThang;
import sonmt.banmaytinh.pac.repository.BanPhimRepository;
import sonmt.banmaytinh.pac.repository.BinhLuanRepository;
import sonmt.banmaytinh.pac.repository.BoNhoRepository;
import sonmt.banmaytinh.pac.repository.BoXuLyRepository;
import sonmt.banmaytinh.pac.repository.ChatLieuRepository;
import sonmt.banmaytinh.pac.repository.ChiTietHoaDonRepository;
import sonmt.banmaytinh.pac.repository.DoHoaRepository;
import sonmt.banmaytinh.pac.repository.HeDieuHanhRepository;
import sonmt.banmaytinh.pac.repository.HoaDonRepository;
import sonmt.banmaytinh.pac.repository.HopThuRepository;
import sonmt.banmaytinh.pac.repository.KhachHangRepository;
import sonmt.banmaytinh.pac.repository.LoaRepository;
import sonmt.banmaytinh.pac.repository.ManHinhRepository;
import sonmt.banmaytinh.pac.repository.MayTinhChiTietRepository;
import sonmt.banmaytinh.pac.repository.MayTinhRepository;
import sonmt.banmaytinh.pac.repository.PhanHoiRepository;
import sonmt.banmaytinh.pac.repository.PinRepository;
import sonmt.banmaytinh.pac.repository.RamRepository;
import sonmt.banmaytinh.pac.service.JoinQueryService;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/trangquantri")
public class QuanTriController {

	@Autowired
	private KhachHangRepository khachHangRepository;
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	@Autowired
	private ChiTietHoaDonRepository chiTietHoaDonRepository;
	
	@Autowired
	private MayTinhRepository mayTinhRepository;
	
	@Autowired
	private MayTinhChiTietRepository mayTinhChiTietRepository;
	
	@Autowired 
	private BoXuLyRepository boXuLyRepository;
	
	@Autowired
	private RamRepository ramRepository;
	
	@Autowired
	private DoHoaRepository doHoaRepository;
	
	@Autowired
	private ManHinhRepository manHinhRepository;
	
	@Autowired
	private PinRepository pinRepository;
	
	@Autowired
	private LoaRepository loaRepository;
	
	@Autowired
	private HeDieuHanhRepository heDieuHanhRepository;
	
	@Autowired
	private ChatLieuRepository chatLieuRepository;
	
	@Autowired
	private BanPhimRepository banPhimRepository;
	
	@Autowired
	private BoNhoRepository boNhoRepository;
	
	@Autowired
	private BinhLuanRepository binhLuanRepository;
	
	@Autowired
	private PhanHoiRepository phanHoiRepository;
	
	@Autowired
	private HopThuRepository hopThuRepository;
	
	@Autowired
	private JoinQueryService joinQueryService;
	
	@Autowired
    public JavaMailSender emailSender;
	
	private Maytinh maytinhthem;
	private Boxuly boxulythem;
	private Ram ramthem;
	private Dohoa dohoathem;
	private Manhinh manhinhthem;
	private Pin pinthem;
	private Loa loathem;
	private Hedieuhanh hedieuhanhthem;
	private Chatlieu chatlieuthem;
	private Banphim banphimthem;
	private Bonho bonhothem;
	
	boolean xacnhanmoi = false;
	
	@RequestMapping(value = "/")
	public String GetTrangQuanTri(Model thongtinquantrivien,
			Model danhsachmaytinh,
			Model danhsachkhachhang,
			Model danhsachhoadon,
			Model danhsachbinhluan,
			Model danhsachhopthu)
	{
		//thong tin quan tri vien
		int maquantrivien = Integer.parseInt(SecurityContextHolder.getContext().getAuthentication().getName());
		thongtinquantrivien.addAttribute("ttqtv", khachHangRepository.findByMakh(maquantrivien));
		
		//Pageable pageable = PageRequest.of(1, 10);
		danhsachmaytinh.addAttribute("danhsachmaytinh", mayTinhRepository.LayDanhSachMayTinh());
		
		danhsachkhachhang.addAttribute("danhsachkhachhang", khachHangRepository.LayDanhSachKhachHang());
		
		danhsachhoadon.addAttribute("danhsachhoadon", hoaDonRepository.TimTatCaHoaDonTrongNam(2020));
		
		//phan binh luan
		danhsachbinhluan.addAttribute("danhsachbinhluan", joinQueryService.binhLuanPhanHoi());
		
		//phan hop thu
		danhsachhopthu.addAttribute("danhsachhopthu", hopThuRepository.DanhSachTatCaHopThu());
		
		return "/quantri/TrangQuanTri";
	}
	
	@RequestMapping(value = "/trangthemmoimaytinh")
	public String GetTrangThemMoiMayTinh(Model mamaytinh,
			Model maboxuly,
			Model maram,
			Model madohoa,
			Model mamanhinh,
			Model maloa,
			Model machatlieu,
			Model mabanphim,
			Model mabonho)
	{		
		mamaytinh.addAttribute("mamaytinh", mayTinhRepository.LayMaMayTinhCuoiCung());
		maboxuly.addAttribute("maboxuly", boXuLyRepository.LayMaBoXuLyCuoiCung());
		maram.addAttribute("maram", ramRepository.LayMaRamCuoiCung());
		madohoa.addAttribute("madohoa", doHoaRepository.LayMaDoHoaCuoiCung());
		mamanhinh.addAttribute("mamanhinh", manHinhRepository.LayMaManHinhCuoiCung());
		maloa.addAttribute("maloa", loaRepository.LayMaLoaCuoiCung());
		machatlieu.addAttribute("machatlieu", chatLieuRepository.LayMaChatLieuCuoiCung());
		mabanphim.addAttribute("mabanphim", banPhimRepository.LayMaBanPhimCuoiCung());
		mabonho.addAttribute("mabonho", boNhoRepository.LayMaBoNhoCuoiCung());
		
		return "/quantri/TrangThemMoiMayTinh";
	}

	@RequestMapping(value = "/xulythemmoimaytinh")
	public String XuLyThemMoiMayTinh(@Valid Maytinh maytinh)
	{
		if(xacnhanmoi == true)
		{
			//them thong tin co ban may tinh
			mayTinhRepository.save(maytinh);
			
			//them thong tin chi tiet may tinh
			mayTinhChiTietRepository.ThemMoiMayTinhChiTiet(maytinh.getMamaytinh(), boxulythem.getMacpu(), ramthem.getMaram(), 
					dohoathem.getMadohoa(), manhinhthem.getMamanhinh(), loathem.getMaloa(), pinthem.getMapin(), 
					hedieuhanhthem.getPhienbanhedieuhanh(), chatlieuthem.getMachatlieu(), 
					banphimthem.getMabanphim(), bonhothem.getMabonho());
		}
		
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaibonho")
	public String KiemTraTonTaiBoNho(@Valid Bonho bonho)
	{
		bonhothem = boNhoRepository.KiemTraTonTaiBoNho(bonho.getKieu(), bonho.getDungluong(), bonho.getTocdodocghi(), bonho.getSokhecam());
		if(bonhothem == null)
		{
			boNhoRepository.save(bonho);
			bonhothem = bonho;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaibanphim")
	public String KiemTraTonTaiBanPhim(@Valid Banphim banphim)
	{
		banphimthem = banPhimRepository.KiemTraTonTaiBanPhim(banphim.getBanphimso(), banphim.getLoaidenbanphim(), 
				banphim.getMaudenled(), banphim.getCongnghedenbanphim(), banphim.getTouchpad());
		if(banphimthem == null)
		{
			banPhimRepository.save(banphim);
			banphimthem = banphim;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaichatlieu")
	public String KiemTraTonTaiChatLieu(@Valid Chatlieu chatlieu)
	{
		chatlieuthem = chatLieuRepository.kiemTraTonTaiChatLieu(chatlieu.getChatlieumatbenngoaicung(), chatlieu.getChatlieukhungmanhinh(),
				chatlieu.getChatlieumatbanphim(), chatlieu.getChatlieumatlung());
		if(chatlieuthem == null)
		{
			chatLieuRepository.save(chatlieu);
			chatlieuthem = chatlieu;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaihedieuhanh")
	public String KiemTraTonTaihedieuhanh(@Valid Hedieuhanh hedieuhanh)
	{
		hedieuhanhthem = heDieuHanhRepository.KiemTraTonTaiHeDieuHanh(hedieuhanh.getPhienbanhedieuhanh(), hedieuhanh.getTen(), hedieuhanh.getKieu());
		if(hedieuhanhthem == null)
		{
			heDieuHanhRepository.save(hedieuhanh);
			hedieuhanhthem = hedieuhanh;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaipin")
	public String KiemTraTonTaiPin(@Valid Pin pin)
	{
		pinthem = pinRepository.KiemTraTonTaiPin(pin.getLoaipin(), pin.getCell(), pin.isThaoroi(), pin.getPowersupply());
		if(pinthem == null)
		{
			pinRepository.save(pin);
			pinthem = pin;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontailoa")
	public String KiemTraTonTaiLoa(@Valid Loa loa)
	{
		loathem = loaRepository.KiemTraTonTaiLoa(loa.getSoloa(), loa.getCongngheamthanh());
		if(loathem == null)
		{
			loaRepository.save(loa);
			loathem = loa;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaimanhinh")
	public String KiemTraTonTaiManHinh(@Valid Manhinh manhinh)
	{
		manhinhthem = manHinhRepository.KiemTraTonTaiManHinh(manhinh.getLoaicamung(), manhinh.getManhinhcamung(), manhinh.getDotuongphan(), 
				manhinh.getTylemanhinh(), manhinh.getDophumau(), manhinh.getCongnghe(), manhinh.getDosang(), 
				manhinh.getDophangiai(), manhinh.getTansoquet(), manhinh.getLoaimanhinh(), manhinh.getKichthuocmanhinh());
		
		if(manhinhthem == null)
		{
			manHinhRepository.save(manhinh);
			manhinhthem = manhinh;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaidohoa")
	public String KiemTraTonTaiDoHoa(@Valid Dohoa dohoa)
	{
		dohoathem = doHoaRepository.KiemTraTonTaiDoHoa(dohoa.getHang(), dohoa.getXungnhip(), dohoa.getXungnhiptoida(), 
				dohoa.getModel(), dohoa.getCardonboard());
		if(dohoathem == null)
		{
			doHoaRepository.save(dohoa);
			dohoathem = dohoa;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontairam")
	public String KiemTraTonTaiRam(@Valid Ram ram)
	{
		ramthem = ramRepository.KiemTraTonTaiRam(ram.getDungluong(), ram.getLoairam(), ram.getTocdoram(), 
				ram.getSokhecamroi(), ram.getSokheramconlai(), ram.getSoramonboard(), ram.getSoramtoida());
		if(ramthem == null)
		{
			ramRepository.save(ram);
			ramthem = ram;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/kiemtratontaiboxuly")
	public String KiemTraTonTaiBoXuLy(@Valid Boxuly boxuly)
	{
		boxulythem = boXuLyRepository.KiemTraTonTaiBoXuLy(boxuly.getCongnghecpu(), boxuly.getLoaicpu(), boxuly.getHangcpu(), boxuly.getTocdo(), 
				boxuly.getTocdotoida(), boxuly.getBonhodem(), boxuly.getTocdobus(), boxuly.getSoluong(), boxuly.getSoloi());
		if(boxulythem == null)
		{
			boXuLyRepository.save(boxuly);
			boxulythem = boxuly;
			xacnhanmoi = true;
		}
		else {
			System.out.println("Đã tồn tại trong bộ nhớ");
		}
		return "redirect:/trangquantri/trangthemmoimaytinh";
	}
	
	@RequestMapping(value = "/trangquanlykhachhang/{makh}")
	public String GetTrangQuanLyKhachHang(@PathVariable int makh,
			Model ngaythang,
			Model thongtinkhachhang,
			Model sodondattrongthang,
			Model sosanphammuatrongthang,
			Model soluottuongtacdanhgia,
			Model tongtienchiratrongthang,
			Model tongtienchitheothang)
	{
		thongtinkhachhang.addAttribute("chitietkhachhang", khachHangRepository.findByMakh(makh));
		
		Date date = new Date();
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		int thang = localDate.getMonthValue();
		
		ngaythang.addAttribute("thang", thang);
		
		sodondattrongthang.addAttribute("sodondattrongthang", khachHangRepository.DemSoHoaDonTrongThang(makh, thang));
		
		sosanphammuatrongthang.addAttribute("sosanphammuatrongthang", khachHangRepository.DemSoLuongSanPhamDaMuaTrongThang(makh, thang));
		
		soluottuongtacdanhgia.addAttribute("soluottuongtacdanhgia", khachHangRepository.DemSoBinhLuanTuongTac(makh));
		
		tongtienchiratrongthang.addAttribute("tongtienchiratrongthang", khachHangRepository.TongTienChiTrongThang(makh, thang));
		
		Map<Integer, Long> bieudo = new HashMap<Integer, Long>();
		
		for (TongChiTheoThang tongChiTheoThang : joinQueryService.tongChiTheoThangs(makh)) {
			//System.out.println("Tháng: " + tongChiTheoThang.getThang() + ",Tổng chi: " + tongChiTheoThang.getTongchi());
			bieudo.put(tongChiTheoThang.getThang(), tongChiTheoThang.getTongchi());
		}
		
		if(!bieudo.containsKey(1))
		{
			bieudo.put(1, (long) 0);
		}
		
		if(!bieudo.containsKey(2))
		{
			bieudo.put(2, (long) 0);
		}
		
		if(!bieudo.containsKey(3))
		{
			bieudo.put(3, (long) 0);
		}
		
		if(!bieudo.containsKey(4))
		{
			bieudo.put(4, (long) 0);
		}
		
		if(!bieudo.containsKey(5))
		{
			bieudo.put(5, (long) 0);
		}
		
		if(!bieudo.containsKey(6))
		{
			bieudo.put(6, (long) 0);
		}
		
		if(!bieudo.containsKey(7))
		{
			bieudo.put(7, (long) 0);
		}
		
		if(!bieudo.containsKey(8))
		{
			bieudo.put(8, (long) 0);
		}
		
		if(!bieudo.containsKey(9))
		{
			bieudo.put(9, (long) 0);
		}
		
		if(!bieudo.containsKey(10))
		{
			bieudo.put(10, (long) 0);
		}
		
		if(!bieudo.containsKey(11))
		{
			bieudo.put(11, (long) 0);
		}
		
		if(!bieudo.containsKey(12))
		{
			bieudo.put(12, (long) 0);
		}
		
		tongtienchitheothang.addAttribute("tongtienchitheothang", bieudo);
		
		return "/quantri/TrangQuanLyKhachHang";
	}
	
	@RequestMapping(value = "/trangchitiethoadon/{mahoadon}")
	public String GetTrangChiTietHoaDon(@RequestParam(required = false,defaultValue = "2020") String nam,
			@PathVariable int mahoadon,
			Model mahoadonmodel,
			Model ThongTinKhachHang,
			Model ThongTinSanPham,
			Model doanhthutheonam)
	{
		mahoadonmodel.addAttribute("mahoadon", mahoadon);
		
		ThongTinKhachHang.addAttribute("thongtinkhachhang", khachHangRepository.findByMakh(hoaDonRepository.LayMaKhachHang(mahoadon)));
		
		Map<Maytinh, Integer> thongtinsanpham = new HashMap<Maytinh, Integer>();
		
		List<Chitiethoadon> chitiethoadons = chiTietHoaDonRepository.TimTatCaSanPhamCuaHoaDon(mahoadon);
		
		for (Chitiethoadon chitiethoadon : chitiethoadons) {
			Maytinh mt = mayTinhRepository.TimKiemMayTinh(chitiethoadon.getMasanpham());
			thongtinsanpham.put(mt, chitiethoadon.getSoluongmua());
		}
		
		ThongTinSanPham.addAttribute("thongtinsanpham", thongtinsanpham);
		
		Map<Integer, Long> bieudo = new HashMap<Integer, Long>();
		
		for (TongChiTheoThang tongChiTheoThang : joinQueryService.doanhThuTheoNam(Integer.parseInt(nam))) {
			//System.out.println("Tháng: " + tongChiTheoThang.getThang() + ",Tổng chi: " + tongChiTheoThang.getTongchi());
			bieudo.put(tongChiTheoThang.getThang(), tongChiTheoThang.getTongchi());
		}
		
		if(!bieudo.containsKey(1))
		{
			bieudo.put(1, (long) 0);
		}
		
		if(!bieudo.containsKey(2))
		{
			bieudo.put(2, (long) 0);
		}
		
		if(!bieudo.containsKey(3))
		{
			bieudo.put(3, (long) 0);
		}
		
		if(!bieudo.containsKey(4))
		{
			bieudo.put(4, (long) 0);
		}
		
		if(!bieudo.containsKey(5))
		{
			bieudo.put(5, (long) 0);
		}
		
		if(!bieudo.containsKey(6))
		{
			bieudo.put(6, (long) 0);
		}
		
		if(!bieudo.containsKey(7))
		{
			bieudo.put(7, (long) 0);
		}
		
		if(!bieudo.containsKey(8))
		{
			bieudo.put(8, (long) 0);
		}
		
		if(!bieudo.containsKey(9))
		{
			bieudo.put(9, (long) 0);
		}
		
		if(!bieudo.containsKey(10))
		{
			bieudo.put(10, (long) 0);
		}
		
		if(!bieudo.containsKey(11))
		{
			bieudo.put(11, (long) 0);
		}
		
		if(!bieudo.containsKey(12))
		{
			bieudo.put(12, (long) 0);
		}
		
		doanhthutheonam.addAttribute("doanhthutheonam", bieudo);
		
		return "/quantri/TrangChiTietHoaDon";
	}
	
	@RequestMapping(value = "/chophepanbinhluan/{masanpham}/{mabinhluan}")
	public String ChoPhepAnBinhLuan(@PathVariable String masanpham,
			@PathVariable int mabinhluan)
	{
		binhLuanRepository.ChoPhepAnComment(true, mabinhluan);
		return "redirect:/trangchitietsanpham/" + masanpham;
	}
	
	@RequestMapping(value = "/trangsoanthu")
	public String GetTrangSoanThu(@RequestParam String emailkhachhang,
			@RequestParam String emailadmin,
			@RequestParam String chude,
			@RequestParam String noidung,
			Model emailkh,Model emailad,Model cd,Model nd)
	{
		emailkh.addAttribute("emailkh", emailkhachhang);
		emailad.addAttribute("emailad", emailadmin);	
		cd.addAttribute("chude", chude);
		nd.addAttribute("noidung", noidung);
		return "/quantri/TrangSoanThu";
	}
	
	@RequestMapping(value = "/guithuquaemail")
	public String GuiThuQuaEmail(@RequestParam String emailkh,
			@RequestParam String emailqtv,
			@RequestParam String matkhauemail,
			@RequestParam String chude,
			@RequestParam String noidungtraloi)
	{
		// Create a Simple MailMessage.
        SimpleMailMessage message = new SimpleMailMessage();
         
        MyConstants.FRIEND_EMAIL = emailkh;
        MyConstants.MY_EMAIL = emailqtv;
        MyConstants.MY_PASSWORD = matkhauemail;
        
        message.setTo(MyConstants.FRIEND_EMAIL);
        message.setSubject(chude);
        message.setText(noidungtraloi);
 
        // Send Message!
        this.emailSender.send(message);
 
		return "redirect:/trangquantri/";
	}
	
}
