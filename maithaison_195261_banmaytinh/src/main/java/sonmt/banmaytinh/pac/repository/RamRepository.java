package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Ram;

@Repository
public interface RamRepository extends JpaRepository<Ram, Long> {

	@Query(value = "select * from ram where maram = \r\n" + 
			"(select maram from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Ram TimKiemRam(String mamaytinh);
	
	@Query(value = "select top 1 maram from ram order by maram desc",nativeQuery = true)
	String LayMaRamCuoiCung();
	
	@Query(value = "select * from ram where dungluong = ?1 and loairam = ?2 and tocdoram = ?3 and sokhecamroi = ?4 "
			+ "and sokheramconlai = ?5 and soramonboard = ?6 and soramtoida = ?7",nativeQuery = true)
	Ram KiemTraTonTaiRam(byte dungluong,String loairam,float tocdoram,byte sokhecamroi,byte sokheramconlai,byte soramonboard,byte soramtoida);
	
	@Modifying
	@Transactional
	@Query(value = "insert into ram values(?1,?2,?3,?4,?5,?6,?7,?8)",nativeQuery = true)
	void ThemMoiRam(String maram,byte dungluong,String loairam,float tocdoram,byte sokhecamroi,byte sokhecamconlai,byte soramonboard,byte soramtoida);
	
}
