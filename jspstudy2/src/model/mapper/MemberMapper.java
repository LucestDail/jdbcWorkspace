package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert(" insert into Member "+
				" (id, pass, name, gender, email, tel, picture) "+
			" values "+
				" (#{id}, #{pass}, #{name}, #{gender}, #{email}, #{tel}, #{picture}) "
			)
	int insert(Member mem);

	@Select({"<script> ",
			"select",
				" *",
			" from",
				" member ",
			"<trim prefix = 'where' prefixOverrides = 'AND || OR'>",
			"<if test = 'id != null'>",
				"and id = #{id}",
			"</if>",
			"<if test = 'pass != null'> ",
				"and pass = #{pass}",
			"</if>",
			"<if test = 'name != null'> ",
				"and name = #{name}",
			"</if>",
			"<if test = 'gender != null'> ",
				"and gender = #{gender}",
			"</if>",
			"<if test = 'tel != null'> ",
				"and tel = #{tel}",
			"</if>",
			"<if test = 'email != null'> ",
				"and email = #{email}",
			"</if>",
			"<if test = 'picture != null'> ",
				"and picture = #{picture}",
			"</if>",
			"</trim>",
			"</script>"})
	List<Member> select(Map<String, Object> map);

	@Update({"<script> ",
		" update ",
			" member ",
		"<trim prefix = 'set' prefixOverrides = ','>",
		"<if test = 'name != null'> ",
			", pass = #{pass}",
		"</if>",
		"<if test = 'name != null'> ",
			", name = #{name}",
		"</if>",
		"<if test = 'gender != null'> ",
			", gender = #{gender}",
		"</if>",
		"<if test = 'tel != null'> ",
			", tel = #{tel}",
		"</if>",
		"<if test = 'email != null'> ",
			", email = #{email}",
		"</if>",
		"<if test = 'picture != null'> ",
			", picture = #{picture}",
		"</if>",
		"</trim>",
		" where ",
			" id = #{id} ",
		"</script>"})
	int update(Member mem);
	
	@Delete(" delete from "+
				" member "+
			" where "+
				" id = #{id}")
	int delete(String id);

	@Update("update member set pass = #{pass} where id = #{id}")
	int updatePass(@Param("id") String id,@Param("pass") String pass);
	
	
}
