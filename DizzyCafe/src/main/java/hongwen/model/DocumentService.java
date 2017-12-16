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

	public JSONArray selectToJSON(int boardId) {
		System.out.println(boardId);
		List<DocumentBean> select = documentDAO.select(boardId);
		String temp = new Gson().toJson(select);				//轉JSON檔案
		JSONArray json = JSONArray.fromObject(temp);
		System.out.println("temp="+temp);
		System.out.println("json="+json);
		return json;
	}
	
//	@Transactional(readOnly=true)
//	public List<Object[]> select(ProductBean bean) {
//		List<Object[]> result = null;
//		if(bean!=null && bean.getId()!=0) {
//			ProductBean temp = documentDAO.select(bean.getId());
//			if(temp!=null) {
//				result = new ArrayList<>();
//				Object[] array = new Object[5];
//				array[0] = temp.getId();
//				array[1] = temp.getName();
//				array[2] = temp.getPrice();
//				array[3] = temp.getMake();
//				array[4] = temp.getExpire();
//				result.add(array);
//			}
//		} else {
//			result = new ArrayList<>();
//			List<ProductBean> beans = documentDAO.select();
//			for(ProductBean temp : beans) {
//				Object[] array = new Object[5];
//				array[0] = temp.getId();
//				array[1] = temp.getName();
//				array[2] = temp.getPrice();
//				array[3] = temp.getMake();
//				array[4] = temp.getExpire();
//				result.add(array);
//			}
//		}
//		return result;
//	}
//	public ProductBean insert(ProductBean bean) {
//		ProductBean result = null;
//		if(bean!=null) {
//			result = documentDAO.insert(bean);
//		}
//		return result;
//	}
//	public ProductBean update(ProductBean bean) {
//		ProductBean result = null;
//		if(bean!=null) {
//			result = documentDAO.update(bean.getName(), bean.getPrice(),
//					bean.getMake(), bean.getExpire(), bean.getId());
//		}
//		return result;
//	}
//	public boolean delete(ProductBean bean) {
//		boolean result = false;
//		if(bean!=null) {
//			result = documentDAO.delete(bean.getId());
//		}
//		return result;
//	}

}
