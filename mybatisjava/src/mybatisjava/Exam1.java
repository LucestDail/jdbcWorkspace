package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//�л� ���̺��� ��ϵ� ���ڵ��� �Ǽ��� ����ϱ�
public class Exam1 {
	public static void main(String[] args) {
		//�⺻ ����
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			e.printStackTrace();
		}
		SqlSession session = sqlMap.openSession();
		
		
		int x = (Integer)session.selectOne("student.count");
		System.out.println("student ���̺��� ���ڵ� ���� : " + x);
		
		System.out.println("student ���̺��� ���� ==========");
		List<Student> list = session.selectList("student.list");
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("student grade = 1�� ���� ==========");
		list = session.selectList("student.selectgrade",1);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("student name length = 2�� ���� ==========");
		list = session.selectList("student.selectnamelength","__");
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("student grade = 3 , female�� ���� ==========");
		Map<String, Object> map = new HashMap<>();
		map.put("grade",3);
		map.put("gender",2);
		list = session.selectList("student.selectgradegender",map);
		for(Student s : list) {
			System.out.println(s);
		}
	}

}
