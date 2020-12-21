package sonmt.banmaytinh.pac.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import sonmt.banmaytinh.pac.model.Binhluan;

@Repository
public interface BinhLuanRepository extends JpaRepository<Binhluan, Integer> {

	@Modifying
	@Transactional
	@Query(value = "insert into binhluan(makhachhang,masanpham,ngaybinhluan,noidung,chophepan) values(?1,?2,?3,?4,?5)",nativeQuery = true)
	void ThemBinhLuan(int makhachhang,String masanpham,String ngaybinhluan,String noidung,boolean chophepan);
	
	@Query(value = "select * from binhluan where masanpham = ?1",nativeQuery = true)
	List<Binhluan> TimTatCaBinhLuan(String masanpham);
	
	@Modifying
	@Transactional
	@Query(value = "update binhluan set chophepan = ?1 where mabinhluan = ?2",nativeQuery = true)
	void ChoPhepAnComment(boolean chophepan,int mabinhluan);
	
}
