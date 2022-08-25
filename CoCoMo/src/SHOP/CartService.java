package SHOP;

import java.util.List;
import SHOP.CartDao;
import SHOP.CartDto;
import SHOP.CartAllDto;

public class CartService {
private CartDao cartDao;
	
	public CartService() {
		this.cartDao = new CartDao();
	}
	
	public boolean isC(int userId, int prodNo) {
		return cartDao.isCart(userId, prodNo);
	}
	
	public int addC(CartDto cartDto) {
		return cartDao.addCart(cartDto);
	}
	
	public int delC(CartDto cartDto) {
		return cartDao.rmvCart(cartDto);
	}
	
	public List<CartAllDto> callC(String id) {
		return cartDao.findByUserId(id);

}
}
