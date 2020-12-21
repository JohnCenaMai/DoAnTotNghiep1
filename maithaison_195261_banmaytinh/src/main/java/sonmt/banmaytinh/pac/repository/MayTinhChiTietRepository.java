package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Maytinhchitiet;

@Repository
public interface MayTinhChiTietRepository extends JpaRepository<Maytinhchitiet, Long> {

	@Modifying
	@Transactional
	@Query(value = "insert into maytinhchitiet values(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11)",nativeQuery = true)
	void ThemMoiMayTinhChiTiet(String mamaytinh,String macpu,String maram,String madohoa,String mamanhinh,
			String maloa,String mapin,String phienbanhedieuhanh,String machatlieu,String mabanphim,String mabonho);
	
}
