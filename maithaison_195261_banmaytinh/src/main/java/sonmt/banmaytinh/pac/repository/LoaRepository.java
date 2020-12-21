package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Loa;

@Repository
public interface LoaRepository extends JpaRepository<Loa, Long> {

	@Query(value = "select * from loa where maloa = \r\n" + 
			"(select maloa from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Loa TimKiemLoa(String mamaytinh);	

	@Query(value = "select top 1 maloa from loa order by maloa desc",nativeQuery = true)
	String LayMaLoaCuoiCung();
	
	@Query(value = "select * from loa where soloa = ?1 and congngheamthanh = ?2",nativeQuery = true)
	Loa KiemTraTonTaiLoa(byte soloa,String congngheamthanh);
	
	@Modifying
	@Transactional
	@Query(value = "insert into loa(maloa,soloa,congngheamthanh) values(?1,?2,?3)",nativeQuery = true)
	void ThemMoiLoa(String maloa,byte soloa,String congngheamthanh);
	
}
