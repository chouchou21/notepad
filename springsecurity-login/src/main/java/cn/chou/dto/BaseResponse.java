package cn.chou.dto;

public class BaseResponse {

    private Object content;

    public BaseResponse(Object content) {
        this.content = content;
    }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }
}
