package SHOP;

public class CartDto {
	private String id;
	private int productCode;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	@Override
	public String toString() {
		return "CartDto [id=" + id + ", productCode=" + productCode + "]";
	}
	
}
