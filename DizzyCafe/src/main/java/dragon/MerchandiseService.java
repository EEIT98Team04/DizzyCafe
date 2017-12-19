package dragon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class MerchandiseService {
	
	@Autowired
	MerchandiseDAO merchandiseDao;
	
	public MerchandiseBean select(int merchandiseId) {
		return merchandiseDao.select(merchandiseId);
	}
	public List<MerchandiseBean> select(){
		
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
	