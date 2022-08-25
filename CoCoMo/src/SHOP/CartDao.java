package SHOP;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SHOP.SHOPDB;
import SHOP.CartDto;
import SHOP.CartAllDto;

public class CartDao {
	/*public List<Integer> findFavorByUserId(int userId) {
		Connection conn = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT productId FROM favorite WHERE userId = ?";
		List<Integer> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result.add(rs.getInt("productId"));
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(conn, pstmt, rs);
		}
		return null;
	}*/// 찜관련(보류중)
	
	public List<CartAllDto> findByUserId(String id) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT c.Id, c.productCode, p.productName, p.price, p.imgUrl_1 ");
		sb.append("FROM cart c INNER JOIN product p ON c.productCode = p.productCode WHERE id = ?");

		String sql = sb.toString();
		List<CartAllDto> result = new ArrayList<>();
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setString(1, id);
			rs = prStmt.executeQuery();
			while (rs.next()) {
				CartAllDto dto = new CartAllDto();
						dto.setId(rs.getString("c.id"));
						dto.setProductCode(rs.getInt("c.productCode"));
						dto.setProductName(rs.getString("p.productName"));
						dto.setPrice(rs.getLong("p.price"));
						dto.setImgUrl_1(rs.getString("p.imgUrl_1"));

				result.add(dto);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, prStmt, rs);
		}
		return null;
	}
	
	public boolean isCart(String id, int productCode) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM cart WHERE ID = ? AND productCode = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, productCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, pstmt, rs);
		}
		return false;
	}
	
	public int addCart(CartDto cartDto) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO cart(id, productCode) VALUES (?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cartDto.getId());
			pstmt.setInt(2, cartDto.getProductCode());
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("XXXXXXX");
		} finally {
			SHOPDB.close(con, pstmt);
		}
		return -1;
	}
	
	public int rmvCart(CartDto cartDto) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		String sql = "DELETE FROM cart WHERE ID = ? AND productCode = ?";
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setString(1, cartDto.getId());
			prStmt.setInt(2, cartDto.getProductCode());
			return prStmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, prStmt);
		}
		return -1;
	}
}
