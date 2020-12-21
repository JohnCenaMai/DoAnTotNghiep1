package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Chitiethoadon;

@Repository
public interface ChiTietHoaDonRepository extends JpaRepository<Chitiethoadon, Long> {

	@Modifying
	@Transactional
	@Query(value = "insert into chitiethoadon(mahoadon,masanpham,soluongmua) values(?1,?2,?3)",nativeQuery = true)
	void ThemChiTietHoaDon(int mahoadon, String masanpham, int soluongmua);
	
	@Query(value = "select * from chitiethoadon where mahoadon = ?1",nativeQuery = true)
	List<Chitiethoadon> TimTatCaSanPhamCuaHoaDon(int mahoadon);
	
	
	
}
