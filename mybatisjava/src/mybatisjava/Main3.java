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

public class Main3 {
	private final static String NS = "student.";
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
		System.out.println("�л� ��ü ���ڵ� ��ȸ");
		List<Student> list = session.selectList(NS + "select1");
		for (Student s : list) {
			System.out.println(s);
		}

		System.out.println("1�г� �л� ��ü ���ڵ� ��ȸ");
		Map<String, Object> map = new HashMap<>();
		map.put("grade", 1);
		list = session.selectList(NS + "select1", map);
		for (Student s : list) {
			System.out.println(s);
		}

		System.out.println("�й��� 981213 �л� ���ڵ� ��ȸ");
		map.clear();
		map.put("studno", 981213);
		Student s1 = session.selectOne(NS + "select1", map);
		System.out.println(s1);

		/*
		 * 
		 * �л��� Ű�� 180 �̻��� �л��� ���ڵ� ��ȸ�ϱ�
		 */
		System.out.println("�л��� Ű�� 180 �̻��� �л��� ���ڵ� ��ȸ�ϱ�");
		map.clear();
		map.put("height", 180);
		list = session.selectList(NS + "select1", map);
		for (Student s : list) {
			System.out.println(s);
		}

		/*
		 * 
		 * 1 �г� �л� �� Ű�� 180 �̻��� �л��� ���ڵ� ��ȸ
		 * 
		 */
		System.out.println("1�г� �л��� Ű�� 180 �̻��� �л��� ���ڵ� ��ȸ�ϱ�");
		map.clear();
		map.put("grade",1);
		map.put("height", 180);
		list = session.selectList(NS + "select22", map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("1�г� �л��� Ű�� 180 �̻�, ������ 80�̻��� �л��� ���ڵ� ��ȸ�ϱ�");
		map.clear();
		map.put("grade",1);
		map.put("height", 180);
		map.put("weight", 80);
		list = session.selectList(NS + "select3",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("101, 201, 301 �а� ���� �л��� ���ڵ� ��ȸ�ϱ�");
		List<Integer> mlist = Arrays.asList(101,201,301);
		map.clear();
		map.put("column","major1");
		map.put("datas", mlist);
		list = session.selectList(NS + "select4",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		/*
		 * �л��߿� �����԰� 70, 80, 90 �� �л��� ���ڵ� ��ȸ�ϱ�
		 * 
		 */
		System.out.println("�л��߿� �����԰� 75, 80, 90 �� �л��� ���ڵ� ��ȸ�ϱ�");
		mlist = Arrays.asList(75,80,95);
		map.put("column","weight");
		map.put("datas", mlist);
		list = session.selectList(NS + "select4",map);
		for (Student s : list) {
			System.out.println(s);
		}
	}

}