package SHOP;

import java.util.*;

public class Customer {
	int num;
    String id;// 아이디
    String name; //이름
    String password; //비밀번호
    String address; //주소
    String Email; //이메일
    String number; //전화번호

    public Customer() {

    }

    public Customer(String id, String password, String name, String address, String number, String Email)
    {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.address = address;
        this.number = number;
        this.Email = Email;
    }


    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return Email;
    }
    public void setEmail(String email) {
        Email = email;
    }
    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
    }

    // 고객정보 출력
    public void output() {
        System.out.print(" 아이디: " + id +",  ");
        System.out.print("비밀번호: " + password +",  ");
        System.out.print("이름: " + name+",  ");
        System.out.print("이메일: " + Email+",   ");
        System.out.print("전화번호: " + number +",");
        System.out.print("주소: " + address +"");

    }

}