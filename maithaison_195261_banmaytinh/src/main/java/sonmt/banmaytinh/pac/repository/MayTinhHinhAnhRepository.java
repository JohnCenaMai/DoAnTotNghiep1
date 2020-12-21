package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Maytinhhinhanh;

@Repository
public interface MayTinhHinhAnhRepository extends JpaRepository<Maytinhhinhanh, Long> {

	@Query(value = "select * from maytinhhinhanh where mamaytinh = ?1",nativeQuery = true)
	List<Maytinhhinhanh> TimKiemMayTinhHinhAnh(String mamaytinh);
	
	@Modifying
	@Transactional
	@Query(value = "insert into maytinhhinhanh values(?1,?2)",nativeQuery = true)
	void ThemMoiHinhAnh(String mamaytinh,String hinhanh);
	
}
