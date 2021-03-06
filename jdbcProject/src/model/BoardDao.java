package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	public int maxnum() {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select ifnull(max(num),0) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public int maxgrp() {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select ifnull(max(grp),0) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public boolean insert(Board board) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into board (num, name, pass, subject, content, file1, regdate, readcnt, grp, grplevel, grpstep) values(?,?,?,?,?,?,now(),?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile1());
			pstmt.setInt(7, board.getReadcnt());
			pstmt.setInt(8, board.getGrp());
			pstmt.setInt(9, board.getGrplevel());
			pstmt.setInt(10, board.getGrpstep());
			return pstmt.executeUpdate()>0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return false;
	}
	
	public int boardCount() {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	
	public List<Board> list(int pageNum, int limit){
		List<Board> list = new ArrayList<>();
		Connection conn = DbConnection.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from board order by grp desc, grpstep asc limit ?,?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum - 1)*limit);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setGrpstep(rs.getInt("grpstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				list.add(b);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public Board selectOne(String num) {
		Connection conn = DbConnection.getConnection();
		String sql = "select * from board where num = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// sql 구문을 dbms 에 전달.
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setGrp(rs.getInt("grp"));
				b.setGrplevel(rs.getInt("grplevel"));
				b.setGrpstep(rs.getInt("grpstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				return b;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, null);
		}
		
		return null;
	}
	
	public void readcntAdd(String num) {
		Connection conn = DbConnection.getConnection();
		String sql = "update board set readcnt = (readcnt+1) where num = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// sql 구문을 dbms 에 전달.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, null);
		}
	}
	
	public void grpStepAdd(int grp, int grpstep) {
		Connection conn = DbConnection.getConnection();
		String sql = "update board set grpstep = grpstep + 1 where grp = ? and grpstep > ?";
		PreparedStatement pstmt = null;
		try {
			// sql 구문을 dbms 에 전달.
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, grp);
			pstmt.setInt(2,grpstep);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, null);
		}
	}
	
	public boolean update(Board board) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set name = ?, subject = ?, content = ?, file1 = ?, regdate = now() where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getFile1());
			pstmt.setInt(5,board.getNum());
			return pstmt.executeUpdate()>0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, null);
		}
		return false;
	}
	
	public boolean delete(String num) {
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from board where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			return pstmt.executeUpdate()>0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbConnection.close(conn, pstmt, null);
		}
		return false;
	}
}
