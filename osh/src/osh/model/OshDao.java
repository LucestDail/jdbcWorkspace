package osh.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import osh.model.mapper.OshMapper;

public class OshDao {

	private Class<OshMapper> cls = OshMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int Count(String column, String find) {
		SqlSession session = OshConnection.getConnection();
		try {
			map.clear();
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 2 : map.put("col2", cols[1]);
				case 1 : map.put("col1", cols[0]);
				}
			}
			map.put("find", find);
			return session.getMapper(cls).Count(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			OshConnection.close(session);
		}
		return 0;
	}
	
	
	public List<Osh> list(String column, String find){
		SqlSession session = OshConnection.getConnection();
		try {
			map.clear();
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 2 : map.put("col2", cols[1]);
				case 1 : map.put("col1", cols[0]);
				}
			}
			map.put("find", find);
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			OshConnection.close(session);
		}
		return null;
	}
}
