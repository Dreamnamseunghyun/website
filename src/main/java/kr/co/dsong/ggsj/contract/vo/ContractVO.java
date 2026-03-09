package kr.co.dsong.ggsj.contract.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class ContractVO extends BaseVO {

    // Company Table
    private Integer companyId;
    private String companyCode;
    private String companyName;

    // Company Checkup Table
    private Integer companyCheckupId;
    private Integer checkupYear;

    // Checkup Contract Table
    private Integer checkupContractId;
    private Integer hospitalId;
    private Integer centerId;

    // Hospital Center View
    private String hospitalCenterName;

    // ContractType VO
    private List<ContractTypeVO> contractTypes;
}
