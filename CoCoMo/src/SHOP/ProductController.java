package SHOP;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SHOP.ProductService;

@WebServlet("/Product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService;
	
public ProductController() {
	 super();
     this.productService = new ProductService();
}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		RequestDispatcher dis; 

		if (cmd.equals("Main")) {
			List<IndexDto> productList30 = productService.findA(30);
			request.setAttribute("productList30", productList30);
			dis = request.getRequestDispatcher("/Main.jsp");
			dis.forward(request, response);

		} else if (cmd.equals("detail")) {
			int prodNo = Integer.parseInt(request.getParameter("prodNo"));
			// 상품 정보 받아오기 시작
			DetailProdRespDto prodDto = productService.findB(prodNo);
			request.setAttribute("prodDto", prodDto);
			// 상품 정보 받아오기 끝
}
	}
}
