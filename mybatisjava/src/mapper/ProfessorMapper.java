package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import mybatisjava.Professor;

public interface ProfessorMapper {
	
	@Select({"<script> ",
		"select * from professor ",
			"<trim prefix = 'where' prefixOverrides = 'AND || OR'>",
				"<if test = 'no != null'>",
					"and no = #{no}",
				"</if>",
				"<if test = 'name != null'> ",
					"and name = #{name}",
				"</if>",
				"<if test = 'id != null'> ",
					"and id = #{id}",
				"</if>",
				"<if test = 'position != null'> ",
					"and position = #{position}",
				"</if>",
				"<if test = 'salary != null'> ",
					"and salary = #{salary}",
				"</if>",
				"<if test = 'hiredate != null'> ",
					"and hiredate = #{hiredate}",
				"</if>",
				"<if test = 'bonus != null'> ",
					"and bonus = #{bonus}",
				"</if>",
				"<if test = 'deptno != null'> ",
					"and deptno = #{deptno}",
				"</if>",
				"<if test = 'email != null'> ",
					"and email = #{email}",
				"</if>",
				"<if test = 'url != null'> ",
					"and url = #{rul}",
				"</if>",
				"<if test = 'datas != null'> ",
					" and ${column} in\r\n",
					"<foreach collection = 'datas' item = 'd' separator = ',' open = '(' close = ')'>",
						"#{d}",
					"</foreach>",
				"</if>",
			"</trim>",
		"</script>"})
	List<Professor> select(Map map);
}
