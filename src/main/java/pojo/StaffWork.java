package pojo;

import lombok.Data;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author Kayll
 * @date 2018/10/29 15:41
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
    private boolean jobHead;
    private boolean departmentHead;
}
