package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Manhinh;

@Repository
public interface ManHinhRepository extends JpaRepository<Manhinh, Long> {

	@Query(value = "select * from manhinh where mamanhinh = \r\n" + 
			"(select mamanhinh from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Manhinh TimKiemManHinh(String mamaytinh);
	
	@Query(value = "select top 1 mamanhinh from manhinh order by mamanhinh desc",nativeQuery = true)
	String LayMaManHinhCuoiCung();
	
	@Query(value = "select * from manhinh where loaicamung = ?1 and manhinhcamung = ?2 and dotuongphan = ?3 and tylemanhinh = ?4 "
			+ "and dophumau = ?5 and congnghe = ?6 and dosang = ?7 and dophangiai = ?8 and tansoquet = ?9 "
			+ "and loaimanhinh = ?10 and kichthuocmanhinh = ?11",nativeQuery = true)
	Manhinh KiemTraTonTaiManHinh(String loaicamung,String manhinhcamung,String dotuongphan,String tylemanhinh,
			String dophumau,String congnghe,String dosang,String dophangiai,byte tansoquet,String loaimanhinh,
			String kichthuocmanhinh);
	
	@Modifying
	@Transactional
	@Query(value = "insert into manhinh values(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12)",nativeQuery = true)
	void ThemMoiManHinh(String mamanhinh,String loaicamung,String manhinhcamung,String dotuongphan,String tylemanhinh,String dophumau,
			String congnghe,String dosang,String dophangiai,byte tansoquet,String loaimanhinh,String kichthuocmanhinh);
	
}
