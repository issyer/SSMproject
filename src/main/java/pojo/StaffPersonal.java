package pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;

/**
 * @author Kayll
 * @date 2018/10/29 15:41
 */
@Data
public class StaffPersonal {
    private String workId;
    @NotNull
    private String name;
    @NotNull
    private String age;
    @NotNull
    private String sex;
    @NotNull
    private String tel;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private String birth;
    @NotNull
    private String college;
    @NotNull
    private String profession;
    @NotNull
    private String address;
    private String photo;
    @NotNull
    private String nation;
    @NotNull
    private String politicalStatus;
    private String idcardNum;

}
