package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Phanhoi;

@Repository
public interface PhanHoiRepository extends JpaRepository<Phanhoi, Integer> {

	@Modifying
	@Transactional
	@Query(value = "insert into phanhoi(mabinhluan,makhachhang,ngayphanhoi,noidung) values(?1,?2,?3,?4)",nativeQuery = true)
	void ThemPhanHoi(int mabinhluan,int makhachhang,String ngayphanhoi,String noidung);
	
	@Query(value = "select * from phanhoi where mabinhluan = ?1",nativeQuery = true)
	List<Phanhoi> PhanHoiTheoMaBinhLuan(int mabinhluan);
	
}
