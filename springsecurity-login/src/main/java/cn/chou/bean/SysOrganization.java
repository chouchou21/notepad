package cn.chou.bean;

import java.util.List;

public class SysOrganization {
    private Integer orgId;
    private String orgCode;
    private String orgName;
    private Integer parentid;
    private Boolean orgStatus;
    private List<SysOrganization> children;

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode == null ? null : orgCode.trim();
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Boolean getOrgStatus() {
        return orgStatus;
    }

    public void setOrgStatus(Boolean orgStatus) {
        this.orgStatus = orgStatus;
    }

    public List<SysOrganization> getChildren() {
        return children;
    }

    public void setChildren(List<SysOrganization> children) {
        this.children = children;
    }

}
