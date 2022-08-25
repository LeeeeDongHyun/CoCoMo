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
             "  ID varchar(20) not null, " + 
              " name varchar(20) not null, " +
              " password varchar(100) not null, " +
              " address varchar(30) not null, " +
              " Email varchar(30) not null, " +
              " number varchar(20) not null, " +
              " primary key(ID) " +
                " );",
                
                    /***********************************************
                           TABLE NAME   : shop.myOrder
                      DATABASE     : shop
                      **********************************************/
                
                
                " drop table if exists shop.myOrder;" ,
                " create table myOrder( " + 
                " productCode varchar(20) not null, " + 
                " orderNo int(10) not null, " + 
                " ID varchar(20) not null, " + 
                " EA int not null, " + 
                " price long not null, " + 
                " address varchar(30) not null, " + 
                " primary key(orderNo, productCode), " + 
                " FOREIGN KEY (ID) REFERENCES Customer(ID)" + 
                " );",
                
                
                    
                    /***********************************************
                            TABLE NAME   : shop.orderTable
                            DATABASE     : shop
                     **********************************************/
                
                    " drop table if exists shop.orderTable;" ,
                "create table orderTable( " +
                "orderTableNo int not null, " +
                "EA int not null, " +
                "orderNo int not null, " +
                "primary key(orderTableNo), " +
                "FOREIGN KEY (orderNo) REFERENCES myOrder(orderNo) " +
                " );",
                
                
                    /***********************************************
                    TABLE NAME   : shop.Product
                     DATABASE     : shop
                     **********************************************/
                
                "drop table if exists shop.Product; " ,
                "create table Product( " +
                "ProductCode int not null auto_increment, " +
                "size int not null, " +
                "imgUrl_1 varchar(100) not null," +
                "productName varchar(20) not null, " +
                "price long not null, " +
                "primary key(productCode) " +
                " );",
                " insert into Shop.Product values(1, 100, '0.jpg', 'Èò»ö Æ¼', 100); ",
                " insert into Shop.Product values(null, 105, '1.jpg', 'Áö°©1', 50); ",
                " insert into Shop.Product values(null, 95, '2.jpg', 'Áö°©2', 1000); ",
                
                    /***********************************************
                    TABLE NAME   : shop.Product
                     DATABASE     : shop
                     **********************************************/
                
                "drop table if exists shop.Cart; " ,
                "create table Cart( " +
               // "CartNo int not null, " +
                "ID varchar(20) not null, " +
                "productCode int not null, " +
              //  "totalPrice int not null, " +
               // "EA int not null, " +
             //   "primary key(CartNo), " +
                "FOREIGN KEY (ID) REFERENCES Customer(ID), " +
                "FOREIGN KEY (productCode) REFERENCES Product(productCode) " +
                " );",
                
                    /***********************************************
                    TABLE NAME   : shop.Delivery
                     DATABASE     : shop
                     **********************************************/
                
                
                
                "drop table if exists shop.Delivery; " ,
                "create table Delivery( " +
                "deliveryNo int not null, " +
                "ID varchar(20) not null, " +
                "productName varchar(20) not null, " +
                "name varchar(20) not null, " +
                "arriveDate varchar(20) not null, " +
                "arriveLocation varchar(20) not null, " +
                "primary key(deliveryNo), " +
                "FOREIGN KEY (ID) REFERENCES Customer(ID) " +
                " );",};  
                

      
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
      
