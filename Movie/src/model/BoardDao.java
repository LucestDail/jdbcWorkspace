package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {
	
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int maxnum(String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum(boardname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public int maxgrp(String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum(boardname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	
	public boolean insert(Board board, String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", board.getNum());
			map.put("name", board.getName());
			map.put("pass", board.getPass());
			map.put("subject", board.getSubject());
			map.put("content", board.getContent());
			map.put("file1", board.getFile1());
			map.put("readcnt", board.getReadcnt());
			map.put("grp", board.getGrp());
			map.put("grplevel", board.getGrplevel());
			map.put("grpstep", board.getGrpstep());
			map.put("boardname", boardname);
			System.out.println(map);
			return session.getMapper(cls).insert(map)>0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	
	public int boardCount(String column, String find, String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			if(column != null) {
				String[] cols = column.split(",");
//				for(int i = 0; i < cols.length; i++) {
//					map.put("col"+(i+1), cols[i]);
//				}
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]);
				case 2 : map.put("col2", cols[1]);
				case 1 : map.put("col1", cols[0]);
				}
			}
			map.put("boardname", boardname);
			map.put("find", find);
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	
	public List<Board> list(int pageNum, int limit, String column, String find, String boardname){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			if(column != null) {
				String[] cols = column.split(",");
//				for(int i = 0; i < cols.length; i++) {
//					map.put("col"+(i+1), cols[i]);
//				}
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]);
				case 2 : map.put("col2", cols[1]);
				case 1 : map.put("col1", cols[0]);
				}
			}
			map.put("find", find);
			map.put("start", (pageNum - 1) * limit);
			map.put("limit", limit);
			map.put("boardname", boardname);
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public Board selectOne(String num, String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("boardname", boardname);
			System.out.println(map);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		
		return null;
	}
	
	public void readcntAdd(String num, String boardname) {
		System.out.println("readcntAdd function : " + num + "," + boardname);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("boardname", boardname);
			System.out.println(map);
			session.getMapper(cls).readcntAdd(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}
	
	public void grpStepAdd(int grp, int grpstep, String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("grp", grp);
			map.put("grpstep", grpstep);
			map.put("boardname", boardname);
			session.getMapper(cls).grpStepAdd(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}
	
	public boolean update(Board board, String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("name", board.getName());
			map.put("subject", board.getSubject());
			map.put("content", board.getContent());
			map.put("file1", board.getFile1());
			map.put("num", board.getNum());
			map.put("boardname", boardname);
			return session.getMapper(cls).update(map)>0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	
	public boolean delete(String num, String boardname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("boardname", boardname);
			return session.getMapper(cls).delete(map)>0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
}
