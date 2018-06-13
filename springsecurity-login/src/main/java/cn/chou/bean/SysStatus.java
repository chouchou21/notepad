package cn.chou.bean;

public class SysStatus {
    private Long statusId;
    private String tablename;
    private String fieldname;
    private Long statusCode;
    private String statusDesc;
    private Long seqno;
    private String parentFieldname;
    private String parentFieldvalue;
    private boolean enabled;
    
    public Long getStatusId() {
        return statusId;
    }
    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }
    public String getTablename() {
        return tablename;
    }
    public void setTablename(String tablename) {
        this.tablename = tablename;
    }
    public String getFieldname() {
        return fieldname;
    }
    public void setFieldname(String fieldname) {
        this.fieldname = fieldname;
    }
    public Long getStatusCode() {
        return statusCode;
    }
    public void setStatusCode(Long statusCode) {
        this.statusCode = statusCode;
    }
    public String getStatusDesc() {
        return statusDesc;
    }
    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }
    public Long getSeqno() {
        return seqno;
    }
    public void setSeqno(Long seqno) {
        this.seqno = seqno;
    }
    public String getParentFieldname() {
        return parentFieldname;
    }
    public void setParentFieldname(String parentFieldname) {
        this.parentFieldname = parentFieldname;
    }
    public String getParentFieldvalue() {
        return parentFieldvalue;
    }
    public void setParentFieldvalue(String parentFieldvalue) {
        this.parentFieldvalue = parentFieldvalue;
    }
    public boolean isEnabled() {
        return enabled;
    }
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    
}
