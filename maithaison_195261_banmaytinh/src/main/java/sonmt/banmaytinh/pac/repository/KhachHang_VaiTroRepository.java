package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Khachhang_vaitro;

@Repository
public interface KhachHang_VaiTroRepository extends JpaRepository<Khachhang_vaitro, Long> {

	@Modifying
	@Transactional
	@Query(value = "insert into khachhang_vaitro(makh,id_vaitro) values(?1,?2)",nativeQuery = true)
	void ThemThongTinKH_VT(int makh,int id_vaitro);
	
	@Query(value = "select khachhang_vaitro.id_vaitro from khachhang inner join khachhang_vaitro on khachhang.makh = khachhang_vaitro.makh\r\n" + 
			"where khachhang.makh = ?1",nativeQuery = true)
	int LayQuyen(int makh);
	
}
