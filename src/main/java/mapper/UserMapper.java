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
    public Integer loginCheckByIdcardNum(String idcardnum);

    public String  loginCheckByEmail(String email);

    public StaffWork selectStaffWork(String email);

    public Integer updateStaffPersonal(StaffPersonal staffPersonal);

    public Integer insertDeskChange(DeskChange deskChange);
    public List<DeskChange> selectDeskChange(String workId);
    public List<DeskChange> selectDeskChange2(String workId);

    public Integer insertResign(Resign resign);
    public List<Resign> selectResign(String workId);
    public List<Resign> selectResign2(String workId);

    public Integer insertAppeal(Appeal appeal);
    public List<Appeal> selectAppeal(String workId);
    public List<Appeal> selectAppeal2(String workId);

    public List<Notice> selectNotice();
    public Notice selectNoticeContent(int id);

    public Integer updatePassword(@Param("workId") String workId, @Param("password") String password);
}
