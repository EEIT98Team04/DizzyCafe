package hongwen.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

@Service
@Transactional
public class BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	//ajax用，selectById傳回GSON格式
	public JSONArray selectToJSON() {
		List<BoardBean> select = boardDAO.select();
		String temp = new Gson().toJson(select );
		JSONArray json = JSONArray.fromObject(temp);
		return json;
	}	
}
