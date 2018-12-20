package pojo;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author Kayll
 * @date 2018/10/29 15:41
 */
@Component
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

    public boolean isJobHead() {
        return jobHead;
    }

    public void setJobHead(boolean jobHead) {
        this.jobHead = jobHead;
    }

    public boolean isDepartmentHead() {
        return departmentHead;
    }

    public void setDepartmentHead(boolean departmentHead) {
        this.departmentHead = departmentHead;
    }

    public StaffWork(){}

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getWorkDesk() {
        return workDesk;
    }

    public void setWorkDesk(String workDesk) {
        this.workDesk = workDesk;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(String entryTime) {
        this.entryTime = entryTime;
    }

    public String getPay() {
        return pay;
    }

    public void setPay(String pay) {
        this.pay = pay;
    }

    public String getWorkEmail() {
        return workEmail;
    }

    public void setWorkEmail(String workEmail) {
        this.workEmail = workEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
