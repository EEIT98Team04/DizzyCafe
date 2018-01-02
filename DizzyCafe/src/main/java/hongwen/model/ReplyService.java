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
	private ReplyDAO replyDAO;

	@Autowired
	private DocumentDAO documentDAO;

	public JSONArray selectToJSON(int documentId) {
		// 更新人氣
		documentDAO.popularity(documentId);
		// 讀取回覆
		List<ReplyBean> select = replyDAO.select(documentId);
		DocumentBean d = documentDAO.get(documentId);
		ReplyBean r = new ReplyBean(0, d.getMembername(), d.getMemberId(), d.getDocumentId(), d.getContent(),
				d.getTimes());
		select.add(0, r);
		String temp = new Gson().toJson(select); // 轉JSON檔案
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}

	public JSONArray selectToJSON(String membername) {
		List<ReplyBean> select = replyDAO.select(membername);
		String temp = new Gson().toJson(select); // 轉JSON檔案
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}

	public JSONArray insert(ReplyBean bean) {
		String temp = null; // 轉JSON檔案
		JSONArray json = null;
		boolean dao = false;
		if (bean != null) {
			dao = replyDAO.insert(bean);
			if (dao == true) {
				temp = "[{\"status\":\"success\"}]";
				json = JSONArray.fromObject(temp);
			}
		}
		return json;
	}

	// 修改回文
	public JSONArray modify(int id) {
		ReplyBean select = replyDAO.get(id);
		String temp = new Gson().toJson(select); // 轉JSON檔案
		temp = "[" + temp + "]";
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}

	// 更新
	public JSONArray update(ReplyBean bean) {
		String temp = null; // 轉JSON檔案
		JSONArray json = null;
		boolean dao = false;
		if (bean != null) {
			dao = replyDAO.update(bean);
			if (dao == true) {
				temp = "[{\"status\":\"success\"}]";
				json = JSONArray.fromObject(temp);
			}
		}
		return json;
	}
}
