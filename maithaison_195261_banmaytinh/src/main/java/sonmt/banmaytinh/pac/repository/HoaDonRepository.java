package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Hoadon;

@Repository
public interface HoaDonRepository extends JpaRepository<Hoadon, Long> {

	@Modifying
	@Transactional
	@Query(value = "insert into hoadon(makh,ngaydathang,trangthai,hinhthucthanhtoan) values(?1,?2,?3,?4)",nativeQuery = true)
	void ThemHoaDon(int makh,String ngaydathang,boolean trangthai, int hinhthucthanhtoan);
	
	@Query(value = "select top 1 * from hoadon where makh = ?1 order by ngaydathang desc",nativeQuery = true)
	Hoadon TimHoaDonVuaMoiThem(int makh);
	
	@Query(value = "select * from hoadon where makh = ?1",nativeQuery = true)
	List<Hoadon> TimTatCaHoaDonCua(int makh);
	
	@Query(value = "select * from hoadon where mahoadon = ?1",nativeQuery = true)
	Hoadon TimHoaDonTheoMa(int mahoadon);
	
	@Query(value = "select * from hoadon where year(ngaydathang) = ?1",nativeQuery = true)
	List<Hoadon> TimTatCaHoaDonTrongNam(int nam);

	@Query(value = "select makh from hoadon where mahoadon = ?1",nativeQuery = true)
	int LayMaKhachHang(int mahoadon);
	
}
