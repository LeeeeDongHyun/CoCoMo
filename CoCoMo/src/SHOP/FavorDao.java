package SHOP;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SHOP.SHOPDB;
import SHOP.FavorDto;
import SHOP.FavorAllDto;

public class FavorDao {
	
	public List<FavorAllDto> findByUserId(int userId) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT f.num, f.productId, p.productName, p.price, p.imgUrl_1, p.size ");
		sb.append("FROM favor f INNER JOIN product p ON f.productId = p.num  WHERE userId = ?" );
		
		String sql = sb.toString();
		List<FavorAllDto> result = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FavorAllDto dto = new FavorAllDto();
						dto.setNum(rs.getInt("f.num"));
						dto.setProductId(rs.getInt("f.productId"));
						dto.setProductName(rs.getString("p.productName"));
						dto.setPrice(rs.getLong("p.price"));
						dto.setSize(rs.getString("size"));
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

	public boolean isFavor(int userId, int prodNo) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM favor WHERE userId = ? AND productId = ?";
		
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
	
	public int addFavor(FavorDto favorDto) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO favor(userId, productId) VALUES (?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, favorDto.getUserId());
			pstmt.setInt(2, favorDto.getProdId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, pstmt);
		}
		return -1;
	}
	
	public int rmvFavor(FavorDto favorDto) {
		Connection conn = SHOPDB.getConnection();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM favor WHERE userId = ? AND productId = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, favorDto.getUserId());
			pstmt.setInt(2, favorDto.getProdId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(conn, pstmt);
		}
		return -1;
	}
}
