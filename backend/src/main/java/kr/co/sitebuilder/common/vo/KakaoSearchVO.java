package kr.co.sitebuilder.common.vo;

import lombok.Data;

import java.util.List;

@Data
public class KakaoSearchVO {

    private List<Document> documents;
    private String errorType;
    private String message;

    @Data
    public static class Document {
        private String address_name;
        private String address_type;
        private Double x;
        private Double y;
    }
}
