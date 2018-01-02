package minghui.model;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import minghui.model.dao.AdplayDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class AdplayService {
	@Autowired
	private AdplayDAO adplayDAO;

	@Transactional(readOnly=true)
	public JSONArray select() {
		List<Object[]> list = adplayDAO.select();
		JSONArray jsonArr = new JSONArray();
		for(Object[] temp : list) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("id", temp[0]);
			jsonObj.put("activityName", temp[1]);
			jsonObj.put("activityPicture", temp[2]);
			jsonArr.add(jsonObj);
		}
		return jsonArr;
	}
	
	@Transactional
	public void delete() {
		adplayDAO.delete_all();
	}
	
	@Transactional
	public void insert(Collection<String> values) {
		System.out.println("entry adplayService insert method");
		for(String value : values) {
			System.out.println("entry adplayService insert method for loop");
			AdplayBean bean = new AdplayBean();
			bean.setId(Integer.valueOf(value));
			adplayDAO.insert(bean);
		}
	}
}
