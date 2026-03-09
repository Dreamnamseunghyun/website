package kr.co.sitebuilder.reserve.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupRegisterVO extends BaseVO {

    private String register;

    private Integer selectACount;
    private Integer selectBCount;
    private Integer selectCCount;
    private Integer selectDCount;
    private Integer selectECount;
    private Integer selectFCount;

    private String selectAMemo;
    private String selectBMemo;
    private String selectCMemo;
    private String selectDMemo;
    private String selectEMemo;
    private String selectFMemo;

    private List<CheckupItemClassVO> checkupItemClasses;

    public String getRegisterName() {
        switch (register) {
            case "1":
                return "湲곕낯??ぉ";
            case "2":
                return "異붽?寃??;
            case "A":
            case "B":
            case "C":
            case "D":
            case "E":
            case "F":
                return "?좏깮" + register;
        }

        return null;
    }

    public Integer getSelectCount() {
        switch (register) {
            case "A":
                return selectACount;
            case "B":
                return selectBCount;
            case "C":
                return selectCCount;
            case "D":
                return selectDCount;
            case "E":
                return selectECount;
            case "F":
                return selectFCount;
        }

        return 0;
    }

    public String getSelectMemo() {
        switch (register) {
            case "A":
                return selectAMemo;
            case "B":
                return selectBMemo;
            case "C":
                return selectCMemo;
            case "D":
                return selectDMemo;
            case "E":
                return selectEMemo;
            case "F":
                return selectFMemo;
        }

        return null;
    }
}
