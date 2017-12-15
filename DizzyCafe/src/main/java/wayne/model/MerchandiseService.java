package wayne.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tingwei.model.CourseBean;
import wayne.model.dao.MerchandiseDAOHibernate;


@Service
@Transactional
public class MerchandiseService {
	
	private int rows_perPage = 6;
	
	@Autowired
	MerchandiseDAOHibernate merchandiseDao;

	public List<MerchandiseBean> showMerchandiseInPage(int nowPage){
		return merchandiseDao.selectPageNow(nowPage,rows_perPage);
	}
	
	public int countTotalPages() {
		return merchandiseDao.countTotalPage(this.getRows_perPage());
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
	
	public List<MerchandiseBean> select(String merchandiseTag){
			
			return merchandiseDao.select();
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
	