package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Dohoa;

@Repository
public interface DoHoaRepository extends JpaRepository<Dohoa, Long> {

	@Query(value = "select * from dohoa where madohoa = \r\n" + 
			"(select madohoa from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Dohoa TimKiemDoHoa(String mamaytinh);

	@Query(value = "select top 1 madohoa from dohoa order by madohoa desc",nativeQuery = true)
	String LayMaDoHoaCuoiCung();
	
	@Query(value = "select * from dohoa where hang = ?1 and xungnhip = ?2 and xungnhiptoida = ?3 "
			+ "and model = ?4 and cardonboard = ?5",nativeQuery = true)
	Dohoa KiemTraTonTaiDoHoa(String hang,float xungnhip,float xungnhiptoida,String model,String cardonboard);

	@Modifying
	@Transactional
	@Query(value = "insert into dohoa values(?1,?2,?3,?4,?5,?6)",nativeQuery = true)
	void ThemMoiDoHoa(String madohoa,String hang,float xungnhip,float xungnhiptoida,String model,String cardonboard);
	
}
