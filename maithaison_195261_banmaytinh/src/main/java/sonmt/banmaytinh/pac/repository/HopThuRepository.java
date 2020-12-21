package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Hopthu;

@Repository
public interface HopThuRepository extends JpaRepository<Hopthu, Long> {

	@Modifying
	@Transactional
	@Query(value = "insert into hopthu(email,chude,noidunggui,ngaygui,trangthai) values(?1,?2,?3,?4,?5)",nativeQuery = true)
	void GuiHopThu(String email,String chude,String noidunggui, String ngaygui,boolean trangthai);
	
	@Query(value = "select * from hopthu",nativeQuery = true)
	List<Hopthu> DanhSachTatCaHopThu();
	
}
