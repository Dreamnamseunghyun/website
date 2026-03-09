package kr.co.sitebuilder.reserve.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.sitebuilder.common.vo.BaseVO;
import kr.co.sitebuilder.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class ReserveVO extends BaseVO {

    private String userType;

    private Integer reservationId;
    private Integer reservationState;
    //private String reservationName;
    @JsonIgnore
    private String reservationNameCrypt;

    private Integer companyId;
    private String companyName;
    private Integer companyCheckupId;
    private Integer checkupYear;
    private Date reserveDateBegin;
    private Date reserveDateEnd;
    private Date checkupDateBegin;
    private Date checkupDateEnd;

    private String companyCheckupTypeCode;
    private String companyCheckupTypeName;
    private Integer typeSelf;
    private Integer typeFamily;
    private Integer typeCopay;

    private Integer checkupContractTypeId;
    private Integer checkupContractSubTypeId;
    private String checkupContractItemMemo;
    private String subTypeName;

    private Integer hospitalId;
    private String hospitalCode;
    private String hospitalName;
    private Integer centerId;
    private String centerCode;
    private String centerName;
    private String hospitalCenterName;
    private Integer preday;

    private Integer canceledUserId;
    private Integer userId;
    private String employeeCode;

    //private String employeeName;
    @JsonIgnore
    private String employeeNameCrypt;

    private String employeeNo;
    private Integer myself;

    //private String familyName;
    @JsonIgnore
    private String familyNameCrypt;

    private Date birth;
    private String sex;
    private String email;
    private String mobile;
    private String zipcode;
    private String address1;
    private String address2;
    private String depart;
    private String title;

    //private String name;
    @JsonIgnore
    private String cancelNameCrypt;

    private Boolean vip;
    private Boolean supportType;
    private Integer specialCheckup;
    private String specialCheckupMemo;
    private String notes;

    private String employeeNotes;
    private String hospitalNotes;
    private String platformNotes;
    private String stateNotes;

    private Integer upgradePay;
    private Integer supportPay;
    private Integer copay;
    private Integer hospitalPay;
    private Integer platformPay;
    private Integer sumItemCopay;
    private Integer sumItemDiscountBill;

    private Integer discountBill;

    private Date registeredAt;
    private Date desiredAt;
    private String desiredAmpm;
    private String checkupedAmpm;
    private String confirmedAmpm;
    private Date confirmedAt;
    private Date checkupedAt;
    private Date resultedAt;
    private Date canceledAt;
    private Date cancelConfirmedAt;

    private Integer reservationHistoryId;

    private List<CheckupItemVO> checkupItems;

    private List<Integer> selectedItemIds;

    private List<ReserveItemVO> reserveItems;

    private String register;
    private Integer selectStatusDate;

    private Boolean cancelCheck;
    private Boolean notokUrge;

    private String itemIds;
    private String sido;
    private String sigungu;

    //private String centerManagerName;
    @JsonIgnore
    private String centerManagerNameCrypt;

    private Boolean contract;
    private Boolean account;
    private Boolean reserve;

    public List<Integer> getItemIdList() {
        if (StringUtils.isEmpty(itemIds)) {
            return null;
        }
        String[] arrItemId = itemIds.split(",");
        List<Integer> itemIdList = new ArrayList<>();

        for (String itemId : arrItemId) {
            itemIdList.add(Integer.parseInt(itemId.trim()));
        }

        return itemIdList;
    }

    // region reservationName
    public String getReservationName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(reservationNameCrypt);
    }

    public void setReservationName(String reservationName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        reservationNameCrypt = crypto128.encrypt(reservationName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion

    // region employeeName
    public String getEmployeeName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(employeeNameCrypt);
    }

    public void setEmployeeName(String employeeName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        employeeNameCrypt = crypto128.encrypt(employeeName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion

    // region familyName
    public String getFamilyName() throws Exception {
        //log.info("getFamilyName" + familyNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(familyNameCrypt);
    }

    public void setFamilyName(String familyName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        familyNameCrypt = crypto128.encrypt(familyName);
        //log.info("setFamilyName " + familyName + " store " + familyNameStore);
    }
    // endregion

    // region cancelName
    public String getCancelName() throws Exception {
        //log.info("getFamilyName" + familyNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(cancelNameCrypt);
    }

    public void setCancelName(String cancelName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        cancelNameCrypt = crypto128.encrypt(cancelName);
        //log.info("setFamilyName " + familyName + " store " + familyNameStore);
    }
    // endregion

    // region centerManagerName
    public String getCenterManagerName() throws Exception {
        //log.info("getFamilyName" + familyNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(centerManagerNameCrypt);
    }

    public void setCenterManagerName(String centerManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        centerManagerNameCrypt = crypto128.encrypt(centerManagerName);
        //log.info("setFamilyName " + familyName + " store " + familyNameStore);
    }
    // endregion
}
