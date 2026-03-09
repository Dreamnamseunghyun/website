package kr.co.dsong.ggsj.commune.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class FaqVO extends BaseVO {

    private Integer faqId;
    private String category;
    private String title;
    private String contents;
    private Date writedAt;

    private Integer firstRecordIndex;
    private Integer recordCountPerPage;
}
