package wayne.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import wayne.model.MerchandiseBean;
import wayne.model.MerchandiseService;

@Controller
public class CreateMerchandiseController {

	@Autowired
	MerchandiseService merchandiseService;
	
	@Autowired
	ServletContext servletContext;

	@RequestMapping(path = "createmerchandise.controller", method = { RequestMethod.GET, RequestMethod.POST })
	public String CreateMerchandise(String merchandiseName, String merchandiseContent, MultipartFile merchandisePicture,
			String merchandiseTag, int merchandisePrice, int merchandiseQuantity, String merchandiseStatus,
			Model model) {

		MerchandiseBean bean = new MerchandiseBean();
		bean.setMerchandiseContent(merchandiseContent);
		bean.setMerchandiseName(merchandiseName);
		bean.setMerchandisePrice(merchandisePrice);
		bean.setMerchandiseQuantity(merchandiseQuantity);
		bean.setMerchandiseStatus(merchandiseStatus);
		bean.setMerchandiseTag(merchandiseTag);

		if (!merchandisePicture.isEmpty()) {
			try {
				byte[] bytes = merchandisePicture.getBytes();

				// Create the file on server
				String[] strs = merchandisePicture.getContentType().split("/");
				String server_path = servletContext.getRealPath(".");
				String path = "/wayne/images/" + bean.getMerchandiseName() + "." + strs[1];

				bean.setMerchandisePicture(path);
				File serverFile = new File(server_path + path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				merchandiseService.insert(bean);
				return "merchandisemanage";
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return "merchandisemanage";
			}
		} else {
			return "merchandisemanage";
		}
	}
}
