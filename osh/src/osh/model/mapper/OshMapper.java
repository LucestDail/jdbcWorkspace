package osh.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import osh.model.Osh;

public interface OshMapper {
	
	@Select({"<script>",
		" select ",
			"count(*) ",
		" from ",
			" professor ",
		"<if test = 'col1 != null'>",
			"where ${col1} like '%${find}%'",
		"</if>",
		"<if test = 'col2 != null'>",
			"or ${col2} like '%${find}%'",
		"</if>",
		"</script>"
	})
	int Count(Map map);
	
	@Select({"<script> ",
		"select ",
			"* ",
		"from ",
			"professor ",
		"<if test = 'col1 != null'>",
			"where ${col1} like '%${find}%'",
		"</if>",
		"<if test = 'col2 != null'>",
			"or ${col2} like '%${find}%'",
		"</if>",
		"</script>"
		})
	List<Osh> select(Map map);
}
