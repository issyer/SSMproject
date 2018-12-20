package pojo;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author Kayll
 * @date 2018/11/8 15:31
 */
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

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNotAgreeDate() {
        return notAgreeDate;
    }

    public void setNotAgreeDate(String notAgreeDate) {
        this.notAgreeDate = notAgreeDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getZhengming() {
        return zhengming;
    }

    public void setZhengming(String zhengming) {
        this.zhengming = zhengming;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
