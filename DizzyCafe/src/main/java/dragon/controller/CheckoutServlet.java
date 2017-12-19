package dragon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//讀取使用者輸入資料
		String buyer = request.getParameter("buyer");
		String shipPhone = request.getParameter("shipPhone");
		String email = request.getParameter("email");
		String a = request.getParameter("check");
		System.out.println("1");
		if(a== null)
		{
			System.out.println("2");
		}
		
		
		
		request.getRequestDispatcher("/Checkout/Checkout.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}
