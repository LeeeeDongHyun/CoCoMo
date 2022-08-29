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
	
	public List<CartAllDto> findByUserId(int userId) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT c.num, c.productId, p.productName, p.price, p.imgUrl_1 ");
		sb.append("FROM cart c INNER JOIN product p ON c.productId = p.num  WHERE userId = ?" );
		
		String sql = sb.toString();
		List<CartAllDto> result = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CartAllDto dto = new CartAllDto();
						dto.setNum(rs.getInt("c.num"));
						dto.setProductId(rs.getInt("c.productId"));
						dto.setProductName(rs.getString("p.productName"));
						dto.setPrice(rs.getLong("p.price"));
						dto.setImgUrl_1(rs.getString("p.imgUrl_1"));

				result.add(dto);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, pstmt, rs);
		}
		return null;
	}
	
	public boolean isCart(int userId, int prodNo) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM cart WHERE userId = ? AND productId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userId);
			pstmt.setInt(2, prodNo);
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
		String sql = "INSERT INTO cart(userId, productId) VALUES (?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartDto.getUserId());
			pstmt.setInt(2, cartDto.getProdId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, pstmt);
		}
		return -1;
	}
	
	public int rmvCart(CartDto cartDto) {
		Connection conn = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM cart WHERE userId = ? AND productId = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartDto.getUserId());
			pstmt.setInt(2, cartDto.getProdId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(conn, pstmt);
		}
		return -1;
	}
}
