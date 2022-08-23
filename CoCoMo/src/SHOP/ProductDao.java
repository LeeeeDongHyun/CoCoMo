package SHOP;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SHOP.SHOPDB;
import SHOP.IndexDto;
import SHOP.DetailProdRespDto;


public class ProductDao {

	public List<IndexDto> findAllWithLimitNum(int limitNum) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
	//	String sql = "SELECT p.id, p.productName, c.name, p.price, p.soldCount, p.imgUrl_1 FROM product p INNER JOIN company c ON p.companyId = c.id WHERE p.id < ?";
		String sql =  "SELECT p.productCode, p.productName, p.price, "
				+ "  p.size, p.imgUrl_1 FROM Product p WHERE p.productCode < ?";
		
		List<IndexDto> result = new ArrayList<>();
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setInt(1, limitNum);
			rs = prStmt.executeQuery();
			while (rs.next()) {
				IndexDto indexDto = new IndexDto();
						indexDto.setProductCode(rs.getInt("p.productCode"));
						indexDto.setSize(rs.getInt("p.size"));
						indexDto.setProductName(rs.getString("p.productName"));
						indexDto.setPrice(rs.getLong("p.price"));
						indexDto.setImgUrl_1(rs.getString("p.imgUrl_1"));
				result.add(indexDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, prStmt, rs);
		}
		return result;
	}
	
	public  List<IndexDto> findAll() {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
		String sql = "SELECT p.productName, p.price from Product p ORDER BY productName DESC";
		
		List<IndexDto> result = new ArrayList<>();
		
		try {
			prStmt = con.prepareStatement(sql);
			rs = prStmt.executeQuery();
			while (rs.next()) {
				IndexDto indexDto = new IndexDto();
				indexDto.setProductCode(rs.getInt("p.productCode"));
				indexDto.setSize(rs.getInt("p.size"));
				indexDto.setProductName(rs.getString("p.productName"));
				indexDto.setPrice(rs.getLong("p.price"));
				indexDto.setImgUrl_1(rs.getString("p.imgUrl_1"));
		result.add(indexDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			SHOPDB.close(con,prStmt,rs);
		}
		return result;
	}
	public DetailProdRespDto findById(int prodNo) {
		Connection con = SHOPDB.getConnection();
		PreparedStatement prStmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
	//	sb.append("SELECT p.id, p.imgUrl_1, p.imgUrl_2, p.imgUrl_3, p.imgUrl_4, c.url, c.name, p.productName, p.price, p.soldCount, p.detail ");
		sb.append("SELECT p.productName, p.size, p.price, p.imgUrl_1 ");
	//	sb.append("FROM product p INNER JOIN company c ON p.companyId = c.id ");
		sb.append("FROM product p ");
	//	sb.append("WHERE p.id = ?");
		sb.append("WHERE P.productCode = ?");
		String sql = sb.toString();
		
		try {
			prStmt = con.prepareStatement(sql);
			prStmt.setInt(1, prodNo);
			rs = prStmt.executeQuery();
			if (rs.next()) {
				DetailProdRespDto dto = new DetailProdRespDto();
						dto.setProductName(rs.getString("p.productName"));
						dto.setSize(rs.getInt("p.size"));
						dto.setImgUrl_1(rs.getString("p.imgUrl_1"));
						dto.setPrice(rs.getLong("p.price"));
						dto.setDetail(rs.getString("p.detail"));
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SHOPDB.close(con, prStmt, rs);
		}
		return null;
	}
}
