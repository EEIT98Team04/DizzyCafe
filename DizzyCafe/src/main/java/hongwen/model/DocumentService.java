package hongwen.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

@Service
@Transactional
public class DocumentService {

	@Autowired
	private DocumentDAO documentDAO;
	@Autowired
	BoardDAO boardDAO;

	// 修改文章
	public JSONArray modify(int id) {
		DocumentBean select = documentDAO.get(id);
		String temp = new Gson().toJson(select); // 轉JSON檔案
		temp = "[" + temp + "]";
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}

	// boardid
	public JSONArray selectToJSON(int id) {
		// 更新人氣
		boardDAO.popularity(id);
		// 讀取文章
		List<DocumentBean> select = documentDAO.select(id);
		String temp = new Gson().toJson(select); // 轉JSON檔案
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}

	public JSONArray selectToJSON(String membername) {
		List<DocumentBean> select = documentDAO.select(membername);
		String temp = new Gson().toJson(select); // 轉JSON檔案
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}

	public JSONArray insert(DocumentBean bean) {
		String temp = null; // 轉JSON檔案
		JSONArray json = null;
		boolean dao = false;
		if (bean != null) {
			dao = documentDAO.insert(bean);
			if (dao == true) {
				temp = "[{\"status\":\"success\"}]";
				json = JSONArray.fromObject(temp);
			}
		}
		return json;
	}

	public JSONArray update(DocumentBean bean) {
		String temp = null; // 轉JSON檔案
		JSONArray json = null;
		boolean dao = false;
		if (bean != null) {
			dao = documentDAO.update(bean);
			if (dao == true) {
				temp = "[{\"status\":\"success\"}]";
				json = JSONArray.fromObject(temp);
			}
		}
		return json;
	}

	// 刪除文章(更改文章狀態)
	public JSONArray delete(int id) {
		String temp = null;
		DocumentBean select = documentDAO.get(id);
		select.setDstatus(false);
		documentDAO.update(select);
		temp = "[{\"status\":\"success\"}]";
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}
}
