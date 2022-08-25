package SHOP;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SHOP.SHOPDB;

public class CustomerDao {
	public List<Integer> findForCartList(String id) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
		String sql = "SELECT productCode FROM CART WHERE id = ?";
		List<Integer> result = new ArrayList<>();
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setString(1, id);
			rs = prStmt.executeQuery();
			while (rs.next()) {
				int productCode = rs.getInt("productCode");
				result.add(productCode);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, prStmt, rs);
		}
		return null;
	}
	
	public CheckoutRespDto findById(String id) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, name, Email, phone, address FROM customer WHERE id = ?";
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setString(1, id);
			rs = prStmt.executeQuery();
			if (rs.next()) {
				CheckoutRespDto corDto = new CheckoutRespDto();
						corDto.setId(rs.getNString("id"));
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
