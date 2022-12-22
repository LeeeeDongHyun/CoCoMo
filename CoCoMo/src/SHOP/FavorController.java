package SHOP;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SHOP.FavorService;
import SHOP.Customer;
import SHOP.FavorDto;
import SHOP.FavorAllDto;

import com.google.gson.Gson;

@WebServlet("/favor")
public class FavorController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private FavorService favorService;
	
	public FavorController() {
		super();
		this.favorService = new FavorService();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		
		if(cmd.equals("favorAdd")) {
			Gson gson = new Gson();
			BufferedReader br = request.getReader();
			PrintWriter out = response.getWriter();
			String data = br.readLine();
			FavorDto favorDto = gson.fromJson(data, FavorDto.class);
			
			int result = favorService.addF(favorDto);
			
			if(result ==1) {
				out.print("200");
			}else {
				out.print("500");
			}
			out.flush();
			
		}else if(cmd.equals("favorRmv")) {
			Gson gson = new Gson();
			BufferedReader br = request.getReader();
			PrintWriter out = response.getWriter();
			String data = br.readLine();
			FavorDto favorDto = gson.fromJson(data, FavorDto.class);
			
			int result = favorService.delF(favorDto);
			
			if(result ==1) {
				out.print("200");
			}else {
				out.print("500");
			}out.flush();
			
		}else if(cmd.equals("favorList")) {
			HttpSession session = request.getSession();
			Customer customer = (Customer) session.getAttribute("customer");//오류해결
			int userId = customer.getNum();//오류
			
			List<FavorAllDto> favorDtoList = favorService.callF(userId);
			request.setAttribute("favorDtoList", favorDtoList);
			
			RequestDispatcher dis = request.getRequestDispatcher("/Favor.jsp");
			dis.forward(request, response);
		}
	}
}
