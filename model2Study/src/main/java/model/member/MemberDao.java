package model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MybatisConnection;
import model.mapper.MemberMapper;

public class MemberDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String,Object> map = new HashMap<>();
	public boolean insert(Member mem) {
		 SqlSession session = MybatisConnection.getConnection();
		 try {
			 if(session.getMapper(cls).insert(mem) > 0) return true;
			 else return false;
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(session);
		 }
		 return false;
	 }
	 public Member selectOne(String id) {
		 SqlSession session  = MybatisConnection.getConnection();
		 try {
			 return session.getMapper(cls).selectOne(id);
		 } catch (Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(session);
		 }
		 return null;		 
	 }
	 public List<Member> list() {
		 SqlSession session = MybatisConnection.getConnection();
		 try {
			 return session.getMapper(cls).selectList(null);
		 } catch (Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(session);
		 }
		 return null;
	 }
		public boolean update(Member mem) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				return session.getMapper(cls).update(mem) > 0;
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return false;
		}
		public boolean delete(String id) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				return session.getMapper(cls).delete(id) > 0;
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return false;
		}
		public String idSearch(String email, String tel) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				return session.getMapper(cls).idSearch(email,tel);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return null;  //레코드 찾기 실패 또는 오류 발생
		}
		public String pwSearch(String id, String email, String tel) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("id", id);
				map.put("email", email);
				return session.getMapper(cls).pwSearch(map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return null;
		}
		public boolean updatePass(String id, String pass) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				return session.getMapper(cls).updatePass(id,pass) > 0;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return false;
		}
		public List<Member> emailList(String[] ids) {
			SqlSession session = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("ids",ids);
				return session.getMapper(cls).selectList(map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(session);
			}
			return null;
		}
}