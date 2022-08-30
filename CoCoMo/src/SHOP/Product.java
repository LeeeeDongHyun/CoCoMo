package SHOP;

import java.sql.Connection;
import javax.sql.DataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.util.*;

public class Product {
	
   int num;
   int productCode; //상품코드
   String size;   //사이즈
   String productName; //상품이름
   long price; //가격
   String imgUrl_1;


   public Product() {

   }
   public Product(int productCode,  String size, String productName, int price, String imgUrl_1)
   {
       super();
       this.productCode = productCode;
       this.size = size;
       this.productName = productName;
       this.price = price;
       this.imgUrl_1 = imgUrl_1;
   }
   public int getNum() {
	   	return num;
	   }


	   public void setNum(int num) {
	   	this.num = num;
	   }
   
   public int getProductCode() {
   	return productCode;
   }


   public void setProductCode(int productCode) {
   	this.productCode = productCode;
   }


   public String getSize() {
   	return size;
   }


   public void setSize(String size) {
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
   //고객정보 출력
   public void output() {
       System.out.print(" 상품코드: " + productCode +",  ");
       System.out.print(" 사이즈: " + size+",  ");
       System.out.print(" 상품이름: " + productName +",  ");
       System.out.print(" 가격: " + price +"");

    

}


}