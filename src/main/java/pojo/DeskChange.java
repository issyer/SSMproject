package pojo;

import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;

/**
 * @author Kayll
 * @date 2018/11/5 19:32
 */

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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getDeskNow() {
        return deskNow;
    }

    public void setDeskNow(String deskNow) {
        this.deskNow = deskNow;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getDeskWant() {
        return deskWant;
    }

    public void setDeskWant(String deskWant) {
        this.deskWant = deskWant;
    }

    public String getNetOutside() {
        return netOutside;
    }

    public void setNetOutside(String netOutside) {
        this.netOutside = netOutside;
    }

    public String getNetInside() {
        return netInside;
    }

    public void setNetInside(String netInside) {
        this.netInside = netInside;
    }
}
