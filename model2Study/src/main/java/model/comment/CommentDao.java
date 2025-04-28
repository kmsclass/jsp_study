package model.comment;

import org.apache.ibatis.session.SqlSession;

import model.MybatisConnection;
import model.mapper.CommentMapper;

public class CommentDao {
	private Class<CommentMapper> cls = CommentMapper.class;
	public int maxseq(int num) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxseq();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}

}
