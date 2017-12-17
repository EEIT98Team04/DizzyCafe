package hongwen.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

@Service
@Transactional
public class ReplyService {
	
	@Autowired
	private DocumentDAO documentDAO;

	public JSONArray selectToJSON(int documentId) {
		List<DocumentBean> select = documentDAO.select(documentId);
		String temp = new Gson().toJson(select);				//轉JSON檔案
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}
}
