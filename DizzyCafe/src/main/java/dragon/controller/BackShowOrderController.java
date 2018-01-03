package dragon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dragon.model.OrdersDetailsService;
import dragon.model.OrdersService;
import net.sf.json.JSONArray;

@Controller
public class BackShowOrderController {
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private OrdersDetailsService ordersDetailsService;
	
	@RequestMapping(path= "/selectAllOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray selectAllOrder() {
		return ordersService.selectAllOrder();
	}
	
	@RequestMapping(path= "/selectUnpaidOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray selectUnpaidOrder() {
		return ordersService.selectUnpaidOrder();
	}
	
	@RequestMapping(path= "/selectWaitshipmentOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray selectWaitshipmentOrder() {
		return ordersService.selectWaitshipmentOrder();
	}
	
	@RequestMapping(path= "/selectShipOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray selectShipOrder() {
		return ordersService.selectShipOrder();
	}
	
	@RequestMapping(path= "/selectFinishOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray selectFinishOrder() {
		return ordersService.selectFinishOrder();
	}
	
	@RequestMapping(path= "/selectCancelOrder.controller", method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody JSONArray selectCancelOrder() {
		return ordersService.selectCancelOrder();
	}
}
