package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Chatlieu;

@Repository
public interface ChatLieuRepository extends JpaRepository<Chatlieu, Long> {

	@Query(value = "select top 1 machatlieu from chatlieu order by machatlieu desc",nativeQuery = true)
	String LayMaChatLieuCuoiCung();

	@Query(value = "select * from chatlieu where chatlieumatbenngoaicung = ?1 and chatlieukhungmanhinh = ?2 "
			+ "and chatlieumatbanphim = ?3 and chatlieumatlung = ?4",nativeQuery = true)
	Chatlieu kiemTraTonTaiChatLieu(String chatlieumatbenngoaicung,String chatlieukhungmanhinh,String chatlieumatbanphim,String chatlieumatlung);
	
	@Modifying
	@Transactional
	@Query(value = "insert into chatlieu(machatlieu,chatlieumatbenngoaicung,chatlieukhungmanhinh,chatlieumatbanphim,chatlieumatlung) "
			+ "values(?1,?2,?3,?4,?5)",nativeQuery = true)
	void ThemMoiChatLieu(String machatlieu,String chatlieumatbenngoaicung,String chatlieukhungmanhinh,String chatlieumatbanphim,String chatlieumatlung);
	
}
