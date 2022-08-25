package SHOP;

import java.util.List;

import SHOP.Customer;
import SHOP.CustomerDao;

public class CustomerService {
	private CustomerDao customerDao;
	
	public CustomerService() {
		this.customerDao = new CustomerDao();
	}
	public List<Integer> 장바구니번호리스트(String id) {
		return customerDao.findForCartList(id);
	}
	
	public CheckoutRespDto 구매회원정보(String id) {
		return customerDao.findById(id);
	}
}
