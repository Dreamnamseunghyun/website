package kr.co.dsong.ggsj.hospital.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class HospitalCheckupVO extends BaseVO {

    private Integer hospitalId;
    private Integer checkupYear;

    private String hospitalName;

    private List<HospitalCheckupItemVO> hospitalCheckupItems;

}
