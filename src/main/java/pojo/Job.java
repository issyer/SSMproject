package pojo;

/**
 * @author Kayll
 * @date 2018/10/29 15:42
 */
public class Job {
    private String jobId;
    private String departmentId;
    private String jobName;
    private String jobHeadId;
    private String jobWork;

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobHeadId() {
        return jobHeadId;
    }

    public void setJobHeadId(String jobHeadId) {
        this.jobHeadId = jobHeadId;
    }

    public String getJobWork() {
        return jobWork;
    }

    public void setJobWork(String jobWork) {
        this.jobWork = jobWork;
    }
}
