package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {
	
	@Insert(" insert into board "+
				" (board_num, member_id, board_notice_able, board_subject, board_content, board_attached_file, board_regdate, board_readcnt, board_type, activity_able, activity_type, give_state, give_type, information_type, give_information_type, area_name, area_xpoint, area_ypoint, area_name_specific, date_start_date, date_end_date, score_category_a, score_category_b, score_category_c, score_category_d, alert_count, recommand_count, not_recommand_count, movie_subject, movie_id) "+
			" values "+
				" (#{board_num}, #{member_id}, #{board_notice_able}, #{board_subject}, #{board_content}, #{board_attached_file}, now(), #{board_readcnt}, #{board_type}, #{activity_able}, #{activity_type}, #{give_state}, #{give_type}, #{information_type}, #{give_information_type}, #{area_name}, #{area_xpoint}, #{area_ypoint}, #{area_name_specific}, #{date_start_date}, #{date_end_date}, #{score_category_a}, #{score_category_b}, #{score_category_c}, #{score_category_d}, #{alert_count}, #{recommand_count}, #{not_recommand_count}, #{movie_subject}, #{movie_id}) "
		)
	int insert(Map map);
	
	@Select(" select "+
				" ifnull(max(board_num),0) "+
			" from "+
				" board ")
	int maxnum(@Param("boardname") String boardname);
	
	@Select({"<script> ",
		"select ",
			" count(*) ",
		" from ",
			" board ",
		"<trim prefix = 'where' prefixOverrides = 'AND || OR'>",
		"<if test = 'board_type != null'> ",
			"and board_type = #{board_type}",
		"</if>",
		"<if test = 'col1 != null'>",
			"intersect select * from board ",
			" where ${col1} like '%${find}%' ",
		"</if>",
		"<if test = 'col2 != null'>",
			" or ${col2} like '%${find}%'",
		"</if>",
		"<if test = 'col3 != null'>",
			" or ${col3} like '%${find}%'",
		"</if>",
		"</trim>",
		"</script>"
		})
	int boardCount(Map map);
	
	
	@Select({"<script> ",
			"select ",
				" * ",
			" from ",
				" board ",
			"<trim prefix = 'where' prefixOverrides = 'AND || OR'>",
			"<if test = 'board_type != null'> ",
				"and board_type = #{board_type}",
			"</if>",
			"<if test = 'board_num != null'> ",
				"and board_num = #{board_num}",
			"</if>",
			"<if test = 'col1 != null'>",
				"intersect select * from board ",
				" where ${col1} like '%${find}%' ",
			"</if>",
			"<if test = 'col2 != null'>",
				" or ${col2} like '%${find}%'",
			"</if>",
			"<if test = 'col3 != null'>",
				" or ${col3} like '%${find}%'",
			"</if>",
			"<if test = 'start != null'> ",
				"order by board_num asc limit ${start},${limit}",
			"</if>",
			"</trim>",
			"</script>"
			})
	List<Board> select(Map map);
	
	@Select({"<script> ",
		"select ",
			" * ",
		"from ",
			" board ",
		"<if test = 'board_type != null'>",
			"where board_type = #{board_type}",
		"</if>",
		"<if test = 'start != null'> ",
			"order by num asc limit ${start},${limit}",
		"</if>",
		"</script>"
		})
	List<Board> selectboardList(Map map);
	
	
	@Update("update board set board_readcnt = (board_readcnt+1) where board_num = #{board_num}")
	void readcntAdd(Map map);


	
	@Update({"<script> ",
		" update ",
			" board ",
		"<trim prefix = 'set' prefixOverrides = ','>",
			", board_regdate = now()",
		"<if test = 'board_notice_able != null'> ",
			", board_notice_able = #{board_notice_able}",
		"</if>",
		"<if test = 'board_subject != null'> ",
			", board_subject = #{board_subject}",
		"</if>",
		"<if test = 'board_content != null'> ",
			", board_content = #{board_content}",
		"</if>",
		"<if test = 'board_attached_file != null'> ",
			", board_attached_file = #{board_attached_file}",
		"</if>",
		"<if test = 'board_ != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",
		"<if test = 'file1 != null'> ",
		", file1 = #{file1}",
		"</if>",

		"</trim>",
		" where ",
			" board_num = ${board_num} ",
		" and ",
			" board_type = ${board_type} ",
		"</script>"})
	int update(Map map);
	
	
	@Delete(" delete from "+
				" board "+
			" where "+
				" board_num = ${board_num} ")
	int delete(Map map);
	
	
	@Select(" select member_id, count(*) cnt from board group by member_id having count(*) >= 1 order by cnt desc")
	List<Map<String, Object>> graph();

}
