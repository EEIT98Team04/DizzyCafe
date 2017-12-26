package wayne.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import net.sf.json.JSONArray;
import wayne.model.dao.BackstageMerchandiseDAO;

@Service
@Transactional
public class MerchandiseBackstageService {

	@Autowired
	BackstageMerchandiseDAO backstagemerchandiseDAO;
	
	public JSONArray showMerchandiseInBackstage() {
		List<MerchandiseBean> result = null;
		result = backstagemerchandiseDAO.selectAll();
		String temp = new Gson().toJson(result);
		JSONArray json = JSONArray.fromObject(temp);
		System.out.println("json:"+json);
		return json;
	}
	
	public MerchandiseBean updateMerchandiseInBackstageById(int merchandiseId) {
		MerchandiseBean result = null;
		result = backstagemerchandiseDAO.selectById(merchandiseId);
		
		return result;
		
	}
	public boolean  updateMerchandiseInBackstage(MerchandiseBean bean) {
		if(bean!=null) {
			backstagemerchandiseDAO.update(bean);
			return true;
		}else {
			return false;
		}
	}
}
