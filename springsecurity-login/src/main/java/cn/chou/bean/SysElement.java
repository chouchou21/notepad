package cn.chou.bean;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class SysElement {
    private Integer elementId;
    private String elementCode;
    private String elementLabel;
    private String elementUri;
    private String elementIcon;
    private Integer parentid;
    private Integer seqno;
    private Boolean elementType;
    private Boolean enabled;
//    private SysElement parent;
    private List<SysElement> children;
    /*
    public SysElement(Integer elementId, String elementCode, String elementLabel, String elementUri, String elementIcon,
            Integer parentid, Integer seqno, Boolean elementType, Boolean enabled) {
        super();
        this.elementId = elementId;
        this.elementCode = elementCode;
        this.elementLabel = elementLabel;
        this.elementUri = elementUri;
        this.elementIcon = elementIcon;
        this.parentid = parentid;
        this.seqno = seqno;
        this.elementType = elementType;
        this.enabled = enabled;
//        this.children = children;
    }

    public SysElement(Integer elementId, String elementCode, String elementLabel, Integer parentid) {
        super();
        this.elementId = elementId;
        this.elementCode = elementCode;
        this.elementLabel = elementLabel;
        this.elementUri = "/";
        this.elementIcon = "";
        this.parentid = parentid;
        this.seqno = 0;
        this.elementType = true;
        this.enabled = true;
//        this.children = children;
    }
    */
    public Integer getElementId() {
        return elementId;
    }
    public void setElementId(Integer elementId) {
        this.elementId = elementId;
    }
    public String getElementCode() {
        return elementCode;
    }
    public void setElementCode(String elementCode) {
        this.elementCode = elementCode;
    }
    public String getElementLabel() {
        return elementLabel;
    }
    public void setElementLabel(String elementLabel) {
        this.elementLabel = elementLabel;
    }
    @JsonIgnore
    public String getElementUri() {
        return elementUri;
    }
    public void setElementUri(String elementUri) {
        this.elementUri = elementUri;
    }
    public String getElementIcon() {
        return elementIcon;
    }
    public void setElementIcon(String elementIcon) {
        this.elementIcon = elementIcon;
    }
    @JsonIgnore
    public Integer getParentid() {
        return parentid;
    }
    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }
    public Integer getSeqno() {
        return seqno;
    }
    public void setSeqno(Integer seqno) {
        this.seqno = seqno;
    }
    public Boolean getElementType() {
        return elementType;
    }
    public void setElementType(Boolean elementType) {
        this.elementType = elementType;
    }
    public Boolean isEnabled() {
        return enabled;
    }
    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
//    public SysElement getParent() {
//        return parent;
//    }
//    public void setParent(SysElement parent) {
//        this.parent = parent;
//    }
    public List<SysElement> getChildren() {
        return children;
    }
    public void setChildren(List<SysElement> children) {
        this.children = children;
    }
}
