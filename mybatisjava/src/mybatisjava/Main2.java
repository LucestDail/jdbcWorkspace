package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main2 {
	private final static String NS = "student.";
	private static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		System.out.println("Student 테이블에 레코드 추가하기");
		Student student = new Student();
		student.setStudno(1003);
		student.setName("홍길동");
		student.setGrade(1);
		student.setId("hongkd1");
		student.setJumin("1234561234567");
		student.setMajor1(101);
		int cnt = session.insert(NS+"insert",student);
		System.out.println("student 레코드 추가 : " + cnt);
		Student dispst = session.selectOne(NS + "selectno",student.getStudno());
		System.out.println(dispst);
		
		/*
		 * 1001 번 학생의 학년을 2학년으로
		 * 몸무게 80, 키 175
		 * 지도교수 1001로 수정하기
		 * 
		 */
		student.setGrade(2);
		student.setWeight(80);
		student.setHeight(175);
		student.setProfno(1001);
		cnt = session.update(NS+"update",student);
		System.out.println("student 테이블의 레코드 수정 : " + cnt);
		dispst = session.selectOne(NS+"selectno",student.getStudno());
		System.out.println(dispst);
//		session.commit();
		System.out.println("1001 학생 삭제");
		cnt = session.delete(NS + "delete",student.getStudno());
		dispst = session.selectOne(NS+"selectno",student.getStudno());
		System.out.println(dispst);
		
		/*
		 * 학년이 2학년 이상인 학생의 정보 출력하기
		 */
		System.out.println("2학년 이상 학생 조회");
		Map<String,Object> map = new HashMap<>();
		map.put("col", "grade");
		map.put("value", 2);
		List<Student> list = session.selectList(NS+"select2",map);
		for(Student s : list) {
			System.out.println(s);
		}
		/*
		 * 키가 180 이상인 학생 정보 출력하기
		 */
		System.out.println("키 180 이상 학생 조회");
		map.clear();
		map.put("col", "height");
		map.put("value", 180);
		list = session.selectList(NS + "select2",map);
		for(Student s : list) {
			System.out.println(s);
		}
	}
}
