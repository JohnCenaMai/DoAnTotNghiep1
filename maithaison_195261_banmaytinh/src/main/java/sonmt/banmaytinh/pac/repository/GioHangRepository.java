package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Giohang;

@Repository
public interface GioHangRepository extends JpaRepository<Giohang, Long> {

	@Modifying
	@Transactional
	@Query(value = "insert into giohang(masanpham,tensanpham,makh,gia,soluong) values(?1,?2,?3,?4,?5)",nativeQuery = true)
	void ThemVaoGioHang1(String masanpham,String tensanpham,int makh,int gia,int soluong);
	
	@Query(value = "select * from giohang where masanpham = ?1 and makh = ?2",nativeQuery = true)
	Giohang TimKiemTrongGioHang1(String masanpham,int makh);
	
	@Modifying
	@Transactional
	@Query(value = "update giohang set soluong = ?3 where masanpham = ?1 and makh = ?2",nativeQuery = true)
	void CapNhatSoLuong1(String masanpham,int makh,int soluong);
	
	@Modifying
	@Transactional
	@Query(value = "delete from giohang where makh = ?1 and masanpham = ?2",nativeQuery = true)
	void XoaKhoiGioHang(int makh, String masanpham);
	
	@Modifying
	@Transactional
	@Query(value = "delete from giohang where makh = ?1",nativeQuery = true)
	void XoaToanBoKhoiGioHang(int makh);
	
	@Query(value = "select * from giohang where makh = ?1",nativeQuery = true)
	List<Giohang> TimToanBoSanPham(int makh);
	
}
