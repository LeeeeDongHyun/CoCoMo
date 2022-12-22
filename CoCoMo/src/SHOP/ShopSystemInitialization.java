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
                "type varchar(20) not null, " +
                "primary key(num) " +
                " );",
                " insert into Shop.Product values(1,1, 'M', '0.jpg', '¸µÅ¬ ¹«Áö Æ¼¼ÅÃ÷', 15000, '¿Ê'); ",
                " insert into Shop.Product values(null,2, '', '1.jpg', 'ÀÔ¼Ä·Î¶û ÀåÁö°©', 500000, '±âÅ¸'); ",
                " insert into Shop.Product values(null,3, '', '2.jpg', '±¸Âî Ä«µåÁö°©', 1500000, '±âÅ¸'); ",
                " insert into Shop.Product values(null,4, 'L', '3.jpg', 'Á¤Àå ½½·º½º', 55900, '¿Ê'); ",
                " insert into Shop.Product values(null,5, 'XL', '4.jpg', '¿©¸§ ÇÊ¼öÅÛ ¸°³Ù¹ÙÁö', 35400, '¿Ê'); ",
                " insert into Shop.Product values(null,6, 'L', '5.jpg', '¼¼¹Ì ¿À¹öÇÍ ±×·¹ÀÌÁø', 38500, '¿Ê'); ",
                " insert into Shop.Product values(null,7, 'XL', '6.jpg', '¹ú·éÇÍ µ¥´ÔÀÚÄÏ', 45900, '¿Ê'); ",
                " insert into Shop.Product values(null,8, 'FREE', '7.jpg', '½½¸²ÇÍ ±×·¹ÀÌÁø', 35500, '¿Ê'); ",
                " insert into Shop.Product values(null,9, 'XL', '8.jpg', '¹ú·éÇÍ ¸á·Ð ÈÄµåÆ¼', 25500, '¿Ê'); ",
                " insert into Shop.Product values(null,10, 'XL', '9.jpg', 'ºí·ç ¹Ú½ºÆ¼', 23500, '¿Ê'); ",
                " insert into Shop.Product values(null,11, '265', '10.jpg', '³ªÀÌÅ° µ¢Å© ·Î¿ì ÄÚ½ºÆ®', 354000, '½Å¹ß'); ",
                " insert into Shop.Product values(null,12, '290', '11.jpg', '³ªÀÌÅ° µ¢Å© ·Î¿ì ·¹Æ®·Î ºí·¢', 178000, '½Å¹ß'); ",
                " insert into Shop.Product values(null,13, '', '12.jpg', 'Å©·ÒÇÏÃ÷ Æ÷¿¡¹ö¸µ', 200000, '±âÅ¸'); ",
                " insert into Shop.Product values(null,14, '', '13.jpg', 'È­ÀÌÆ® ¸Þ½ÅÁ®¹é', 38500, '±âÅ¸'); ",
                " insert into Shop.Product values(null,15, '', '14.jpg', 'À¯´ÏÅ¬·Î ¹éÆÑ', 48500, '±âÅ¸'); ",
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
                " );",
                
                /***********************************************
					TABLE NAME   : shop.Favor
					DATABASE     : shop
					 **********************************************/
    
			"drop table if exists shop.Favor; " ,
				"create table Favor( " +
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