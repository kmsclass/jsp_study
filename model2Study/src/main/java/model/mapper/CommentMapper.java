package model.mapper;

import org.apache.ibatis.annotations.Select;

public interface CommentMapper {

	@Select("select ifnull(max(seq),0) from comment where num=${value}")
	int maxseq(int num);

}
