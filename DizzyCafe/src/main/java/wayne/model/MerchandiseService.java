package wayne.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;
import wayne.model.dao.MerchandiseDAOHibernate;


@Service
@Transactional
public class MerchandiseService {
	
	private int rows_perPage = 6;
	
	@Autowired
	MerchandiseDAOHibernate merchandiseDao;
	
	// merchandise.controller
	public JSONArray showMerchandiseInPage(){
		return merchandiseDao.selectPageNow();
	}
	
	public JSONArray ShowMerchandiseByPage(int page,int rows_perPage, JSONArray merchandises) {
		JSONArray result = new JSONArray();
		/* logic: rows_perPage = 4
		 * 1 : 1-4
		 * 2 : 5-8
		 */
		for (int i = rows_perPage * (page - 1); i < rows_perPage * page && i < merchandises.size(); i++) { 
			result.add(merchandises.get(i));
		}
		return result;
	}
	
	public int countTotalPages(int rows_perPage, JSONArray merchandises) {
		int result = 0;
		if (merchandises.size() % rows_perPage == 0) {
			result = merchandises.size() / rows_perPage;
		} else if(merchandises.size() % rows_perPage > 0)
		{
			result  = merchandises.size() / rows_perPage + 1;
		}
		return result;
	}
	
	// merchandisetag.controller
	public JSONArray showMerchandiseInPageTag(String tag){
		return merchandiseDao.selectPageNowTag(tag);
	}
//	// merchandise.controller
//	public int countTotalPages() {
//		return merchandiseDao.countTotalPage(this.getRows_perPage());
//	}
//	// merchandisetag.controller
//	public int countTotalPagesTag(String tag) {
//		return merchandiseDao.countTotalPageTag(this.getRows_perPage(), tag);
//	}
	
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
	