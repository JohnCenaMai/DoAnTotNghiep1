package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Khachhang;

@Repository
public interface KhachHangRepository extends JpaRepository<Khachhang, Long> {
	
	// lay email
	@Query(value = "select * from khachhang where email = ?1",nativeQuery = true)
	Khachhang findByUsername(String username);

	@Query(value = "select * from khachhang where makh = ?1",nativeQuery = true)
	Khachhang findByMakh(int makh);
	
	@Query(value = "select makh from khachhang where email = ?1",nativeQuery = true)
	int LayMaKhachHang(String email);
	
	@Modifying
	@Transactional
	@Query(value = "insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh) values(?1,?2,?3,?4,?5,?6)",nativeQuery = true)
	void ThemKhachHang(String email,String tenkhachhang,String matkhau,String diachi,String sodienthoai,String ngaysinh);

	@Modifying
	@Transactional
	@Query(value = "update khachhang set diachi = ?2 where makh = ?1",nativeQuery = true)
	void ThayDoiDiaChi(int makh,String diachi);
	
	@Modifying
	@Transactional
	@Query(value = "update khachhang set sodienthoai = ?2 where makh = ?1",nativeQuery = true)
	void ThayDoiSoDienThoai(int makh,String sodienthoai);
	
	@Modifying
	@Transactional
	@Query(value = "update khachhang set matkhau = ?2 where makh = ?1",nativeQuery = true)
	void ThayDoiMatKhau(int makh,String matkhau);
	
	@Modifying
	@Transactional
	@Query(value = "update khachhang set isenabled = ?2 where makh = ?1",nativeQuery = true)
	void VoHieuHoa(int makh, boolean isEnabled);

	//lay danh sach khach hang admin
	@Query(value = "select * from khachhang where makh in (select makh from khachhang_vaitro where id_vaitro = 1)",nativeQuery = true)
	List<Khachhang> LayDanhSachKhachHang();
	
	//lay so don hang dat mua trong thang
	@Query(value = "select count(mahoadon) from hoadon where makh = ?1 and MONTH(ngaydathang) = ?2",nativeQuery = true)
	int DemSoHoaDonTrongThang(int makh,int thang);
	
	//so luong san pham da mua trong than
	@Query(value = "select sum(chitiethoadon.soluongmua) from chitiethoadon inner join hoadon\r\n" + 
			"on chitiethoadon.mahoadon = hoadon.mahoadon\r\n" + 
			"where hoadon.makh = ?1 and MONTH(hoadon.ngaydathang) = ?2",nativeQuery = true)
	int DemSoLuongSanPhamDaMuaTrongThang(int makh,int thang);
	
	//dem so binh luan tuong tac
	@Query(value = "select count(mabinhluan) from binhluan where makhachhang = ?1",nativeQuery = true)
	int DemSoBinhLuanTuongTac(int makh);
	
	//tong tien chi ra trong thang
	@Query(value = "select sum(chitiethoadon.soluongmua*maytinh.gia) from chitiethoadon inner join maytinh\r\n" + 
			"on chitiethoadon.masanpham = maytinh.mamaytinh inner join hoadon \r\n" + 
			"on chitiethoadon.mahoadon = hoadon.mahoadon\r\n" + 
			"where hoadon.makh = ?1 and month(hoadon.ngaydathang) = ?2",nativeQuery = true)
	int TongTienChiTrongThang(int makh,int thang);
	
}
