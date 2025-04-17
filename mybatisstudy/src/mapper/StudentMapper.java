package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import main.Student;

/*
 * 인터페이스 방식으로 Mapper 사용하기
 * 1. mybatis-config.xml 의 mapper에 package로 설정
 * 2. namespace : mapper.StudentMapper. 인터페이스의 전체이름이 namespace임
 * 3. 메서드의 이름의 sql문장의 key값임 => 같은 이름의 메서드 허용안함
 *    => Mapper 인터페이스는 오버로딩불가
 */
public interface StudentMapper {

	@Select("select * from student")
	List<Student> select();

//	@Select("select * from student")  => 오버로딩시 오류 발생. 
//	List<Student> select(int studno);

	@Select("select * from student where grade = #{value}")
	List<Student> selectGrade(int i);
	
	@Select("select * from student where studno = #{value}")
	Student selectStudno(String string);
	/*
	 *  <select id="selectStudno" parameterType="string" resultType="Student">
	 *    select * from student where studno = #{value}
	 *  </select>
	 */

	@Select("select * from student where name=#{value}")
	List<Student> selectName(String string);

	@Select("select * from student where grade=#{grade} and height >= #{height}")
	List<Student> selectGradeHeight(Map<String, Object> map);
    //@Param("grade")int a  : a 변수를 grade key값으로 설정 
	@Select("select * from student where grade=#{grade} and height >= #{height}")
	List<Student> selectGradeHeight2
	            (@Param("grade")int a, @Param("height")int b);

	@Insert("insert into student (studno,name,jumin,id)"
			+ " values (#{studno},#{name},#{jumin},#{id})")
	int insert(Student st);
	@Update("update student "
			+ " set grade=#{grade}, weight=#{weight},height=#{height}"
			+ " where name=#{name}" )
	int update(Student st);

	@Delete("delete from student where name=#{value}")
	int deleteName(String name);
}
