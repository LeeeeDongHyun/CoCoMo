package SHOP;

import java.util.List;
import SHOP.FavorDao;
import SHOP.CartDto;
import SHOP.CartAllDto;

public class FavorService {
private FavorDao favorDao;
	
	public FavorService() {
		this.favorDao = new FavorDao();
	}
	
	public boolean isF(int userId, int prodNo) {
		return favorDao.isFavor(userId, prodNo);
	}
	
	public int addF(FavorDto favorDto) {
		return favorDao.addFavor(favorDto);
	}
	
	public int delF(FavorDto favorDto) {
		return favorDao.rmvFavor(favorDto);
	}
	
	public List<FavorAllDto> callF(int userId) {
		return favorDao.findByUserId(userId);

}
}
