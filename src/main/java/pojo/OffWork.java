package pojo;

import lombok.Data;

import java.util.Date;

/**
 * @author sunwanghe
 * @date 2019/5/5 9:59
 */
@Data
public class OffWork {
    private String workId;
    private String name;
    private String type;
    private Date startdate;
    private Date enddate;
    private double times;
    private String description;
    private String status;
}
