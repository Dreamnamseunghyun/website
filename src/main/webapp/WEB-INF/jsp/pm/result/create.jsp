<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--@elvariable id="sessionLoginName" type="java.lang.String"--%>

<!DOCTYPE html>
<html lang="ko">

<%@include file="/WEB-INF/jsp/common/head.jsp" %>

<body class="fixed-header dashboard menu-pin menu-behind">
<%@include file="/WEB-INF/jsp/common/nav.jsp" %>

<div class="page-container ">
    <%@include file="/WEB-INF/jsp/common/header.jsp" %>

    <div class="page-content-wrapper ">
        <div class="content sm-gutter">
            <div class=" container-fluid  padding-30 sm-padding-10 container-fixed-lg bg-white">
                <div class="card card-transparent board_internal">
                    <div class="card-header ">
                        <div class="card-title">
                            <h3 class="h3">결과등록</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box2" style="width:370px; margin-right:0;">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-4 tag-name"><span
                                                        class="icon-area"></span><span>병원명</span></div>
                                                <div class="col-lg-8" id="hospitalId" data-ggsj="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2" style="width:370px">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-4 tag-name"><span
                                                        class="icon-area"></span><span>대상년도</span></div>
                                                <div class="col-lg-8" id="selectCheckupYear"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12" id="btnSampleDown" data-ggsj="dxButton"
                                                 style="height:34px!important;">
                                                <i class="xi-file-download"></i>Excel 샘플 파일 받기
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-6">
                                                <div id="fileName" data-ggsj="dxTextBox"></div>
                                            </div>
                                            <div class="col-lg-6 btn-margin"
                                                 style="width:calc(50% - 5px)!important; flex:none;">
                                                <div class="col-lg-6" style="border-right:0!important">
                                                    <div id="btnExcelApply" data-ggsj="dxButton"></div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div id="btnExcelDelete" data-ggsj="dxButton"></div>
                                                </div>
                                                <form id="formAttach" style="display:none">
                                                    <input style="display: none" id="openFile" name="openFile"
                                                           type="file">
                                                </form>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="row-wrap-box">
                            <div id="dataGridUnregisteredResult" class="sub_table" data-ggsj="dxDataGrid">
                            </div>
                        </div>
                        <div id="popupReview" data-ggsj="dxPopup"></div>


                        <div class="row btn_area index_btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"></div>
                        </div>


                        <%--                    </div>--%>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('result');

        let dxInstances = ggsj.createDx(false);

        let dsHospital = [];
        let dsCompany = [];
        let inputOpenFile = $('#openFile');

        let dsResultList;

        let resultItem = [];
        let resultItemValue = [];
        let employeeCodes = [];

        let count;

        function exportExcelContractCheckupSample() {
            let workbook = new ExcelJS.Workbook();
            let worksheet = workbook.addWorksheet('Sheet1');

            worksheet.getColumn(5).width = 15;
            worksheet.getColumn(7).width = 15;

            worksheet.getCell('A3').value = '기업체코드';
            worksheet.getCell('B3').value = '병원코드';
            worksheet.getCell('C3').value = '센터코드';
            worksheet.getCell('D3').value = '검진자명';
            worksheet.getCell('E3').value = '생년월일(8자리)';
            worksheet.getCell('F3').value = '성별';
            worksheet.getCell('G3').value = 'ID';
            worksheet.getCell('H3').value = '종합소견';

            worksheet.getCell('I1').value = 'B010011';
            worksheet.getCell('I2').value = '신체계측 및 혈압';
            worksheet.getCell('I3').value = '신장';

            worksheet.getCell('J1').value = 'B010012';
            worksheet.getCell('J2').value = '신체계측 및 혈압';
            worksheet.getCell('J3').value = '체중';

            worksheet.getCell('K1').value = 'B010013';
            worksheet.getCell('K2').value = '신체계측 및 혈압';
            worksheet.getCell('K3').value = '비만도(BMI)';

            worksheet.getCell('L1').value = 'B010014';
            worksheet.getCell('L2').value = '신체계측 및 혈압';
            worksheet.getCell('L3').value = '허리둘레';

            worksheet.getCell('M1').value = 'B010021';
            worksheet.getCell('M2').value = '신체계측 및 혈압';
            worksheet.getCell('M3').value = '수축기혈압';

            worksheet.getCell('N1').value = 'B010022';
            worksheet.getCell('N2').value = '신체계측 및 혈압';
            worksheet.getCell('N3').value = '이완기혈압';

            worksheet.getCell('O1').value = 'B030021';
            worksheet.getCell('O2').value = '청력검사';
            worksheet.getCell('O3').value = '500(좌)';

            worksheet.getCell('P1').value = 'B030022';
            worksheet.getCell('P2').value = '청력검사';
            worksheet.getCell('P3').value = '500(우)';

            worksheet.getCell('Q1').value = 'B030023';
            worksheet.getCell('Q2').value = '청력검사';
            worksheet.getCell('Q3').value = '1000(좌)';

            worksheet.getCell('R1').value = 'B030024';
            worksheet.getCell('R2').value = '청력검사';
            worksheet.getCell('R3').value = '1000(우)';

            worksheet.getCell('S1').value = 'B030025';
            worksheet.getCell('S2').value = '청력검사';
            worksheet.getCell('S3').value = '2000(좌)';

            worksheet.getCell('T1').value = 'B030026';
            worksheet.getCell('T2').value = '청력검사';
            worksheet.getCell('T3').value = '2000(우)';

            worksheet.getCell('U1').value = 'B030027';
            worksheet.getCell('U2').value = '청력검사';
            worksheet.getCell('U3').value = '4000(좌)';

            worksheet.getCell('V1').value = 'B030028';
            worksheet.getCell('V2').value = '청력검사';
            worksheet.getCell('V3').value = '4000(우)';

            worksheet.getCell('W1').value = 'B040021';
            worksheet.getCell('W2').value = '안과검사';
            worksheet.getCell('W3').value = '시력(좌)';

            worksheet.getCell('X1').value = 'B040022';
            worksheet.getCell('X2').value = '안과검사';
            worksheet.getCell('X3').value = '시력(우)';

            worksheet.getCell('Y1').value = 'B040023';
            worksheet.getCell('Y2').value = '안과검사';
            worksheet.getCell('Y3').value = '교정시력(좌)';

            worksheet.getCell('Z1').value = 'B040024';
            worksheet.getCell('Z2').value = '안과검사';
            worksheet.getCell('Z3').value = '교정시력(우)';

            worksheet.getCell('AA1').value = 'B040031';
            worksheet.getCell('AA2').value = '안과검사';
            worksheet.getCell('AA3').value = '안압(좌)';

            worksheet.getCell('AB1').value = 'B040032';
            worksheet.getCell('AB2').value = '안과검사';
            worksheet.getCell('AB3').value = '안압(우)';

            worksheet.getCell('AC1').value = 'B040041';
            worksheet.getCell('AC2').value = '안과검사';
            worksheet.getCell('AC3').value = '안저(좌)';

            worksheet.getCell('AD1').value = 'B040042';
            worksheet.getCell('AD2').value = '안과검사';
            worksheet.getCell('AD3').value = '안저(우)';

            worksheet.getCell('AE1').value = 'C01001';
            worksheet.getCell('AE2').value = '간기능 검사';
            worksheet.getCell('AE3').value = '총단백(Total protein)';

            worksheet.getCell('AF1').value = 'C01002';
            worksheet.getCell('AF2').value = '간기능 검사';
            worksheet.getCell('AF3').value = '알부민(Albumin)';

            worksheet.getCell('AG1').value = 'C01003';
            worksheet.getCell('AG2').value = '간기능 검사';
            worksheet.getCell('AG3').value = '글로블린(Globulin)';

            worksheet.getCell('AH1').value = 'C01004';
            worksheet.getCell('AH2').value = '간기능 검사';
            worksheet.getCell('AH3').value = 'A/G비율(albumin:globilin ratio)';

            worksheet.getCell('AI1').value = 'C01005';
            worksheet.getCell('AI2').value = '간기능 검사';
            worksheet.getCell('AI3').value = 'AST(SGOT)';

            worksheet.getCell('AJ1').value = 'C01006';
            worksheet.getCell('AJ2').value = '간기능 검사';
            worksheet.getCell('AJ3').value = 'ALT(SGPT)';

            worksheet.getCell('AK1').value = 'C01007';
            worksheet.getCell('AK2').value = '간기능 검사';
            worksheet.getCell('AK3').value = '감마지티피(γ-GTP)';

            worksheet.getCell('AL1').value = 'C01008';
            worksheet.getCell('AL2').value = '간기능 검사';
            worksheet.getCell('AL3').value = '총빌리루빈(Total bilirubin)';

            worksheet.getCell('AM1').value = 'C01009';
            worksheet.getCell('AM2').value = '간기능 검사';
            worksheet.getCell('AM3').value = '직접빌리루빈(Direct bilirubin)';

            worksheet.getCell('AN1').value = 'C01010';
            worksheet.getCell('AN2').value = '간기능 검사';
            worksheet.getCell('AN3').value = '간접빌리루빈(Indirect bilirubin)';

            worksheet.getCell('AO1').value = 'C01011';
            worksheet.getCell('AO2').value = '간기능 검사';
            worksheet.getCell('AO3').value = '알칼리포스파타제(ALP)';

            worksheet.getCell('AP1').value = 'C01012';
            worksheet.getCell('AP2').value = '간기능 검사';
            worksheet.getCell('AP3').value = '유산탈수소효소(LDH)';

            worksheet.getCell('AQ1').value = 'C02001';
            worksheet.getCell('AQ2').value = '간기능 검사';
            worksheet.getCell('AQ3').value = 'A형 항체 형성여부(HAV IgG)';

            worksheet.getCell('AR1').value = 'C02002';
            worksheet.getCell('AR2').value = '간기능 검사';
            worksheet.getCell('AR3').value = 'A형간염표면항체(HAV IgM)';

            worksheet.getCell('AS1').value = 'C02005';
            worksheet.getCell('AS2').value = '간기능 검사';
            worksheet.getCell('AS3').value = 'B형간염항원(HBsAg)';

            worksheet.getCell('AT1').value = 'C02006';
            worksheet.getCell('AT2').value = '간기능 검사';
            worksheet.getCell('AT3').value = 'B형간염항체(HBsAb)';

            worksheet.getCell('AU1').value = 'C02007';
            worksheet.getCell('AU2').value = '간기능 검사';
            worksheet.getCell('AU3').value = 'B형간염활동성및전염성여부(HBeAg)';

            worksheet.getCell('AV1').value = 'C02008';
            worksheet.getCell('AV2').value = '간기능 검사';
            worksheet.getCell('AV3').value = 'B형간염활동성및전염성여부(HBeAb)';

            worksheet.getCell('AW1').value = 'C02009';
            worksheet.getCell('AW2').value = '간기능 검사';
            worksheet.getCell('AW3').value = 'C형간염항체(HCVAb)';

            worksheet.getCell('AX1').value = 'C03001';
            worksheet.getCell('AX2').value = '신장기능검사';
            worksheet.getCell('AX3').value = '요소질소(BUN)';

            worksheet.getCell('AY1').value = 'C03002';
            worksheet.getCell('AY2').value = '신장기능검사';
            worksheet.getCell('AY3').value = '크레아티닌(Creatinin)';

            worksheet.getCell('AZ1').value = 'C03003';
            worksheet.getCell('AZ2').value = '신장기능검사';
            worksheet.getCell('AZ3').value = 'B/C비율';

            worksheet.getCell('BA1').value = 'C03004';
            worksheet.getCell('BA2').value = '신장기능검사';
            worksheet.getCell('BA3').value = '신사구체여과율(GFR)';

            worksheet.getCell('BB1').value = 'C04001';
            worksheet.getCell('BB2').value = '당뇨검사';
            worksheet.getCell('BB3').value = '공복시혈당(FBS=Glucose)';

            worksheet.getCell('BC1').value = 'C04002';
            worksheet.getCell('BC2').value = '당뇨검사';
            worksheet.getCell('BC3').value = '당화혈색소(HbA1c)';

            worksheet.getCell('BD1').value = 'C04004';
            worksheet.getCell('BD2').value = '당뇨검사';
            worksheet.getCell('BD3').value = 'Insulin';

            worksheet.getCell('BE1').value = 'C05001';
            worksheet.getCell('BE2').value = '췌장기능검사';
            worksheet.getCell('BE3').value = '리파아제(Lipase)';

            worksheet.getCell('BF1').value = 'C05002';
            worksheet.getCell('BF2').value = '췌장기능검사';
            worksheet.getCell('BF3').value = '아밀라제(Amylase)';

            worksheet.getCell('BG1').value = 'C06001';
            worksheet.getCell('BG2').value = '지질 및 심혈관계검사';
            worksheet.getCell('BG3').value = '총콜레스테롤';

            worksheet.getCell('BH1').value = 'C06002';
            worksheet.getCell('BH2').value = '지질 및 심혈관계검사';
            worksheet.getCell('BH3').value = '고밀도 콜레스테롤(HDL-콜레스테롤)';

            worksheet.getCell('BI1').value = 'C06003';
            worksheet.getCell('BI2').value = '지질 및 심혈관계검사';
            worksheet.getCell('BI3').value = '저밀도 콜레스테롤(LDL-콜레스테롤)';

            worksheet.getCell('BJ1').value = 'C06004';
            worksheet.getCell('BJ2').value = '지질 및 심혈관계검사';
            worksheet.getCell('BJ3').value = '중성지방(Triglyceride)';

            worksheet.getCell('BK1').value = 'C06005';
            worksheet.getCell('BK2').value = '지질 및 심혈관계검사';
            worksheet.getCell('BK3').value = '크레아티닌키나제(CPK)';

            worksheet.getCell('BL1').value = 'C06006';
            worksheet.getCell('BL2').value = '지질 및 심혈관계검사';
            worksheet.getCell('BL3').value = '심장병위험인자(CRF)';

            worksheet.getCell('BM1').value = 'C06008';
            worksheet.getCell('BM2').value = '지질 및 심혈관계검사';
            worksheet.getCell('BM3').value = '호모시스테인(Homocysteine)';

            worksheet.getCell('BN1').value = 'C070011';
            worksheet.getCell('BN2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BN3').value = '적혈구(RBC)';

            worksheet.getCell('BO1').value = 'C070012';
            worksheet.getCell('BO2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BO3').value = '혈색소(Hb)';

            worksheet.getCell('BP1').value = 'C070013';
            worksheet.getCell('BP2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BP3').value = '적혈구용적(Hct)';

            worksheet.getCell('BQ1').value = 'C070014';
            worksheet.getCell('BQ2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BQ3').value = '평균적혈구용적(MCV)';

            worksheet.getCell('BR1').value = 'C070015';
            worksheet.getCell('BR2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BR3').value = '평균적혈구혈색소량(MCH)';

            worksheet.getCell('BS1').value = 'C070016';
            worksheet.getCell('BS2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BS3').value = '평균적혈구혈색소농도(MCHC)';

            worksheet.getCell('BT1').value = 'C070017';
            worksheet.getCell('BT2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BT3').value = '적혈구분포계수(RDW)';

            worksheet.getCell('BU1').value = 'C070018';
            worksheet.getCell('BU2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BU3').value = '혈소판수(PLT)';

            worksheet.getCell('BV1').value = 'C070019';
            worksheet.getCell('BV2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BV3').value = '혈소판백분율(PCT)';

            worksheet.getCell('BW1').value = 'C0700110';
            worksheet.getCell('BW2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BW3').value = '평균혈소판용적(MPV)';

            worksheet.getCell('BX1').value = 'C0700111';
            worksheet.getCell('BX2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BX3').value = '혈소판분포폭(PDW)';

            worksheet.getCell('BY1').value = 'C0700112';
            worksheet.getCell('BY2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BY3').value = '백혈구(WBC)';

            worksheet.getCell('BZ1').value = 'C0700113';
            worksheet.getCell('BZ2').value = '일반혈액검사(CBC)';
            worksheet.getCell('BZ3').value = '분획호중구(Seg.Neutrophil)';

            worksheet.getCell('CA1').value = 'C0700114';
            worksheet.getCell('CA2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CA3').value = '봉상호중구(Band neutrophil)';

            worksheet.getCell('CB1').value = 'C0700115';
            worksheet.getCell('CB2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CB3').value = '림프구(Lymphocyte)';

            worksheet.getCell('CC1').value = 'C0700116';
            worksheet.getCell('CC2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CC3').value = '단핵구(Monocyte)';

            worksheet.getCell('CD1').value = 'C0700117';
            worksheet.getCell('CD2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CD3').value = '호산구(Eosinophile)';

            worksheet.getCell('CE1').value = 'C0700118';
            worksheet.getCell('CE2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CE3').value = '염기구(Basophile)';

            worksheet.getCell('CF1').value = 'C0700119';
            worksheet.getCell('CF2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CF3').value = '후골수구(metamyelocyte)';

            worksheet.getCell('CG1').value = 'C0700120';
            worksheet.getCell('CG2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CG3').value = '골수구(myelocyte)';

            worksheet.getCell('CH1').value = 'C0700121';
            worksheet.getCell('CH2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CH3').value = '전골수세포(promyeloyte)';

            worksheet.getCell('CI1').value = 'C0700122';
            worksheet.getCell('CI2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CI3').value = '골수아세포(myeloblast)';

            worksheet.getCell('CJ1').value = 'C0700123';
            worksheet.getCell('CJ2').value = '일반혈액검사(CBC)';
            worksheet.getCell('CJ3').value = '유핵적혈구(nRCBC)';

            worksheet.getCell('CK1').value = 'C11001';
            worksheet.getCell('CK2').value = '철 결핍성 빈혈 관련검사';
            worksheet.getCell('CK3').value = '훼리틴(Ferritin)';

            worksheet.getCell('CL1').value = 'C11002';
            worksheet.getCell('CL2').value = '철 결핍성 빈혈 관련검사';
            worksheet.getCell('CL3').value = '혈청철(Fe)';

            worksheet.getCell('CM1').value = 'C11003';
            worksheet.getCell('CM2').value = '철 결핍성 빈혈 관련검사';
            worksheet.getCell('CM3').value = '총철결합능(TIBC)';

            worksheet.getCell('CN1').value = 'C11004';
            worksheet.getCell('CN2').value = '철 결핍성 빈혈 관련검사';
            worksheet.getCell('CN3').value = '불포화 철결합능(UIBC)';

            worksheet.getCell('CO1').value = 'C12001';
            worksheet.getCell('CO2').value = '갑상선기능검사';
            worksheet.getCell('CO3').value = '갑상선호르몬(T3)';

            worksheet.getCell('CP1').value = 'C12002';
            worksheet.getCell('CP2').value = '갑상선기능검사';
            worksheet.getCell('CP3').value = '갑상선호르몬(T4)';

            worksheet.getCell('CQ1').value = 'C12003';
            worksheet.getCell('CQ2').value = '갑상선기능검사';
            worksheet.getCell('CQ3').value = '갑상선호르몬(Free T3)';

            worksheet.getCell('CR1').value = 'C12004';
            worksheet.getCell('CR2').value = '갑상선기능검사';
            worksheet.getCell('CR3').value = '갑상선호르몬(Free T4)';

            worksheet.getCell('CS1').value = 'C12005';
            worksheet.getCell('CS2').value = '갑상선기능검사';
            worksheet.getCell('CS3').value = '갑상선자극호르몬(TSH)';

            worksheet.getCell('CT1').value = 'C13001';
            worksheet.getCell('CT2').value = '감염검사';
            worksheet.getCell('CT3').value = '헬리코박터 : H.pylori';

            worksheet.getCell('CU1').value = 'C13002';
            worksheet.getCell('CU2').value = '감염검사';
            worksheet.getCell('CU3').value = '매독 : RPR(VDRL)';

            worksheet.getCell('CV1').value = 'C13003';
            worksheet.getCell('CV2').value = '감염검사';
            worksheet.getCell('CV3').value = '매독감작혈구응집 : TPHA';

            worksheet.getCell('CW1').value = 'C14001';
            worksheet.getCell('CW2').value = '통풍 및 염증반응';
            worksheet.getCell('CW3').value = '요산(uric acid)';

            worksheet.getCell('CX1').value = 'C14002';
            worksheet.getCell('CX2').value = '통풍 및 염증반응';
            worksheet.getCell('CX3').value = '류마티스인자(RA Factor, RF)';

            worksheet.getCell('CY1').value = 'C14003';
            worksheet.getCell('CY2').value = '통풍 및 염증반응';
            worksheet.getCell('CY3').value = 'C-반응 단백 (CRP)';

            worksheet.getCell('CZ1').value = 'C14004';
            worksheet.getCell('CZ2').value = '통풍 및 염증반응';
            worksheet.getCell('CZ3').value = '고감도 C-반응 단백 (HS_CRP)';

            worksheet.getCell('DA1').value = 'C15001';
            worksheet.getCell('DA2').value = '전해질검사';
            worksheet.getCell('DA3').value = '나트륨(Na)';

            worksheet.getCell('DB1').value = 'C15002';
            worksheet.getCell('DB2').value = '전해질검사';
            worksheet.getCell('DB3').value = '칼륨(K)';

            worksheet.getCell('DC1').value = 'C15003';
            worksheet.getCell('DC2').value = '전해질검사';
            worksheet.getCell('DC3').value = '염소(Cl)';

            worksheet.getCell('DD1').value = 'C15004';
            worksheet.getCell('DD2').value = '전해질검사';
            worksheet.getCell('DD3').value = '칼슘(Ca)';

            worksheet.getCell('DE1').value = 'C15005';
            worksheet.getCell('DE2').value = '전해질검사';
            worksheet.getCell('DE3').value = '인(P)';

            worksheet.getCell('DF1').value = 'C15006';
            worksheet.getCell('DF2').value = '전해질검사';
            worksheet.getCell('DF3').value = '마그네슘(Mg)';

            worksheet.getCell('DG1').value = 'C15007';
            worksheet.getCell('DG2').value = '전해질검사';
            worksheet.getCell('DG3').value = '아연(Zn)';

            worksheet.getCell('DH1').value = 'C15008';
            worksheet.getCell('DH2').value = '전해질검사';
            worksheet.getCell('DH3').value = '혈중 이산화탄소(CO2)';

            worksheet.getCell('DI1').value = 'C16001';
            worksheet.getCell('DI2').value = '종양표지자검사';
            worksheet.getCell('DI3').value = 'AFP(간암)';

            worksheet.getCell('DJ1').value = 'C16002';
            worksheet.getCell('DJ2').value = '종양표지자검사';
            worksheet.getCell('DJ3').value = 'CEA(대장암)';

            worksheet.getCell('DK1').value = 'C16003';
            worksheet.getCell('DK2').value = '종양표지자검사';
            worksheet.getCell('DK3').value = 'CA19-9 (췌장암)';

            worksheet.getCell('DL1').value = 'C16004';
            worksheet.getCell('DL2').value = '종양표지자검사';
            worksheet.getCell('DL3').value = 'PSA(전립선암)_남';

            worksheet.getCell('DM1').value = 'C16005';
            worksheet.getCell('DM2').value = '종양표지자검사';
            worksheet.getCell('DM3').value = 'CA125(난소/자궁암)_여';

            worksheet.getCell('DN1').value = 'C16006';
            worksheet.getCell('DN2').value = '종양표지자검사';
            worksheet.getCell('DN3').value = 'CA15-3(유방암)_여';

            worksheet.getCell('DO1').value = 'C16007';
            worksheet.getCell('DO2').value = '종양표지자검사';
            worksheet.getCell('DO3').value = 'Cyfra21-1(폐암)';

            worksheet.getCell('DP1').value = 'C16008';
            worksheet.getCell('DP2').value = '종양표지자검사';
            worksheet.getCell('DP3').value = 'NSE(폐암)';

            worksheet.getCell('DQ1').value = 'C16009';
            worksheet.getCell('DQ2').value = '종양표지자검사';
            worksheet.getCell('DQ3').value = 'SCC(폐암,식도암,편평상피암)';

            worksheet.getCell('DR1').value = 'C18002';
            worksheet.getCell('DR2').value = '비타민검사';
            worksheet.getCell('DR3').value = '비타민D(Vit.D)';

            worksheet.getCell('DS1').value = 'D010011';
            worksheet.getCell('DS2').value = '소변검사';
            worksheet.getCell('DS3').value = '요비중(urine S.G)';

            worksheet.getCell('DT1').value = 'D010012';
            worksheet.getCell('DT2').value = '소변검사';
            worksheet.getCell('DT3').value = '요산도(urine pH)';

            worksheet.getCell('DU1').value = 'D010013';
            worksheet.getCell('DU2').value = '소변검사';
            worksheet.getCell('DU3').value = '요백혈구(Urine Leukocytes)';

            worksheet.getCell('DV1').value = 'D010014';
            worksheet.getCell('DV2').value = '소변검사';
            worksheet.getCell('DV3').value = '요아질산염(urine Nitrite)';

            worksheet.getCell('DW1').value = 'D010015';
            worksheet.getCell('DW2').value = '소변검사';
            worksheet.getCell('DW3').value = '요단백(urine protein)';

            worksheet.getCell('DX1').value = 'D010016';
            worksheet.getCell('DX2').value = '소변검사';
            worksheet.getCell('DX3').value = '요당(urine glucose)';

            worksheet.getCell('DY1').value = 'D010017';
            worksheet.getCell('DY2').value = '소변검사';
            worksheet.getCell('DY3').value = '케톤(urine ketone body)';

            worksheet.getCell('DZ1').value = 'D010018';
            worksheet.getCell('DZ2').value = '소변검사';
            worksheet.getCell('DZ3').value = '유로빌리노겐(urobilinogen)';

            worksheet.getCell('EA1').value = 'D010019';
            worksheet.getCell('EA2').value = '소변검사';
            worksheet.getCell('EA3').value = '빌리루빈(bilirubin)';

            worksheet.getCell('EB1').value = 'D0100110';
            worksheet.getCell('EB2').value = '소변검사';
            worksheet.getCell('EB3').value = '요잠혈(urine occult blood)';

            worksheet.getCell('EC1').value = 'D010021';
            worksheet.getCell('EC2').value = '소변검사';
            worksheet.getCell('EC3').value = '요침사백혈구(urine WBC)';

            worksheet.getCell('ED1').value = 'D010022';
            worksheet.getCell('ED2').value = '소변검사';
            worksheet.getCell('ED3').value = '요침사적혈구(urine RBC)';

            worksheet.getCell('EE1').value = 'D010023';
            worksheet.getCell('EE2').value = '소변검사';
            worksheet.getCell('EE3').value = '요침사 현미경검사';

            worksheet.getCell('EF1').value = 'D02001';
            worksheet.getCell('EF2').value = '대변검사';
            worksheet.getCell('EF3').value = '분변잠혈';

            worksheet.getCell('EG1').value = 'D02002';
            worksheet.getCell('EG2').value = '대변검사';
            worksheet.getCell('EG3').value = '분변충란검사(기생충)';

            worksheet.getCell('EH1').value = 'G02001';
            worksheet.getCell('EH2').value = '부인과검사';
            worksheet.getCell('EH3').value = '자궁경부암검사(Papsmear)';

            worksheet.getCell('EI1').value = 'G02002';
            worksheet.getCell('EI2').value = '부인과검사';
            worksheet.getCell('EI3').value = '자궁경부암 액상세포검사(Thin prep)';

            worksheet.getCell('EJ1').value = 'G02003';
            worksheet.getCell('EJ2').value = '부인과검사';
            worksheet.getCell('EJ3').value = '인유두종바이러스검사(HPV)';

            worksheet.getCell('EK1').value = 'E01001';
            worksheet.getCell('EK2').value = '심폐기능검사';
            worksheet.getCell('EK3').value = '심전도 검사';

            worksheet.getCell('EL1').value = 'E01002';
            worksheet.getCell('EL2').value = '심폐기능검사';
            worksheet.getCell('EL3').value = '폐기능 검사';

            worksheet.getCell('EM1').value = 'E01003';
            worksheet.getCell('EM2').value = '심폐기능검사';
            worksheet.getCell('EM3').value = '흉부X-선 촬영';

            worksheet.getCell('EN1').value = 'E02001';
            worksheet.getCell('EN2').value = '유방촬영';
            worksheet.getCell('EN3').value = '유방X-선(Mammography)';

            worksheet.getCell('EO1').value = 'F02001';
            worksheet.getCell('EO2').value = '척추일반촬영';
            worksheet.getCell('EO3').value = '경추X-선촬영';

            worksheet.getCell('EP1').value = 'F02002';
            worksheet.getCell('EP2').value = '척추일반촬영';
            worksheet.getCell('EP3').value = '요추X-선촬영';

            worksheet.getCell('EQ1').value = 'F03001';
            worksheet.getCell('EQ2').value = '동맥경화검사';
            worksheet.getCell('EQ3').value = '동맥경화검사';

            worksheet.getCell('ER1').value = 'F05001';
            worksheet.getCell('ER2').value = '골밀도검사';
            worksheet.getCell('ER3').value = '골밀도검사 (Bone density)';

            worksheet.getCell('ES1').value = 'F06001';
            worksheet.getCell('ES2').value = '위장검사';
            worksheet.getCell('ES3').value = '위내시경(비수면)';

            worksheet.getCell('ET1').value = 'F06002';
            worksheet.getCell('ET2').value = '위장검사';
            worksheet.getCell('ET3').value = '위내시경(수면)';

            worksheet.getCell('EU1').value = 'F06003';
            worksheet.getCell('EU2').value = '위장검사';
            worksheet.getCell('EU3').value = '위장조영촬영';

            worksheet.getCell('EV1').value = 'F07001';
            worksheet.getCell('EV2').value = '대장검사';
            worksheet.getCell('EV3').value = '대장내시경(비수면)';

            worksheet.getCell('EW1').value = 'F07002';
            worksheet.getCell('EW2').value = '대장검사';
            worksheet.getCell('EW3').value = '대장내시경(수면)';

            worksheet.getCell('EX1').value = 'F08001';
            worksheet.getCell('EX2').value = '초음파검사';
            worksheet.getCell('EX3').value = '상복부초음파';

            worksheet.getCell('EY1').value = 'F08004';
            worksheet.getCell('EY2').value = '초음파검사';
            worksheet.getCell('EY3').value = '전립선(남성하복부)초음파';

            worksheet.getCell('EZ1').value = 'F08005';
            worksheet.getCell('EZ2').value = '초음파검사';
            worksheet.getCell('EZ3').value = '경직장(전립선)초음파';

            worksheet.getCell('FA1').value = 'F08006';
            worksheet.getCell('FA2').value = '초음파검사';
            worksheet.getCell('FA3').value = '골반(여성하복부)초음파';

            worksheet.getCell('FB1').value = 'F08007';
            worksheet.getCell('FB2').value = '초음파검사';
            worksheet.getCell('FB3').value = '질초음파(VaginalSono)';

            worksheet.getCell('FC1').value = 'F08008';
            worksheet.getCell('FC2').value = '초음파검사';
            worksheet.getCell('FC3').value = '갑상선초음파';

            worksheet.getCell('FD1').value = 'F08009';
            worksheet.getCell('FD2').value = '초음파검사';
            worksheet.getCell('FD3').value = '경동맥초음파';

            worksheet.getCell('FE1').value = 'F08010';
            worksheet.getCell('FE2').value = '초음파검사';
            worksheet.getCell('FE3').value = '유방초음파(BreastSono)';

            worksheet.getCell('FF1').value = 'F08012';
            worksheet.getCell('FF2').value = '초음파검사';
            worksheet.getCell('FF3').value = '심장초음파';

            worksheet.getCell('FG1').value = 'F09001';
            worksheet.getCell('FG2').value = '뇌CT검사';
            worksheet.getCell('FG3').value = '뇌(머리)CT';

            worksheet.getCell('FH1').value = 'F10001';
            worksheet.getCell('FH2').value = '폐CT검사';
            worksheet.getCell('FH3').value = '흉부(폐)CT';

            worksheet.getCell('FI1').value = 'F11001';
            worksheet.getCell('FI2').value = '척추CT검사';
            worksheet.getCell('FI3').value = '경추(목)CT';

            worksheet.getCell('FJ1').value = 'F11002';
            worksheet.getCell('FJ2').value = '척추CT검사';
            worksheet.getCell('FJ3').value = '요추(허리)CT';

            worksheet.getCell('FK1').value = 'F12001';
            worksheet.getCell('FK2').value = '심장CT검사';
            worksheet.getCell('FK3').value = '심장석회화(칼슘스코어링)CT';

            worksheet.getCell('FL1').value = 'F13001';
            worksheet.getCell('FL2').value = '복부CT검사';
            worksheet.getCell('FL3').value = '복부비만CT';

            worksheet.getCell('FM1').value = 'F16001';
            worksheet.getCell('FM2').value = '뇌MR검사';
            worksheet.getCell('FM3').value = '뇌MRI';

            worksheet.getCell('FN1').value = 'F16002';
            worksheet.getCell('FN2').value = '뇌MR검사';
            worksheet.getCell('FN3').value = '뇌MRI-T2';

            worksheet.getCell('FO1').value = 'F16003';
            worksheet.getCell('FO2').value = '뇌MR검사';
            worksheet.getCell('FO3').value = '뇌혈관MRA';

            worksheet.getCell('FP1').value = 'F16004';
            worksheet.getCell('FP2').value = '뇌MR검사';
            worksheet.getCell('FP3').value = '뇌MRA-T2';

            worksheet.getCell('FQ1').value = 'F16005';
            worksheet.getCell('FQ2').value = '뇌MR검사';
            worksheet.getCell('FQ3').value = '뇌MRI+뇌MRA';

            worksheet.getCell('FR1').value = 'F17001';
            worksheet.getCell('FR2').value = '척추MR검사';
            worksheet.getCell('FR3').value = '경추(목)MRI';

            worksheet.getCell('FS1').value = 'F17002';
            worksheet.getCell('FS2').value = '척추MR검사';
            worksheet.getCell('FS3').value = '경추MRI-T2';

            worksheet.getCell('FT1').value = 'F17003';
            worksheet.getCell('FT2').value = '척추MR검사';
            worksheet.getCell('FT3').value = '요추(허리)MRI';

            worksheet.getCell('FU1').value = 'F17004';
            worksheet.getCell('FU2').value = '척추MR검사';
            worksheet.getCell('FU3').value = '요추MRI-T2';

            worksheet.getCell('FV1').value = 'F18001';
            worksheet.getCell('FV2').value = '관절MR검사';
            worksheet.getCell('FV3').value = '견관절(어깨)MRI (좌, 우 중 한1부위)';

            worksheet.getCell('FW1').value = 'F18002';
            worksheet.getCell('FW2').value = '관절MR검사';
            worksheet.getCell('FW3').value = '족관절(발목)MRI (좌, 우 중 한1부위)';

            worksheet.getCell('FX1').value = 'F18003';
            worksheet.getCell('FX2').value = '관절MR검사';
            worksheet.getCell('FX3').value = '고관절(골반)MRI';

            worksheet.getCell('FY1').value = 'F18004';
            worksheet.getCell('FY2').value = '관절MR검사';
            worksheet.getCell('FY3').value = '수근관절(손목)MRI (좌, 우 중 한1부위)';

            worksheet.getCell('FZ1').value = 'F18005';
            worksheet.getCell('FZ2').value = '관절MR검사';
            worksheet.getCell('FZ3').value = '슬관절(무릎)MRI (좌, 우 중 한1부위)';

            worksheet.getCell('GA1').value = 'F21001';
            worksheet.getCell('GA2').value = 'PET검사';
            worksheet.getCell('GA3').value = '뇌+전신 PET';

            worksheet.getCell('GB1').value = 'F21002';
            worksheet.getCell('GB2').value = 'PET검사';
            worksheet.getCell('GB3').value = '전신 PET(뇌 제외)';

            if (dsResultList.length < 1) {
                console.log('No Data');
                return;
            }

            let itemData;
            for (let idxItem in dsResultList) {
                itemData = [];
                itemData[1] = dsResultList[idxItem].companyCode;
                itemData[2] = dsResultList[idxItem].hospitalCode;
                itemData[3] = dsResultList[idxItem].centerCode;
                itemData[4] = dsResultList[idxItem].employeeName;
                itemData[5] = DevExpress.localization.formatDate(new Date(dsResultList[idxItem].birth), "yyyy-MM-dd");
                itemData[6] = dsResultList[idxItem].sex;
                itemData[7] = dsResultList[idxItem].employeeCode;

                worksheet.addRow(itemData);
            }

            workbook.xlsx.writeBuffer().then(function (buffer) {
                saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
            });
        }

        dxInstances.btnSampleDown.option({
            text: '엑셀샘플파일 다운',
            onClick: function () {
                exportExcelContractCheckupSample();
            }
        });

        dxInstances.selectCheckupYear.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadResultBatch();
            }
        });

        dxInstances.btnExcelDelete.option({
            text: '첨부파일 제거',
            disabled: true,
            onClick: function () {
                inputOpenFile.val('');
                LoadResultBatch(dxInstances.hospitalId.option('value'));
                dxInstances.fileName.option('value', null);
                dxInstances.btnExcelDelete.option({
                    disabled: true,
                });
            }
        });

        function batchResult(checkupResult) {
            let bFind;
            checkupResult._crudType = 'INSERT';
            bFind = !!dsResultList.find(function (result) {
                if (checkupResult.companyCode === result.companyCode && checkupResult.employeeCode === result.employeeCode) {
                    if (result._crudType !== 'INSERT')
                        checkupResult._crudType = 'UPDATE';
                    $.extend(result, checkupResult);
                    return true;
                }
            });
            if (bFind === false) {
                dsResultList.push(checkupResult);
            }
        }

        function parseExcelResult() {
            let files = this.files || [];
            if (!files.length) return;

            let file = files[0];
            let reader = new FileReader();

            if (files.length) {
                dxInstances.fileName.option('value', file.name);
            } else {
                dxInstances.fileName.option('value', null);
            }
            reader.onloadend = function () {
                let arrayBuffer = reader.result;
                let workbook = new ExcelJS.Workbook();

                workbook.xlsx.load(arrayBuffer).then(function (workbook) {
                        let sheet = workbook.worksheets[0];
                        let rowCount = sheet.rowCount;
                        for (let rowNumber = 1; rowNumber <= rowCount; rowNumber++) {
                            let row = sheet.getRow(rowNumber);
                            if (rowNumber < 4) {
                                if (rowNumber === 1) {
                                    for (let i = 9; i < 185; i++) {
                                        let item = {};
                                        item.itemCode = row.getCell(i).value;
                                        resultItem.push(item);
                                    }
                                }
                                if (rowNumber === 2) {
                                    for (let i = 9; i < 185; i++) {
                                        let item = {};
                                        item.itemCategory = row.getCell(i).value;
                                        if (item.itemCategory.richText) {
                                            let test = Object.values(item.itemCategory.richText).map(function (v) {
                                                return v.text;
                                            })
                                            for (let j = 0; j < test.length; j++) {
                                                item.itemCategory = test.join('');
                                            }
                                        }
                                        this.Object.assign(resultItem[i - 9], item);
                                    }
                                }
                                if (rowNumber === 3) {
                                    for (let i = 9; i < 185; i++) {
                                        let item = {};
                                        item.itemName = row.getCell(i).value;
                                        if (item.itemName.richText) {
                                            let test = Object.values(item.itemName.richText).map(function (v) {
                                                return v.text;
                                            })
                                            for (let j = 0; j < test.length; j++) {
                                                item.itemName = test.join('');
                                            }
                                        }
                                        this.Object.assign(resultItem[i - 9], item);
                                    }
                                }
                                continue;
                            }

                            let itemValue = [];
                            itemValue = resultItem;
                            let itemSubValue = [];

                            // 빈 셀을 만나면 중단
                            if (!row.getCell(1).value) {
                                // Check Key Field
                                break;
                            }

                            let resultRow = {};

                            // Key
                            resultRow.companyCode = row.getCell(1).value;
                            resultRow.hospitalCode = row.getCell(2).value;
                            resultRow.centerCode = row.getCell(3).value;
                            resultRow.checkupYear = dxInstances.selectCheckupYear.option('value');

                            if (row.getCell(4).value.richText) {
                                let test = Object.values(row.getCell(4).value.richText).map(function (v) {
                                    return v.text;
                                })
                                resultRow.employeeName = test.join('');
                            } else {
                                resultRow.employeeName = row.getCell(4).value;
                            }

                            resultRow.sex = row.getCell(6).value;
                            resultRow.employeeCode = row.getCell(7).value;

                            if (row.getCell(8).value) {
                                if (row.getCell(8).value.richText) {
                                    let test = Object.values(row.getCell(8).value.richText).map(function (v) {
                                        return v.text;
                                    })
                                    resultRow.review = test.join('');
                                } else {
                                    resultRow.review = row.getCell(8).value;
                                }
                            }

                            resultRow.birth = new Date((row.getCell(5).value).replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));

                            if (isNaN(resultRow.birth)) {
                                resultRow.birth = new Date();
                                resultRow.birth.setUTCFullYear(1900, 0, 1);
                                resultRow.birth.setUTCHours(1, 0, 0);
                            }
                            batchResult(resultRow);

                            for (let i = 9; i < 185; i++) {
                                let item = {};
                                item.employeeCode = row.getCell(7).value;
                                item.resultValue = row.getCell(i).value;
                                if (item.resultValue !== null && item.resultValue.richText) {
                                    let test = Object.values(item.resultValue.richText).map(function (v) {
                                        return v.text;
                                    })
                                    for (let j = 0; j < test.length; j++) {
                                        item.resultValue = test.join('');
                                    }
                                }
                                itemSubValue.push(Object.assign({}, itemValue[i - 9], item));
                            }
                            resultItemValue.push(itemSubValue);

                            count += 1;
                        }
                        dxInstances.dataGridUnregisteredResult.option({
                            dataSource: dsResultList,
                        });
                    }
                );
            };
            dxInstances.btnExcelDelete.option({
                disabled: false,
            });

            reader.readAsArrayBuffer(file);
        }

        inputOpenFile.on('change', parseExcelResult);

        dxInstances.fileName.option({
            readOnly: true,
        });

        dxInstances.btnExcelApply.option({
            text: '엑셀적용',
            stylingMode: 'outlined',
            type: 'danger',
            icon: 'xlsxfile',
            disabled: true,
            onClick: function () {
                inputOpenFile.trigger('click');
            },
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'outlined',
            text: '저장',
            type: 'success',
            onClick: function () {
                dxInstances.dataGridUnregisteredResult.getDataSource().store().load().done(function (gridData) {
                    let changes = gridData.filter(function (item) {
                        return item._crudType !== 'SELECT';
                    });

                    let data = ggsj.dxToValues();
                    data.count = changes.length;

                    if (changes.length < 1) {
                        ggsj.notify("변경된 내용이 없습니다.");
                        return;
                    } else {
                        ggsj.notify("저장 중입니다...");
                    }

                    for (let i = 0; i < changes.length; i++) {
                        for (let j = 0; j < resultItemValue.length; j++) {
                            for (let key in resultItemValue[j][0]) {
                                let value;
                                if (key === 'employeeCode') {
                                    value = resultItemValue[j][0][key]
                                    if (changes[i].employeeCode === value) {
                                        changes[i].resultItems = resultItemValue[j];
                                    }
                                }
                            }
                        }
                    }
                    data.resultEmployees = changes;
                    data.checkupYear = dxInstances.selectCheckupYear.option('value');
                    let formData = new FormData($('#formAttach')[0]);
                    formData.append('result', new Blob([JSON.stringify(data)], {
                        type: "application/json"
                    }));

                    $.ajax({
                        url: '<c:url value="/pm/result"/>',
                        method: 'POST',
                        processData: false,
                        contentType: false,
                        data: formData,
                    }).then(function () {
                        ggsj.notify("저장되었습니다.");
                        inputOpenFile.val('');

                        dxInstances.fileName.option({
                            value: null,
                            readOnly: true,
                        });

                        dxInstances.btnExcelApply.option({
                            disabled: false,
                        });
                        LoadResultBatch();
                    });
                });
            },
        });

        dxInstances.dataGridUnregisteredResult.option({
            dataSource: [],
            columns: [{
                caption: 'CRUD',
                dataField: '_crudType',
                visible: false,
            }, {
                caption: '순서',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                //EmployeeCheckupId
                dataField: 'employeeCheckupId',
                caption: '직원검진아이디',
                alignment: 'center',
                visible: false,
            }, {
                //기업체코드
                dataField: 'companyCode',
                caption: '기업체코드',
                alignment: 'center',
            }, {
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
                alignment: 'center',
            }, {
                //병원코드
                dataField: 'hospitalCode',
                caption: '병원코드',
                alignment: 'center',
            }, {
                //병원명
                dataField: 'hospitalName',
                caption: '병원명',
                alignment: 'center',
            }, {
                //센터코드
                dataField: 'centerCode',
                caption: '센터코드',
                alignment: 'center',
            }, {
                //센터명
                dataField: 'centerName',
                caption: '센터명',
                alignment: 'center',
            }, {
                //이름
                dataField: 'employeeName',
                caption: '검진자명',
                alignment: 'center',
            }, {
                //생년월일
                dataField: 'birth',
                caption: '생년월일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //성별
                dataField: 'sex',
                caption: '성별',
                alignment: 'center',
            }, {
                //ID
                dataField: 'employeeCode',
                caption: 'ID',
                alignment: 'center',
            }, {
                //검진일
                dataField: 'checkupedAt',
                caption: '수검완료일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //결과등록일
                dataField: 'employeeRegisteredAt',
                caption: '결과등록일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //종합소견
                dataField: 'review',
                caption: '종합소견',
                type: 'buttons',
                buttons: [{
                    text: '보기',
                    onClick: function (e) {
                        dxInstances.popupReview.show();
                        dxInstances.popupReview.option({
                            title: "종합소견",
                            closeOnOutsideClick: true,
                            width: 700,
                            height: 500,
                            contentTemplate: function (contentElement) {
                                contentElement.append('<div style="font-weight: bold; color: #2ea3aa">종합소견</div>');
                                if (e.row.data.review === null || e.row.data.review === '') {
                                    contentElement.append($("<div/>").dxTextArea({
                                        height: 500,
                                        value: '종합소견이 없습니다.',
                                        readOnly: true,
                                    }));
                                } else {
                                    contentElement.append($("<div/>").dxTextArea({
                                        height: 500,
                                        value: e.row.data.review,
                                        readOnly: true,
                                    }));
                                }
                                return contentElement;
                            },
                        });
                    }
                }]
            },],

            onRowPrepared: function (e) {
                if (e.rowType === "data") {
                    if (e.data._crudType === 'INSERT') {
                        e.rowElement.find("td").css('background', '#ebb3af');
                    } else if (e.data._crudType === 'UPDATE') {
                        e.rowElement.find("td").css('background', '#cef2ca');
                    }
                }
            },
        });

        function LoadResultBatch() {
            $.ajax({
                url: '<c:url value="/pm/resultlist"/>',
                method: 'GET',
                data: {
                    hospitalId: dxInstances.hospitalId.option('value'),
                    checkupYear: dxInstances.selectCheckupYear.option('value'),
                },
            }).then(function (response) {
                dsResultList = response.data;
                dxInstances.dataGridUnregisteredResult.option({
                    dataSource: dsResultList,
                });
            });
        }

        let ajaxCompanyList = {
            url: '<c:url value="/pm/companylist"/>',
        };
        let ajaxHospitalList = {
            url: '<c:url value="/common/hospital"/>',
        };

        $.when($.ajax(ajaxHospitalList), $.ajax(ajaxCompanyList)).then(
            function (responseHospitalList, responseCompanyList) {

                dsCompany = responseCompanyList[0].data;
                dsHospital = responseHospitalList[0].data;

                dxInstances.hospitalId.option({
                    dataSource: dsHospital,
                    valueExpr: 'hospitalId',
                    displayExpr: 'hospitalName',
                    placeholder: '병원을 선택하세요.',
                    onValueChanged: function () {
                        LoadResultBatch();
                        dxInstances.btnExcelApply.option({
                            disabled: false,
                        });
                    },
                });
            });
    });
</script>
</html>
