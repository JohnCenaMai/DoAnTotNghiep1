package sonmt.banmaytinh.pac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Maytinh;

@Repository
public interface MayTinhRepository extends JpaRepository<Maytinh, Long> {

	@Query(value = "select * from maytinh where mamaytinh = ?1",nativeQuery = true)
	Maytinh TimKiemMayTinh(String mamaytinh);

	@Query(value = "select * from maytinh where tensanpham like %?1%",nativeQuery = true)
	List<Maytinh> TimKiemMayTinhTheoTen(String tensanpham);
	
	@Modifying
	@Transactional
	@Query(value = "update maytinh\r\n" + 
			"set soluong=soluong-?2\r\n" + 
			"where mamaytinh=?1",nativeQuery = true)
	void CapNhatSoLuong(String masanpham,int soluongmua);
	
	//phan quan tri vien
	@Query(value = "select * from maytinh",nativeQuery = true)
	List<Maytinh> LayDanhSachMayTinh();
	//Page<Maytinh> LayDanhSachMayTinh(Pageable pageable);
	
	@Query(value = "select top 1 mamaytinh from maytinh order by mamaytinh desc",nativeQuery = true)
	String LayMaMayTinhCuoiCung();
	
	@Modifying
	@Transactional
	@Query(value = "insert into maytinh values(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12)",nativeQuery = true)
	void ThemMoiMayTinh(String mamaytinh,String tensanpham,String xuatxu,
			byte thoigianbaohanh,float chieurong,float chieucao,float chieusau,
			String namramat,float trongluong,int soluong,int gia,String hinhanh);
	
}





