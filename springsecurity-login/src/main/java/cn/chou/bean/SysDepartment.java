package cn.chou.bean;

public class SysDepartment {
    private Integer deptId;
    private String deptCode;
    private String deptName;
    private Integer orgId;
    private Boolean deptStatus;
//  private SysOrganization organization;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode == null ? null : deptCode.trim();
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public Boolean getDeptStatus() {
        return deptStatus;
    }

    public void setDeptStatus(Boolean deptStatus) {
        this.deptStatus = deptStatus;
    }

//    public SysOrganization getOrganization() {
//        return organization;
//    }
//
//    public void setOrganization(SysOrganization organization) {
//        this.organization = organization;
//    }

}
