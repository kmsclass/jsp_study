package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.board.Board;

public interface BoardMapper {

	@Select("select ifnull(max(num),0) from board")
	int maxnum();

	String sql = "insert into board "
			+ "(num,writer, pass, title, content,file1,regdate,"
			+ "readcnt, grp, grplevel, grpstep, boardid)"
  + " values (#{num},#{writer}, #{pass},#{title},#{content},#{file1},now(),"
			+ "0, #{grp},#{grplevel},#{grpstep},#{boardid})";
	@Insert(sql)
	int insert(Board board);

	@Select("select count(*) from board where boardid = #{value}")
	int count(String boardid);

	@Select("select * from board where boardid=#{boardid}"
			+ " order by grp desc, grpstep asc limit #{start},#{limit}")
	List<Board> list(Map<String, Object> map);

}
