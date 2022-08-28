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
             " primary key(num,ID) " +
                " );",
                " insert into Shop.Product values(1,'qwer', 'qwert', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'qweer', 'qwer','01068896787'); ",
                
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
                "size int not null, " +
                "imgUrl_1 varchar(100) not null," +
                "productName varchar(20) not null, " +
                "price long not null, " +
                "primary key(num) " +
                " );",
                " insert into Shop.Product values(1,123, 1, '0.jpg', 'Èò»öÆ¼', 100); ",
                " insert into Shop.Product values(null,1, 2, '1.jpg', 'Áö°©1', 50); ",
                " insert into Shop.Product values(null,2, 3, '2.jpg', 'Áö°©2', 150); ",
                " insert into Shop.Product values(null,3, 4, '0.jpg', 'ÈòÆ¼', 250); ",
                
                    /***********************************************
                    TABLE NAME   : shop.Product
                     DATABASE     : shop
                     **********************************************/
                
                "drop table if exists shop.Cart; " ,
                "create table Cart( " +
                "num int auto_increment, " +
              //  "basketNo int not null, " +
                "userId varchar(20) not null, " +
                "productCode int not null, " +
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
      
