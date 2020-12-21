package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Boxuly;

@Repository
public interface BoXuLyRepository extends JpaRepository<Boxuly, Long> {

	@Query(value = "select * from boxuly where macpu = \r\n" + 
			"(select macpu from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Boxuly TimKiemBoXuLy(String mamaytinh);
	
	@Query(value = "select top 1 macpu from boxuly order by macpu desc",nativeQuery = true)
	String LayMaBoXuLyCuoiCung();

	@Query(value = "select * from boxuly where congnghecpu = ?1 and loaicpu = ?2 and hangcpu = ?3 and tocdo = ?4 "
			+ "and tocdotoida = ?5 and bonhodem = ?6 and tocdobus = ?7 and soluong = ?8 and soloi = ?9",nativeQuery = true)
	Boxuly KiemTraTonTaiBoXuLy(String congnghecpu,String loaicpu,String hangcpu,
			float tocdo,float tocdotoida,int bonhodem,float tocdobus,int soluong,int soloi);
	
	@Modifying
	@Transactional
	@Query(value = "insert into boxuly values(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10)",nativeQuery = true)
	void ThemMoiBoXuLy(String macpu,String congnghecpu,String loaicpu,String hangcpu,
			float tocdo,float tocdotoida,int bonhodem,float tocdobus,int soluong,int soloi);
	
}
