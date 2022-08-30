package SHOP;

public class ShopSystemInitialization {

      static String[]  sqls = {
               " drop database if exists shop;", 
               " create database shop;",
               " use shop;",
               
               /***********************************************
                TABLE NAME   : shop.Customer
                DATABASE     : shop
                **********************************************/
             "  drop table if exists shop.Customer; ",
             "  create table Customer( " + 
             "num int auto_increment, " +
             "  ID varchar(20) not null, " + 
              " name varchar(20) not null, " +
              " password varchar(100) not null, " +
              " address varchar(30) not null, " +
              " Email varchar(30) not null, " +
              " number varchar(20) not null, " +
             " primary key(num) " +
                " );",
                
                
                    /***********************************************
                           TABLE NAME   : shop.myOrder
                      DATABASE     : shop
                      **********************************************/
                
                
         /*       " drop table if exists shop.myOrder;" ,
                " create table myOrder( " + 
                "num int auto_increment, " +
                " productCode varchar(20) not null, " + 
                " orderNo int(10) not null, " + 
                " ID varchar(20) not null, " + 
                " EA int not null, " + 
                " price long not null, " + 
                " address varchar(30) not null, " + 
                " primary key(num,orderNo, productCode), " + 
                " FOREIGN KEY (ID) REFERENCES Customer(ID)" + 
                " );",   
                */
                
                   
                    /***********************************************
                            TABLE NAME   : shop.orderTable
                            DATABASE     : shop
                     **********************************************/
                /*
                    " drop table if exists shop.orderTable;" ,
                "create table orderTable( " +
                "num int auto_increment, " +
                "orderTableNo int not null, " +
                "EA int not null, " +
                "orderNo int not null, " +
                "primary key(num,orderTableNo), " +
                "FOREIGN KEY (orderNo) REFERENCES myOrder(orderNo) " +
                " );",
                */
                
                    /***********************************************
                    TABLE NAME   : shop.Product
                     DATABASE     : shop
                     **********************************************/
                
                "drop table if exists shop.Product; " ,
                "create table Product( " +
                "num int auto_increment, " +
                "ProductCode int not null, " +
                "size varchar(20) not null, " +
                "imgUrl_1 varchar(100) not null," +
                "productName varchar(20) not null, " +
                "price long not null, " +
                "primary key(num) " +
                " );",
                " insert into Shop.Product values(1,1, 'M', '0.jpg', '링클 무지 티셔츠', 15000); ",
                " insert into Shop.Product values(null,2, '', '1.jpg', '입셍로랑 장지갑', 500000); ",
                " insert into Shop.Product values(null,3, '', '2.jpg', '구찌 카드지갑', 1500000); ",
                " insert into Shop.Product values(null,4, 'L', '3.jpg', '정장 슬렉스', 55900); ",
                " insert into Shop.Product values(null,5, 'XL', '4.jpg', '여름 필수템 린넨바지', 35400); ",
                " insert into Shop.Product values(null,6, 'L', '5.jpg', '세미 오버핏 그레이진', 38500); ",
                " insert into Shop.Product values(null,7, 'XL', '6.jpg', '벌룬핏 데님자켓', 45900); ",
                " insert into Shop.Product values(null,8, 'FREE', '7.jpg', '슬림핏 그레이진', 35500); ",
                " insert into Shop.Product values(null,9, 'XL', '8.jpg', '벌룬핏 멜론 후드티', 25500); ",
                " insert into Shop.Product values(null,10, 'XL', '9.jpg', '블루 박스티', 23500); ",
                " insert into Shop.Product values(null,11, '265', '10.jpg', '나이키 덩크 로우 코스트', 354000); ",
                " insert into Shop.Product values(null,12, '290', '11.jpg', '나이키 덩크 로우 레트로 블랙', 178000); ",
                " insert into Shop.Product values(null,13, '', '12.jpg', '크롬하츠 포에버링', 200000); ",
                " insert into Shop.Product values(null,14, '', '13.jpg', '화이트 메신져백', 38500); ",
                " insert into Shop.Product values(null,15, '', '14.jpg', '유니클로 백팩', 48500); ",
                
                    /***********************************************
                    TABLE NAME   : shop.Product
                     DATABASE     : shop
                     **********************************************/
                
                "drop table if exists shop.Cart; " ,
                "create table Cart( " +
                "num int auto_increment, " +
              //  "basketNo int not null, " +
                "userId int not null, " +
                "productId int not null, " +
             //   "totalPrice int not null, " +
              //  "EA int not null, " +
              "primary key(num) " +
            //    "FOREIGN KEY (ID) REFERENCES Customer(ID), " +
            //    "FOREIGN KEY (productCode) REFERENCES Product(productCode) " +
                " );",}; 
                
                    /***********************************************
                    TABLE NAME   : shop.Delivery
                     DATABASE     : shop
                     **********************************************/
                
                
                /*
                "drop table if exists shop.Delivery; " ,
                "create table Delivery( " +
                "num int auto_increment, " +
                "deliveryNo int not null, " +
                "ID varchar(20) not null, " +
                "productName varchar(20) not null, " +
                "name varchar(20) not null, " +
                "arriveDate varchar(20) not null, " +
                "arriveLocation varchar(20) not null, " +
                "primary key(num,deliveryNo), " +
                "FOREIGN KEY (ID) REFERENCES Customer(ID) " +
                " );",};  
                */

      
      public static void main(String[] args) {
            createInitialShopDatabase();
              
         }
         static void createInitialShopDatabase() {
            SHOPDB.loadConnect("mysql");
            
            for (String sql : sqls) {
               SHOPDB.executeAnyQuery(sql);
               
                  System.out.println("  << for debug >> in createInitialShopDatabase(), sql = " + sql); 
            }
            
         }
         
         
      }