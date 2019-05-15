package pojo;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * @author sunwanghe
 * @date 2019/5/15 18:17
 */
@Component
@Data
public class StaffWork {
    private String workId;
    private String name;
    private String sex;
    private String workDesk;
    private String department;
    private String job;
    private String entryTime;
    private String pay;
    private String workEmail;
    private String password;
    private boolean isJobHead;
    private boolean isDepartmentHead;

}
