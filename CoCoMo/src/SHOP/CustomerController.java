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

import SHOP.Customer;
import SHOP.CustomerService;
import SHOP.CheckoutRespDto;
import SHOP.CheckoutProductDto;
    
@WebServlet("/Customer")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerService customerService;
	
    public CustomerController() {
        super();
        this.customerService = new CustomerService();
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
		System.out.println(request.getRequestURI());

	if (cmd.equals("directBuy")) {
		int id = Integer.parseInt(request.getParameter("id"));
		CheckoutRespDto userInfo = customerService.구매회원정보(id);
		request.setAttribute("userInfo", userInfo);
		
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		ProductService productService = new ProductService();
		CheckoutProductDto prodInfo  = productService.구매상품정보(productCode);
		request.setAttribute("prodInfo", prodInfo);
		
		dis = request.getRequestDispatcher("/Cart.jsp");
		dis.forward(request, response);
		
	} else if (cmd.equals("cartBuy")) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		CheckoutRespDto userInfo = customerService.구매회원정보(userId);
		request.setAttribute("userInfo", userInfo);
		
		List<Integer> cartList = customerService.장바구니번호리스트(userId);
		ProductService productService = new ProductService();
		List<CheckoutProductDto> prodList = productService.구매상품정보(cartList);
		request.setAttribute("prodList", prodList);

		dis = request.getRequestDispatcher("/cartBuy.jsp");
		dis.forward(request, response);

	}
	
}

}
