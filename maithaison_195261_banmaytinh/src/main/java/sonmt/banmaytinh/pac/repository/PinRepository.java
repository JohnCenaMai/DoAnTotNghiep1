package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Repository;

import sonmt.banmaytinh.pac.model.Pin;

@Repository
public interface PinRepository extends JpaRepository<Pin, Long> {

	@Query(value = "select * from pin where mapin = \r\n" + 
			"(select mapin from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Pin TimKiemPin(String mamaytinh);	
	
	@Query(value = "select * from pin where loaipin = ?1 and cell = ?2 and thaoroi = ?3 and powersupply = ?4",nativeQuery = true)
	Pin KiemTraTonTaiPin(String loaipin,String cell,boolean thaoroi,String powersupply);
	
	@Modifying
	@Transactional
	@Query(value = "insert into pin(mapin,loaipin,cell,thaoroi,powersupply) "
			+ "values(?1,?2,?3,?4,?5)",nativeQuery = true)
	void ThemMoiPin(String mapin,String loaipin,String cell,boolean thaoroi,String powersupply);
	
}
