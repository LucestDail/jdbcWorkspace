package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.ProfessorMapper;

public class Test1 {
	private final static String NS = "mapper.ProfessorMapper.";
	private static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}

	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		Map<String,Object> map = new HashMap<>();
		
		System.out.println("모든 교수 정보 조회하기");
		map.clear();
		List<Professor> list = session.getMapper(ProfessorMapper.class).select(null);
		for (Professor p : list) {
			System.out.println(p);
		}
		
		System.out.println("101 학과 교수 정보 조회하기");
		map.clear();
		map.put("deptno", 101);
		list = session.getMapper(ProfessorMapper.class).select(map);
		for (Professor p : list) {
			System.out.println(p);
		}
		
		System.out.println("교수 번호가 1001번인 교수 정보 조회하기");
		map.clear();
		map.put("no", 1001);
		list = session.getMapper(ProfessorMapper.class).select(map);
		for (Professor p : list) {
			System.out.println(p);
		}
		
		System.out.println("101 학과의 정교수 정보 조회하기");
		map.clear();
		map.put("deptno", 101);
		map.put("position", "정교수");
		list = session.getMapper(ProfessorMapper.class).select(map);
		for (Professor p : list) {
			System.out.println(p);
		}
		
		System.out.println("정교수 정보 조회하기");
		map.clear();
		map.put("position", "정교수");		
		list = session.getMapper(ProfessorMapper.class).select(map);
		for (Professor p : list) {
			System.out.println(p);
		}
		
		System.out.println("101, 201 학과 교수 정보 조회하기");
		List<Integer> plist = Arrays.asList(101,201);
		map.clear();
		map.put("column", "deptno");
		map.put("datas", plist);
		list = session.getMapper(ProfessorMapper.class).select(map);
		for (Professor p : list) {
			System.out.println(p);
		}
		
		System.out.println("101, 201 학과 조교수 정보 조회하기");
		map.clear();
		map.put("column", "deptno");
		map.put("datas", plist);
		map.put("position", "조교수");
		list = session.getMapper(ProfessorMapper.class).select(map);
		for (Professor p : list) {
			System.out.println(p);
		}
	}
}
