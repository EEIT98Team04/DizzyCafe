package minghui.model;

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
			jsonObj.put("name", temp[2]);
			jsonObj.put("activityPicture", temp[3]);
			jsonArr.add(jsonObj);
		}
		return jsonArr;
	}
}
