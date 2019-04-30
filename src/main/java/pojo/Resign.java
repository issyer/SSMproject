package pojo;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author Kayll
 * @date 2018/11/7 20:09
 */
@Data
public class Resign {
    private String workId;
    private String date;
    private String name;
    @NotNull
    private String leaveDate;
    @NotNull
    private String reason;
    @NotNull
    private String tel;
    @NotNull
    private String postAddress;
    private String status;

}
