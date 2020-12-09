package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import model.Professor;

public interface ProfessorMapper {
	
	@Select({"<script>",
		" select ",
			"count(*) ",
		" from ",
			" board ",
		"<if test = 'col1 != null'>",
			"where ${col1} like '%${find}%'",
		"</if>",
		"<if test = 'col2 != null'>",
			"or ${col2} like '%${find}%'",
		"</if>",
		"<if test = 'col3 != null'>",
			"or ${col3} like '%${find}%'",
		"</if>",
		"</script>"
	})
	int professorCount(Map map);
	
	@Select({"<script> ",
		"select ",
			"* ",
		"from ",
			"board ",
		"<if test = 'col1 != null'>",
			"where ${col1} like '%${find}%'",
		"</if>",
		"<if test = 'col2 != null'>",
			"or ${col2} like '%${find}%'",
		"</if>",
		"<if test = 'col3 != null'>",
			"or ${col3} like '%${find}%'",
		"</if>",
		"<if test = 'num != null'> ",
			"where num = #{num}",
		"</if>",
		"<if test = 'start != null'> ",
			"order by grp desc, grpstep asc limit #{start},#{limit}",
		"</if>",
		"</script>"
		})
	List<Professor> select(Map map);
}
