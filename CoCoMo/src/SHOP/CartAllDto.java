package SHOP;

public class CartAllDto {
	private int id;
	private int productCode;
	private String productName;
	private String imgUrl_1;
	private long price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImgUrl_1() {
		return imgUrl_1;
	}
	public void setImgUrl_1(String imgUrl_1) {
		this.imgUrl_1 = imgUrl_1;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
}
