package SHOP;

public class IndexDto {
	private int productCode;
	private int size;
	private String productName;
	private long price;
	private String imgUrl_1;
	
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getImgUrl_1() {
		return imgUrl_1;
	}
	public void setImgUrl_1(String imgUrl_1) {
		this.imgUrl_1 = imgUrl_1;
	}
}
