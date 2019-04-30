package pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author Kayll
 * @date 2018/11/8 15:31
 */
@Data
public class Appeal {
    private String workId;
    private String date;
    private String name;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String notAgreeDate;
    @NotNull
    private String reason;
    @NotNull
    private String zhengming;
    @NotNull
    private String type;
    @NotNull
    @Size(min = 10,max = 250)
    private String others;
    private String status;

}
