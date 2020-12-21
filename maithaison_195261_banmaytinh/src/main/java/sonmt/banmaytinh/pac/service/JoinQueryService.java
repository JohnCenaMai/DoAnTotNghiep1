package sonmt.banmaytinh.pac.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sonmt.banmaytinh.pac.model.DanhSachMayTinhTimKiem;
import sonmt.banmaytinh.pac.model.DemBinhLuanPhanHoi;
import sonmt.banmaytinh.pac.model.TongChiTheoThang;
import sonmt.banmaytinh.pac.model.join.OrderBill;
import sonmt.banmaytinh.pac.repository.JoinQuery;

@Service
public class JoinQueryService implements JoinQuery {

	@Autowired
    EntityManagerFactory emf;
	
	@Override
	public List<DanhSachMayTinhTimKiem> TimKiemMayTinh(String tensanpham) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
        //em.getTransaction().begin( );

        Query query = em.createQuery("Select"+ " mt.mamaytinh, mt.tensanpham,mt.gia," + 
        		"bxl.loaicpu,dh.hang,mh.kichthuocmanhinh," + 
        		"bn.dungluong,ra.dungluong,mt.trongluong,mt.hinhanh" + 
        		" from Maytinh mt inner join Maytinhchitiet mtct" + 
        		" on mt.mamaytinh = mtct.mamaytinh inner join Boxuly bxl" + 
        		" on mtct.macpu = bxl.macpu inner join Dohoa dh" + 
        		" on mtct.madohoa = dh.madohoa inner join Manhinh mh" + 
        		" on mtct.mamanhinh = mh.mamanhinh inner join Bonho bn" + 
        		" on mtct.mabonho = bn.mabonho inner join Ram ra" + 
        		" on mtct.maram = ra.maram where mt.tensanpham like '%" + tensanpham +"%'");
       
        @SuppressWarnings("unchecked")
        List<Object[]> list =(List<Object[]>)query.getResultList();
        //System.out.println("Student Name :");
        
        List<DanhSachMayTinhTimKiem> list2 = new ArrayList<DanhSachMayTinhTimKiem>();
        
