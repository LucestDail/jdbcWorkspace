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
		//selectOne : 레코드 한 건 조회
		//member.count : select 구문 실행
		x = (Integer)session.selectOne("member.count");
		System.out.println("member 테이블의 레코드 갯수 : " + x);
		//selectList : 레코드 여러건 조회
		System.out.println("member 테이블의 정보 ==========");
		List<Member> list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		
		System.out.println("admin 칼럼 정보 ==========");
		Member member = session.selectOne("member.selectid","admin");
		System.out.println(member);
		
		System.out.println("member 테이블에 이름이 'm' 가진 정보 정보 ==========");
		list = session.selectList("member.selectname","m");
		for(Member m : list) {
			System.out.println(m);
		}
		
		// 2개 이상의 파라매터 전달시
		System.out.println("member 테이블에 이름이 'm' 가진 gender=1 정보 정보 ==========");
		Map<String, Object> map = new HashMap<>();
		map.put("name","%m%");
		map.put("gender",1);
		list = session.selectList("member.selectnamegender",map);
		for(Member m : list) {
			System.out.println(m);
		}
		
		x = (Integer)session.selectOne("member.count2");
		System.out.println("student 테이블의 레코드 갯수 : " + x);
		
	}
}
