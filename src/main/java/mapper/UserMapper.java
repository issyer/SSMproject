package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import pojo.*;

import java.util.List;
import java.util.Map;

/**
 * @author Kayll
 * @date 2018/10/29 14:45
 */
@Repository
public interface UserMapper {
    Integer loginCheckByIdcardNum(String idcardnum);
    String  loginCheckByEmail(String email);

    StaffWork selectStaffWork(String email);
    List<StaffWork> selectStaffWork2();
    int insertStaffWork(StaffWork staffWork);

    Integer updateStaffPersonal(StaffPersonal staffPersonal);
    Integer updateStaffPersonalWorkId();
    List<StaffPersonal> selectStaffPersonal();

    Integer insertDeskChange(DeskChange deskChange);
    List<DeskChange> selectDeskChange(String workId);
    List<DeskChange> selectDeskChange2(String workId);

    Integer insertResign(Resign resign);
    List<Resign> selectResign(String workId);
    List<Resign> selectResign2(String workId);

    Integer insertAppeal(Appeal appeal);
    List<Appeal> selectAppeal(String workId);
    List<Appeal> selectAppeal2(String workId);

    List<Notice> selectNotice();
    Notice selectNoticeContent(int id);

    Integer updatePassword(@Param("workId") String workId, @Param("password") String password);

    Integer updateDeskChange(@Param("applyresult") String applyresult, @Param("id")int id);
    Integer updateResign(@Param("applyresult") String applyresult, @Param("workId")String workId);
    Integer updateWorkday(@Param("applyresult") String applyresult, @Param("id")int id);
    Integer updateStaffWorkPower(@Param("workId") String workId, @Param("jobhead")int jobhead,@Param("departmenthead")int departmenthead, @Param("hr")int hr);
}
