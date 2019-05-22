package pojo;

import lombok.Data;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;

/**
 * @author Kayll
 * @date 2018/11/5 19:32
 */
@Data
public class DeskChange {

    private String workId;
    @NotNull
    private String deskNow;
    @NotNull
    private String staffName;
    @NotNull
    private String deskWant;
    @NotNull
    private String netOutside;
    @NotNull
    private String netInside;
    private String status;
    private String date;
    private int id;
}
