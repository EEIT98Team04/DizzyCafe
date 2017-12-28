package applehead.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import applehead.model.DailyEventBean;
import applehead.model.DailyEventService;

@Controller
public class UpdateDailyEventController {
	
	@Autowired
	DailyEventService dailyEventService;
	
	@RequestMapping(
				path="/updateDaily.controller",
				method= {RequestMethod.POST}
			)
	public @ResponseBody void gogo(String discount1,String discount2,String discount3,
			String merchandiseId1,String merchandiseId2,String merchandiseId3) {
		String merchandiseId[] = new String[] {merchandiseId1,merchandiseId2,merchandiseId3};
		String discount[] = new String[] {discount1,discount2,discount3};
		List<DailyEventBean> list = new ArrayList<>();
		for(int i=1;i<=3;i++) {
			DailyEventBean bean = new DailyEventBean();
			bean.setEventId(i);
			bean.setMerchandiseId(Integer.valueOf(merchandiseId[i-1]));
			bean.setDiscount(Double.valueOf(discount[i-1])/10);
			list.add(bean);
		}
		dailyEventService.updateAll(list);
	}
}
