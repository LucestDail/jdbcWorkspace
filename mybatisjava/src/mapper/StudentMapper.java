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
 * interface ������� Mybatis ����ϱ�
 * 	���� �����̽� : �������̽��� �̸�, mapper.StudentMapper
 * 	id�Ӽ��� : sql ������ �����ϱ� ���� ������ ��
 * 			   �޼ҵ��� �̸����� sql ������ ������.
 * 			   => �޼ҵ� �����ε��� �Ǹ� ����� ���� �߻�
 * 	parameterType : �Ű�����
 * 				=> 2�� �̻��� ���� �Ű������� ó���� ��쿡�� map �� �̿��ϴ���, paramMap �̶�� ������̼� ���
 * 				�Ϲ������� 2���� map, 2�� �Ѿ�� paramMap
 * 	returnType : ��ȯ�Ǵ� ������ ����, ��ü ��ҿ� ���ؼ� ó����
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
