package SHOP;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SHOP.SHOPDB;
import SHOP.CheckoutRespDto;

public class CustomerDao {
	public List<Integer> findForCartList(int num) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
		String sql = "SELECT productId FROM cart WHERE userId = ?";
		List<Integer> result = new ArrayList<>();
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setInt(1, num);
			rs = prStmt.executeQuery();
			while (rs.next()) {
				int prodId = rs.getInt("productId");
				result.add(prodId);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, prStmt, rs);
		}
		return null;
	}
	
	public CheckoutRespDto findById(int num) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
		String sql = "SELECT num, name, Email, number, address FROM customer WHERE num = ?";
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setInt(1, num);
			rs = prStmt.executeQuery();
			if (rs.next()) {
				CheckoutRespDto corDto = new CheckoutRespDto();
						corDto.setNum(rs.getInt("num"));
						corDto.setName(rs.getString("name"));
						corDto.setEmail(rs.getString("Email"));
						corDto.setNumber(rs.getString("number"));
						corDto.setAddress(rs.getString("address"));
				return corDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, prStmt, rs);
		}
		return null;
	}
}
