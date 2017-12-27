package wayne.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wayne.model.dao.MerchandiseDAOHibernate;


@Service
@Transactional
public class MerchandiseService {
	
	private int rows_perPage = 6;
	
	@Autowired
	MerchandiseDAOHibernate merchandiseDao;
	
	// merchandise.controller
	public List<MerchandiseBean> showMerchandiseInPage(int nowPage){
		return merchandiseDao.selectPageNow(nowPage,rows_perPage);
	}
	
	// merchandisetag.controller
	public List<MerchandiseBean> showMerchandiseInPageTag(int nowPage, String tag){
		return merchandiseDao.selectPageNowTag(nowPage, rows_perPage, tag);
	}
	// merchandise.controller
	public int countTotalPages() {
		return merchandiseDao.countTotalPage(this.getRows_perPage());
	}
	// merchandisetag.controller
	public int countTotalPagesTag(String tag) {
		return merchandiseDao.countTotalPageTag(this.getRows_perPage(), tag);
	}
	
	public int getRows_perPage() {
		return rows_perPage;
	}

	public void setRows_perPage(int rows_perPage) {
		this.rows_perPage = rows_perPage;
	}
	
	
	public List<MerchandiseBean> select(){
		
			return merchandiseDao.select();
	}
	
	public MerchandiseBean select(int merchandiseId) {
		return merchandiseDao.selectById(merchandiseId);
	}
	
	public List<MerchandiseBean> select(String merchandiseTag){
			
			return merchandiseDao.select(merchandiseTag);
	}
	
	public MerchandiseBean insert(MerchandiseBean bean) {
		MerchandiseBean result = null;
		if(bean!=null) {
			result = merchandiseDao.insert(bean);
		}
		return result;
	}
	
	public MerchandiseBean update(MerchandiseBean bean) {
		MerchandiseBean result = null;
		if(bean!=null) {
			result = merchandiseDao.update(bean.getMerchandiseName(), 
					bean.getMerchandiseContent(), bean.getMerchandisePicture(), 
					bean.getMerchandiseTag(), bean.getMerchandisePrice(), 
					bean.getMerchandiseQuantity(), bean.getMerchandiseStatus(), 
					bean.getMerchandiseId());
		}
		return result;
	}
	
	public boolean delete(MerchandiseBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = merchandiseDao.delete(bean.getMerchandiseId());
		}
		return result;
	}
	
}
	