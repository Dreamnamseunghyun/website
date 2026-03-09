package kr.co.dsong.ggsj.reserve.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class DayOffVO extends BaseVO {

    private Integer hospitalId;

    private Integer dayOffId;
    private Integer centerId;
    private Date dayOff;
    private String amPm;
    private String itemIds;
    private String notes;

    private Integer srcCenterId;
    private Integer targetCenterId;
    private String impossible;
}
