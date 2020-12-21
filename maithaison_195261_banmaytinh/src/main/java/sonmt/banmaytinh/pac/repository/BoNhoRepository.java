package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Bonho;

@Repository
public interface BoNhoRepository extends JpaRepository<Bonho, Long> {

	@Query(value = "select * from bonho where mabonho = \r\n" + 
			"(select mabonho from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Bonho TimKiemBoNho(String mamaytinh);	
	
	@Query(value = "select top 1 mabonho from bonho order by mabonho desc",nativeQuery = true)
	String LayMaBoNhoCuoiCung();

	@Query(value = "select * from bonho where kieu = ?1 and dungluong = ?2 and tocdodocghi = ?3 and sokhecam = ?4",nativeQuery = true)
	Bonho KiemTraTonTaiBoNho(String kieu,String dungluong,String tocdodocghi,String sokhecam);
	
	@Modifying
	@Transactional
	@Query(value = "insert into bonho(mabonho,kieu,dungluong,tocdodocghi,sokhecam) values(?1,?2,?3,?4,?5)",nativeQuery = true)
	void ThemMoiBoNho(String mabonho,String kieu,String dungluong,String tocdodocghi,String sokhecam);
	
}
