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

public class Main1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			e.printStackTrace();
		}
		int x = 0;
		SqlSession session = sqlMap.openSession();
		//selectOne : ���ڵ� �� �� ��ȸ
		//member.count : select ���� ����
		x = (Integer)session.selectOne("member.count");
		System.out.println("member ���̺��� ���ڵ� ���� : " + x);
		//selectList : ���ڵ� ������ ��ȸ
		System.out.println("member ���̺��� ���� ==========");
		List<Member> list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		
		System.out.println("admin Į�� ���� ==========");
		Member member = session.selectOne("member.selectid","admin");
		System.out.println(member);
		
		System.out.println("member ���̺� �̸��� 'm' ���� ���� ���� ==========");
		list = session.selectList("member.selectname","m");
		for(Member m : list) {
			System.out.println(m);
		}
		
		// 2�� �̻��� �Ķ���� ���޽�
		System.out.println("member ���̺� �̸��� 'm' ���� gender=1 ���� ���� ==========");
		Map<String, Object> map = new HashMap<>();
		map.put("name","%m%");
		map.put("gender",1);
		list = session.selectList("member.selectnamegender",map);
		for(Member m : list) {
			System.out.println(m);
		}
		
		x = (Integer)session.selectOne("member.count2");
		System.out.println("student ���̺��� ���ڵ� ���� : " + x);
		
	}
}
