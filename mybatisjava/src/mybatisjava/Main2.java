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
		System.out.println("Student ���̺� ���ڵ� �߰��ϱ�");
		Student student = new Student();
		student.setStudno(1003);
		student.setName("ȫ�浿");
		student.setGrade(1);
		student.setId("hongkd1");
		student.setJumin("1234561234567");
		student.setMajor1(101);
		int cnt = session.insert(NS+"insert",student);
		System.out.println("student ���ڵ� �߰� : " + cnt);
		Student dispst = session.selectOne(NS + "selectno",student.getStudno());
		System.out.println(dispst);
		
		/*
		 * 1001 �� �л��� �г��� 2�г�����
		 * ������ 80, Ű 175
		 * �������� 1001�� �����ϱ�
		 * 
		 */
		student.setGrade(2);
		student.setWeight(80);
		student.setHeight(175);
		student.setProfno(1001);
		cnt = session.update(NS+"update",student);
		System.out.println("student ���̺��� ���ڵ� ���� : " + cnt);
		dispst = session.selectOne(NS+"selectno",student.getStudno());
		System.out.println(dispst);
//		session.commit();
		System.out.println("1001 �л� ����");
		cnt = session.delete(NS + "delete",student.getStudno());
		dispst = session.selectOne(NS+"selectno",student.getStudno());
		System.out.println(dispst);
		
		/*
		 * �г��� 2�г� �̻��� �л��� ���� ����ϱ�
		 */
		System.out.println("2�г� �̻� �л� ��ȸ");
		Map<String,Object> map = new HashMap<>();
		map.put("col", "grade");
		map.put("value", 2);
		List<Student> list = session.selectList(NS+"select2",map);
		for(Student s : list) {
			System.out.println(s);
		}
		/*
		 * Ű�� 180 �̻��� �л� ���� ����ϱ�
		 */
		System.out.println("Ű 180 �̻� �л� ��ȸ");
		map.clear();
		map.put("col", "height");
		map.put("value", 180);
		list = session.selectList(NS + "select2",map);
		for(Student s : list) {
			System.out.println(s);
		}
	}
}
