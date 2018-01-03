package wayne.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import wayne.model.MerchandiseBackstageService;
import wayne.model.MerchandiseBean;

@Controller
public class UpdateMerchandiseController {
	
	@Autowired
	MerchandiseBackstageService merchandisebackstageService; 
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(path="updatemerchandise.controller",
			method= {RequestMethod.GET,RequestMethod.POST})
	public String UpdateMerchandise(Model model,int merchandiseId, String merchandiseName, int merchandisePrice,
			int merchandiseQuantity, String merchandiseStatus, String merchandiseTag, String merchandiseContent,
			MultipartFile merchandisePicture) {
		
		MerchandiseBean bean = merchandisebackstageService.updateMerchandiseInBackstageById(merchandiseId);
		System.out.println(merchandiseId);
		
		bean.setMerchandiseName(merchandiseName);
		bean.setMerchandisePrice(merchandisePrice);
		bean.setMerchandiseQuantity(merchandiseQuantity);
		bean.setMerchandiseStatus(merchandiseStatus);
		bean.setMerchandiseTag(merchandiseTag);
		bean.setMerchandiseContent(merchandiseContent);
		
		if(!merchandisePicture.isEmpty()) {
			try {
				byte[] bytes = merchandisePicture.getBytes();
				
				// Create the file on server
				String[] strs = merchandisePicture.getContentType().split("/");
				String server_path = servletContext.getRealPath(".");
				String path = "/wayne/images/"+ bean.getMerchandiseName() + "." +strs[1];
				
				bean.setMerchandisePicture(path);
				File serverFile = new File(server_path+path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				
				merchandisebackstageService.updateMerchandiseInBackstage(bean);
				return "merchandisemanage";
			} catch (IOException e) {
				System.out.println(e.getMessage());
				return "merchandisemanage";
			}
		}else {
				merchandisebackstageService.updateMerchandiseInBackstage(bean);
				return "merchandisemanage";
			}		
	}
}
