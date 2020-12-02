package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;
/**
 * interface 방식으로 Mybatis 사용하기
 * 	네임 스페이스 : 인터페이스의 이름, mapper.StudentMapper
 * 	id속성값 : sql 구문을 저장하기 위한 고유의 값
 * 			   메소드의 이름으로 sql 구문을 저장함.
 * 			   => 메소드 오버로딩이 되면 실행시 오류 발생
 * 	parameterType : 매개변수
 * 				=> 2개 이상의 값을 매개변수로 처리할 경우에는 map 을 이용하던가, paramMap 이라는 어노테이션 사용
 * 				일반적으로 2개면 map, 2개 넘어가면 paramMap
 * 	returnType : 반환되는 데이터 형식, 전체 요소에 대해서 처리함
 * @author dhtmd
 *
 */
public interface StudentMapper {
//	@Select("select * from student")
//	@Select("<script> select * from student <if test = 'grade != null'> where grade = #{grade}</if></script>")
	@Select({"<script> ",
		"select * from student ",
			"<if test = 'studno != null'>",
				" where studno = #{studno}",
			"</if>",
			"<if test = 'grade != null'> ",
				"where grade = #{grade}",
			"</if>",
			"<if test = 'name != null'> ",
				"where name = #{name}",
			"</if>",
		"</script>"})
	List<Student> select(Map map);

	@Insert("insert into "+
			" student (studno, name, jumin, id) "+
			" values "+
				" (#{studno},#{name},#{jumin},#{id})")
	int insert(Student student);
	
	@Update("update student set "+
			" grade = #{grade}, "+
			" weight = #{weight}, "+
			" height = #{height}"+
			" where studno = #{studno}")
	int update(Student student);
	
	@Delete("delete from student "+
			" where studno = #{studno}")
	int delete(int studno);
	
	@Select("select * "+
			" from student "+
			" where major1 = #{major1} "+
			" and grade = #{grade}")
	List<Student> select2(@Param("major1") int major1,@Param("grade") int grade);
}
