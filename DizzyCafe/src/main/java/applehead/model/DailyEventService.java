package applehead.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional
public class DailyEventService {
	@Autowired
	DailyEventDAO dailyEventDAO;

	public JSONArray selectJSON() {
		JSONArray ja = new JSONArray();
		List<Object[]> temp = dailyEventDAO.selectJoinMerchandise();
		for (Object[] data : temp) {
			JSONObject json = new JSONObject();
			json.put("probability", data[0]);
			json.put("discount", data[1]);
			json.put("merchandiseName", data[2]);
			json.put("merchandisePicture", data[3]);
			json.put("merchandiseId", data[4]);
			ja.add(json);
		}
		return ja;
	}
}
