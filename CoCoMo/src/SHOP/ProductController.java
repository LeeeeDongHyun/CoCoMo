package SHOP;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			int productCode = Integer.parseInt(request.getParameter("productCode"));
			// ��ǰ ���� �޾ƿ��� ����
			DetailProdRespDto prodDto = productService.��ǰ�󼼺���(productCode);
			request.setAttribute("prodDto", prodDto);
			// ��ǰ ���� �޾ƿ��� ��
			// �� ����, īƮ ���� �޾ƿ��� ����
						HttpSession session = request.getSession();
						Customer customer = (Customer) session.getAttribute("customer");
						if (customer != null) {
							String id = customer.getId();
							
					//		FavorService favorService = new FavorService();
					//		boolean isFavor = favorService.�򿩺�(id, prodNo);
					//		request.setAttribute("isFavor", isFavor);
							
							CartService cartService = new CartService();
							boolean isCart = cartService.isC(id, productCode);
							request.setAttribute("isCart", isCart);
						}
			dis = request.getRequestDispatcher("/Payment.jsp");
			dis.forward(request, response);

}

	}
}
