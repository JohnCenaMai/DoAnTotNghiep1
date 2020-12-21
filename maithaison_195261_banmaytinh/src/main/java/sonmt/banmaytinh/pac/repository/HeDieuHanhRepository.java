package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Hedieuhanh;

@Repository
public interface HeDieuHanhRepository extends JpaRepository<Hedieuhanh, Long> {

	@Query(value = "select * from hedieuhanh where phienbanhedieuhanh = \r\n" + 
			"(select phienbanhedieuhanh from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Hedieuhanh TimKiemHeDieuHanh(String mamaytinh);

	@Query(value = "select * from hedieuhanh where phienbanhedieuhanh = ?1 and ten = ?2 and kieu = ?3",nativeQuery = true)
	Hedieuhanh KiemTraTonTaiHeDieuHanh(String phienbanhedieuhanh,String ten,String kieu);
	
	@Modifying
	@Transactional
	@Query(value = "insert into hedieuhanh(phienbanhedieuhanh,ten,kieu) values(?1,?2,?3)",nativeQuery = true)
	void ThemMoiHeDieuHanh(String phienbanhedieuhanh,String ten,String kieu);
	
}
