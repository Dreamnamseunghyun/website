package kr.co.sitebuilder.common.vo;

import kr.co.sitebuilder.common.ResponseCode;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BaseResponseVO<T> {

    private ResponseCode code = ResponseCode.SUCCESS;
    private String message;
    private T data;

    public BaseResponseVO(T data) {
        this.data = data;
    }

    public BaseResponseVO(T data, ResponseCode code) {
        this.data = data;
        this.code = code;
    }

    public BaseResponseVO(T data, ResponseCode code, String message) {
        this.data = data;
        this.code = code;
        this.message = message;
    }
}