        for (Object[] objects : list) {
        	String masanpham = (String) objects[0];
			String tensanpham1 = (String) objects[1];
			int gia = (int) objects[2];
			String loaicpu = (String) objects[3];
			String hang = (String) objects[4];
			String kichthuocmanhinh = (String)objects[5];
			String dungluongbonho = (String)objects[6];
			byte dlram = (byte) objects[7];
			String dungluongram = String.valueOf(dlram);
			float trongluong = (float)objects[8];
			String hinhanh = (String)objects[9];
			
			DanhSachMayTinhTimKiem danhSachMayTinhTimKiem = new DanhSachMayTinhTimKiem(masanpham, 
					tensanpham1, gia, loaicpu, hang, kichthuocmanhinh, dungluongbonho, dungluongram, trongluong, hinhanh);
			list2.add(danhSachMayTinhTimKiem);
		}
        em.close();
        return list2;
	}

	@Override
	public List<OrderBill> danhSachBills(int mahoadon) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		
		Query query = em.createQuery("select" + " mt.tensanpham,mt.gia,cthd.soluongmua \r\n" + 
				" from Chitiethoadon cthd inner join Maytinh mt \r\n" + 
				" on cthd.masanpham = mt.mamaytinh\r\n" + 
				" where cthd.mahoadon = " + mahoadon);
		
		@SuppressWarnings("unchecked")
		List<Object[]> list =(List<Object[]>)query.getResultList();
		List<OrderBill> orderBills = new ArrayList<OrderBill>();
		
		for (Object[] objects : list) {
			String tensanpham = (String) objects[0];
			int gia = (int) objects[1];
			int soluong = (int)objects[2];
			
			OrderBill orderBill = new OrderBill(tensanpham, gia, soluong);
			orderBills.add(orderBill);
		}
		em.close();
		return orderBills;
	}

	@Override
	public List<TongChiTheoThang> tongChiTheoThangs(int makh) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		
		Query query = em.createQuery("select month(hd.ngaydathang) as thang,sum(cthd.soluongmua*mt.gia) as tongchi\r\n" + 
				"from Chitiethoadon cthd inner join Hoadon hd\r\n" + 
				"on cthd.mahoadon = hd.mahoadon inner join Maytinh mt \r\n" + 
				"on cthd.masanpham = mt.mamaytinh where hd.makh = " + makh + "\r\n" + 
				"group by month(hd.ngaydathang)");
		
		@SuppressWarnings("unchecked")
		List<Object[]> list =(List<Object[]>)query.getResultList();
		List<TongChiTheoThang> tongChiTheoThangs = new ArrayList<TongChiTheoThang>();
		
		for (Object[] objects : list) {
			int thang = (int) objects[0];
			long tongchi = (long) objects[1];
			
			TongChiTheoThang tongChiTheoThang = new TongChiTheoThang(thang, tongchi);
			tongChiTheoThangs.add(tongChiTheoThang);
		}
		
		em.close();
		return tongChiTheoThangs;
	}

	@Override
	public List<TongChiTheoThang> doanhThuTheoNam(int nam) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		
		Query query = em.createQuery("select month(hd.ngaydathang) as thang,sum(cthd.soluongmua*mt.gia) as tongchi\r\n" + 
				"from Chitiethoadon cthd inner join Hoadon hd\r\n" + 
				"on cthd.mahoadon = hd.mahoadon inner join Maytinh mt \r\n" + 
				"on cthd.masanpham = mt.mamaytinh\r\n" + 
				"where year(hd.ngaydathang) = " + nam + "\r\n" + 
				"group by month(hd.ngaydathang)");
		
		@SuppressWarnings("unchecked")
		List<Object[]> list =(List<Object[]>)query.getResultList();
		List<TongChiTheoThang> tongChiTheoThangs = new ArrayList<TongChiTheoThang>();
		
		for (Object[] objects : list) {
			int thang = (int) objects[0];
			long tongchi = (long) objects[1];
			
			TongChiTheoThang tongChiTheoThang = new TongChiTheoThang(thang, tongchi);
			tongChiTheoThangs.add(tongChiTheoThang);
		}
		
		em.close();
		return tongChiTheoThangs;
	}

	@Override
	public List<DemBinhLuanPhanHoi> binhLuanPhanHoi() {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		
		Query query = em.createQuery("select bl.masanpham,count(distinct bl.mabinhluan),count(ph.maphanhoi) \r\n" + 
				"from Binhluan bl full join Phanhoi ph\r\n" + 
				"on bl.mabinhluan = ph.mabinhluan\r\n" + 
				"group by bl.masanpham");
		
		@SuppressWarnings("unchecked")
		List<Object[]> list =(List<Object[]>)query.getResultList();
		List<DemBinhLuanPhanHoi> demBinhLuanPhanHois = new ArrayList<DemBinhLuanPhanHoi>();
		
		for (Object[] objects : list) {
			String masanpham = (String) objects[0];
			long sobinhluan = (long) objects[1];
			long sophanhoi = (long) objects[2];
			
			DemBinhLuanPhanHoi demBinhLuanPhanHoi = new DemBinhLuanPhanHoi(masanpham, sobinhluan, sophanhoi);
			demBinhLuanPhanHois.add(demBinhLuanPhanHoi);
		}
		
		em.close();
		return demBinhLuanPhanHois;
	}

	@Override
	public List<DanhSachMayTinhTimKiem> getTatCaMayTinh() {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
        //em.getTransaction().begin( );

        Query query = em.createQuery("Select"+ " mt.mamaytinh,mt.tensanpham,mt.gia," + 
        		"bxl.congnghecpu,dh.cardonboard,mh.kichthuocmanhinh," + 
        		"bn.dungluong,ra.dungluong,mt.trongluong,mt.hinhanh" + 
        		" from Maytinh mt inner join Maytinhchitiet mtct" + 
        		" on mt.mamaytinh = mtct.mamaytinh inner join Boxuly bxl" + 
        		" on mtct.macpu = bxl.macpu inner join Dohoa dh" + 
        		" on mtct.madohoa = dh.madohoa inner join Manhinh mh" + 
        		" on mtct.mamanhinh = mh.mamanhinh inner join Bonho bn" + 
        		" on mtct.mabonho = bn.mabonho inner join Ram ra" + 
        		" on mtct.maram = ra.maram");
       
        @SuppressWarnings("unchecked")
        List<Object[]> list =(List<Object[]>)query.getResultList();
        //System.out.println("Student Name :");
        
        List<DanhSachMayTinhTimKiem> list2 = new ArrayList<DanhSachMayTinhTimKiem>();
        
        for (Object[] objects : list) {
        	String masanpham = (String) objects[0];
			String tensanpham1 = (String) objects[1];
			int gia = (int) objects[2];
			String congnghecpu = (String) objects[3];
			String cardonboard = (String) objects[4];
			String kichthuocmanhinh = (String)objects[5];
			String dungluongbonho = (String)objects[6];
			byte dlram = (byte) objects[7];
			String dungluongram = String.valueOf(dlram);
			float trongluong = (float)objects[8];
			String hinhanh = (String)objects[9];
			
			DanhSachMayTinhTimKiem danhSachMayTinhTimKiem = new DanhSachMayTinhTimKiem(masanpham, 
					tensanpham1, gia, congnghecpu, cardonboard, kichthuocmanhinh, dungluongbonho, dungluongram, trongluong, hinhanh);
			list2.add(danhSachMayTinhTimKiem);
		}
        //System.out.println("kich thuoc: " + list2.size());
        em.close();
        return list2;
	}
	
}
