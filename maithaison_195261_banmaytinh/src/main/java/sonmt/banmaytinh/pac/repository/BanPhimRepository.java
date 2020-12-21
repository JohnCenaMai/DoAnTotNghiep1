package sonmt.banmaytinh.pac.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sonmt.banmaytinh.pac.model.Banphim;

@Repository
public interface BanPhimRepository extends JpaRepository<Banphim, Long> {

	@Query(value = "select * from banphim where mabanphim = \r\n" + 
			"(select mabanphim from maytinhchitiet where maytinhchitiet.mamaytinh = ?1)",nativeQuery = true)
	Banphim TimKiemBanPhim(String mamaytinh);
	
	@Query(value = "select top 1 mabanphim from banphim order by mabanphim desc",nativeQuery = true)
	String LayMaBanPhimCuoiCung();

	@Query(value = "select * from banphim where banphimso = ?1 and loaidenbanphim = ?2 and maudenled = ?3 and congnghedenbanphim = ?4 and touchpad = ?5",nativeQuery = true)
	Banphim KiemTraTonTaiBanPhim(String banphimso,String loaidenbanphim,String maudenled,String congnghedenbanphim,String touchpad);
	
	@Modifying
	@Transactional
	@Query(value = "insert into banphim(mabanphim,banphimso,loaidenbanphim,maudenled,congnghedenbanphim,touchpad) values(?1,?2,?3,?4,?5,?6)",nativeQuery = true)
	void ThemMoiBanPhim(String mabanphim,String banphimso,String loaidenbanphim,String maudenled,String congnghedenbanphim,String touchpad);
	
}
