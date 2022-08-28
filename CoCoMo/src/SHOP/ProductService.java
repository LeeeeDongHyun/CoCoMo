package SHOP;

import java.util.List;

import SHOP.IndexDto;
import SHOP.ProductDao;
import SHOP.DetailProdRespDto;
import SHOP.CheckoutProductDto;

public class ProductService {
private ProductDao productDao;
	
	public ProductService() {
		productDao = new ProductDao();
	}
	
	public List<IndexDto> findA(int limitNum) {
		return productDao.findAllWithLimitNum(limitNum);
	}
	
	public List<IndexDto> findA() {
		return productDao.findAll();
	}
	
	//public int 상품등록(InsertReqDto dto) {
	//	return productDao.insert(dto);
	//}
	
	public DetailProdRespDto findB(int prodNo) {
		return productDao.findById(prodNo);
	}
	
//	public List<IndexDto> 상품키워드찾기(String keyword) {
	//	return productDao.findByKeyword(keyword);
//	}
	
//	public List<IndexDto> 상품회사코드찾기(int compNo) {
//		return productDao.findByCompNo(compNo);
//	}
	
//	public List<HeaderBrandDto> 회사명리스트() {
//		return productDao.getAllCompName();
//	}
	
//	public List<IndexDto> 상품순위() {
//		return productDao.findAllSortBySoldCount();
//	}
	
	public CheckoutProductDto 구매상품정보(int productCode) {
		return productDao.findForBuy(productCode);
		}
		
	public List<CheckoutProductDto> 구매상품정보(List<Integer> cartList) {
			return productDao.findForBuy(cartList);
		}
	
//	public void 구매수증가(int prodId) {
//		productDao.updateSoldCount(prodId);
//	}
}
