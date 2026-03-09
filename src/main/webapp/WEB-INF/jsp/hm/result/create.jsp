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
                            <h3 class="h3">寃곌낵?깅줉</h3>
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
                                                        class="icon-area"></span><span>湲곗뾽泥대챸</span></div>
                                                <div class="col-lg-8" id="companyId" data-sitebuilder="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2" style="width:370px">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-4 tag-name"><span
                                                        class="icon-area"></span><span>??곷뀈??/span></div>
                                                <div class="col-lg-8" id="selectCheckupYear"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12" id="btnSampleDown" data-sitebuilder="dxButton"
                                                 style="height:34px!important;">
                                                <i class="xi-file-download"></i>Excel ?섑뵆 ?뚯씪 諛쏄린
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
                                                    <div id="fileName" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-6 btn-margin"
                                                     style="width:calc(50% - 5px)!important; flex:none;">
                                                    <div class="col-lg-6" style="border-right:0!important">
                                                        <div id="btnExcelApply" data-sitebuilder="dxButton"></div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div id="btnExcelDelete" data-sitebuilder="dxButton"></div>
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
                            <div id="dataGridUnregisteredResult" class="sub_table" data-sitebuilder="dxDataGrid">
                            </div>
                        </div>
                        <div id="popupReview" data-sitebuilder="dxPopup"></div>

                        <div class="row">
                            <div class="col-lg-5"></div>
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"></div>
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
        sitebuilder.openMenu('result');

        let dxInstances = sitebuilder.createDx(false);

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

            worksheet.getCell('A3').value = '湲곗뾽泥댁퐫??;
            worksheet.getCell('B3').value = '蹂묒썝肄붾뱶';
            worksheet.getCell('C3').value = '?쇳꽣肄붾뱶';
            worksheet.getCell('D3').value = '寃吏꾩옄紐?;
            worksheet.getCell('E3').value = '?앸뀈?붿씪(8?먮━)';
            worksheet.getCell('F3').value = '?깅퀎';
            worksheet.getCell('G3').value = 'ID';
            worksheet.getCell('H3').value = '醫낇빀?뚭껄';

            worksheet.getCell('I1').value = 'B010011';
            worksheet.getCell('I2').value = '?좎껜怨꾩륫 諛??덉븬';
            worksheet.getCell('I3').value = '?좎옣';

            worksheet.getCell('J1').value = 'B010012';
            worksheet.getCell('J2').value = '?좎껜怨꾩륫 諛??덉븬';
            worksheet.getCell('J3').value = '泥댁쨷';

            worksheet.getCell('K1').value = 'B010013';
            worksheet.getCell('K2').value = '?좎껜怨꾩륫 諛??덉븬';
            worksheet.getCell('K3').value = '鍮꾨쭔??BMI)';

            worksheet.getCell('L1').value = 'B010014';
            worksheet.getCell('L2').value = '?좎껜怨꾩륫 諛??덉븬';
            worksheet.getCell('L3').value = '?덈━?섎젅';

            worksheet.getCell('M1').value = 'B010021';
            worksheet.getCell('M2').value = '?좎껜怨꾩륫 諛??덉븬';
            worksheet.getCell('M3').value = '?섏텞湲고삁??;

            worksheet.getCell('N1').value = 'B010022';
            worksheet.getCell('N2').value = '?좎껜怨꾩륫 諛??덉븬';
            worksheet.getCell('N3').value = '?댁셿湲고삁??;

            worksheet.getCell('O1').value = 'B030021';
            worksheet.getCell('O2').value = '泥?젰寃??;
            worksheet.getCell('O3').value = '500(醫?';

            worksheet.getCell('P1').value = 'B030022';
            worksheet.getCell('P2').value = '泥?젰寃??;
            worksheet.getCell('P3').value = '500(??';

            worksheet.getCell('Q1').value = 'B030023';
            worksheet.getCell('Q2').value = '泥?젰寃??;
            worksheet.getCell('Q3').value = '1000(醫?';

            worksheet.getCell('R1').value = 'B030024';
            worksheet.getCell('R2').value = '泥?젰寃??;
            worksheet.getCell('R3').value = '1000(??';

            worksheet.getCell('S1').value = 'B030025';
            worksheet.getCell('S2').value = '泥?젰寃??;
            worksheet.getCell('S3').value = '2000(醫?';

            worksheet.getCell('T1').value = 'B030026';
            worksheet.getCell('T2').value = '泥?젰寃??;
            worksheet.getCell('T3').value = '2000(??';

            worksheet.getCell('U1').value = 'B030027';
            worksheet.getCell('U2').value = '泥?젰寃??;
            worksheet.getCell('U3').value = '4000(醫?';

            worksheet.getCell('V1').value = 'B030028';
            worksheet.getCell('V2').value = '泥?젰寃??;
            worksheet.getCell('V3').value = '4000(??';

            worksheet.getCell('W1').value = 'B040021';
            worksheet.getCell('W2').value = '?덇낵寃??;
            worksheet.getCell('W3').value = '?쒕젰(醫?';

            worksheet.getCell('X1').value = 'B040022';
            worksheet.getCell('X2').value = '?덇낵寃??;
            worksheet.getCell('X3').value = '?쒕젰(??';

            worksheet.getCell('Y1').value = 'B040023';
            worksheet.getCell('Y2').value = '?덇낵寃??;
            worksheet.getCell('Y3').value = '援먯젙?쒕젰(醫?';

            worksheet.getCell('Z1').value = 'B040024';
            worksheet.getCell('Z2').value = '?덇낵寃??;
            worksheet.getCell('Z3').value = '援먯젙?쒕젰(??';

            worksheet.getCell('AA1').value = 'B040031';
            worksheet.getCell('AA2').value = '?덇낵寃??;
            worksheet.getCell('AA3').value = '?덉븬(醫?';

            worksheet.getCell('AB1').value = 'B040032';
            worksheet.getCell('AB2').value = '?덇낵寃??;
            worksheet.getCell('AB3').value = '?덉븬(??';

            worksheet.getCell('AC1').value = 'B040041';
            worksheet.getCell('AC2').value = '?덇낵寃??;
            worksheet.getCell('AC3').value = '?덉?(醫?';

            worksheet.getCell('AD1').value = 'B040042';
            worksheet.getCell('AD2').value = '?덇낵寃??;
            worksheet.getCell('AD3').value = '?덉?(??';

            worksheet.getCell('AE1').value = 'C01001';
            worksheet.getCell('AE2').value = '媛꾧린??寃??;
            worksheet.getCell('AE3').value = '珥앸떒諛?Total protein)';

            worksheet.getCell('AF1').value = 'C01002';
            worksheet.getCell('AF2').value = '媛꾧린??寃??;
            worksheet.getCell('AF3').value = '?뚮?誘?Albumin)';

            worksheet.getCell('AG1').value = 'C01003';
            worksheet.getCell('AG2').value = '媛꾧린??寃??;
            worksheet.getCell('AG3').value = '湲濡쒕툝由?Globulin)';

            worksheet.getCell('AH1').value = 'C01004';
            worksheet.getCell('AH2').value = '媛꾧린??寃??;
            worksheet.getCell('AH3').value = 'A/G鍮꾩쑉(albumin:globilin ratio)';

            worksheet.getCell('AI1').value = 'C01005';
            worksheet.getCell('AI2').value = '媛꾧린??寃??;
            worksheet.getCell('AI3').value = 'AST(SGOT)';

            worksheet.getCell('AJ1').value = 'C01006';
            worksheet.getCell('AJ2').value = '媛꾧린??寃??;
            worksheet.getCell('AJ3').value = 'ALT(SGPT)';

            worksheet.getCell('AK1').value = 'C01007';
            worksheet.getCell('AK2').value = '媛꾧린??寃??;
            worksheet.getCell('AK3').value = '媛먮쭏吏?고뵾(款-GTP)';

            worksheet.getCell('AL1').value = 'C01008';
            worksheet.getCell('AL2').value = '媛꾧린??寃??;
            worksheet.getCell('AL3').value = '珥앸퉴由щ（鍮?Total bilirubin)';

            worksheet.getCell('AM1').value = 'C01009';
            worksheet.getCell('AM2').value = '媛꾧린??寃??;
            worksheet.getCell('AM3').value = '吏곸젒鍮뚮━猷⑤퉰(Direct bilirubin)';

            worksheet.getCell('AN1').value = 'C01010';
            worksheet.getCell('AN2').value = '媛꾧린??寃??;
            worksheet.getCell('AN3').value = '媛꾩젒鍮뚮━猷⑤퉰(Indirect bilirubin)';

            worksheet.getCell('AO1').value = 'C01011';
            worksheet.getCell('AO2').value = '媛꾧린??寃??;
            worksheet.getCell('AO3').value = '?뚯뭡由ы룷?ㅽ뙆???ALP)';

            worksheet.getCell('AP1').value = 'C01012';
            worksheet.getCell('AP2').value = '媛꾧린??寃??;
            worksheet.getCell('AP3').value = '?좎궛?덉닔?뚰슚??LDH)';

            worksheet.getCell('AQ1').value = 'C02001';
            worksheet.getCell('AQ2').value = '媛꾧린??寃??;
            worksheet.getCell('AQ3').value = 'A????껜 ?뺤꽦?щ?(HAV IgG)';

            worksheet.getCell('AR1').value = 'C02002';
            worksheet.getCell('AR2').value = '媛꾧린??寃??;
            worksheet.getCell('AR3').value = 'A?뺢컙?쇳몴硫댄빆泥?HAV IgM)';

            worksheet.getCell('AS1').value = 'C02005';
            worksheet.getCell('AS2').value = '媛꾧린??寃??;
            worksheet.getCell('AS3').value = 'B?뺢컙?쇳빆??HBsAg)';

            worksheet.getCell('AT1').value = 'C02006';
            worksheet.getCell('AT2').value = '媛꾧린??寃??;
            worksheet.getCell('AT3').value = 'B?뺢컙?쇳빆泥?HBsAb)';

            worksheet.getCell('AU1').value = 'C02007';
            worksheet.getCell('AU2').value = '媛꾧린??寃??;
            worksheet.getCell('AU3').value = 'B?뺢컙?쇳솢?숈꽦諛륁쟾?쇱꽦?щ?(HBeAg)';

            worksheet.getCell('AV1').value = 'C02008';
            worksheet.getCell('AV2').value = '媛꾧린??寃??;
            worksheet.getCell('AV3').value = 'B?뺢컙?쇳솢?숈꽦諛륁쟾?쇱꽦?щ?(HBeAb)';

            worksheet.getCell('AW1').value = 'C02009';
            worksheet.getCell('AW2').value = '媛꾧린??寃??;
            worksheet.getCell('AW3').value = 'C?뺢컙?쇳빆泥?HCVAb)';

            worksheet.getCell('AX1').value = 'C03001';
            worksheet.getCell('AX2').value = '?좎옣湲곕뒫寃??;
            worksheet.getCell('AX3').value = '?붿냼吏덉냼(BUN)';

            worksheet.getCell('AY1').value = 'C03002';
            worksheet.getCell('AY2').value = '?좎옣湲곕뒫寃??;
            worksheet.getCell('AY3').value = '?щ젅?꾪떚??Creatinin)';

            worksheet.getCell('AZ1').value = 'C03003';
            worksheet.getCell('AZ2').value = '?좎옣湲곕뒫寃??;
            worksheet.getCell('AZ3').value = 'B/C鍮꾩쑉';

            worksheet.getCell('BA1').value = 'C03004';
            worksheet.getCell('BA2').value = '?좎옣湲곕뒫寃??;
            worksheet.getCell('BA3').value = '?좎궗援ъ껜?ш낵??GFR)';

            worksheet.getCell('BB1').value = 'C04001';
            worksheet.getCell('BB2').value = '?밸눊寃??;
            worksheet.getCell('BB3').value = '怨듬났?쒗삁??FBS=Glucose)';

            worksheet.getCell('BC1').value = 'C04002';
            worksheet.getCell('BC2').value = '?밸눊寃??;
            worksheet.getCell('BC3').value = '?뱁솕?덉깋??HbA1c)';

            worksheet.getCell('BD1').value = 'C04004';
            worksheet.getCell('BD2').value = '?밸눊寃??;
            worksheet.getCell('BD3').value = 'Insulin';

            worksheet.getCell('BE1').value = 'C05001';
            worksheet.getCell('BE2').value = '痍뚯옣湲곕뒫寃??;
            worksheet.getCell('BE3').value = '由ы뙆?꾩젣(Lipase)';

            worksheet.getCell('BF1').value = 'C05002';
            worksheet.getCell('BF2').value = '痍뚯옣湲곕뒫寃??;
            worksheet.getCell('BF3').value = '?꾨??쇱젣(Amylase)';

            worksheet.getCell('BG1').value = 'C06001';
            worksheet.getCell('BG2').value = '吏吏?諛??ы삁愿怨꾧???;
            worksheet.getCell('BG3').value = '珥앹퐳?덉뒪?뚮·';

            worksheet.getCell('BH1').value = 'C06002';
            worksheet.getCell('BH2').value = '吏吏?諛??ы삁愿怨꾧???;
            worksheet.getCell('BH3').value = '怨좊???肄쒕젅?ㅽ뀒濡?HDL-肄쒕젅?ㅽ뀒濡?';

            worksheet.getCell('BI1').value = 'C06003';
            worksheet.getCell('BI2').value = '吏吏?諛??ы삁愿怨꾧???;
            worksheet.getCell('BI3').value = '?諛??肄쒕젅?ㅽ뀒濡?LDL-肄쒕젅?ㅽ뀒濡?';

            worksheet.getCell('BJ1').value = 'C06004';
            worksheet.getCell('BJ2').value = '吏吏?諛??ы삁愿怨꾧???;
            worksheet.getCell('BJ3').value = '以묒꽦吏諛?Triglyceride)';

            worksheet.getCell('BK1').value = 'C06005';
            worksheet.getCell('BK2').value = '吏吏?諛??ы삁愿怨꾧???;
            worksheet.getCell('BK3').value = '?щ젅?꾪떚?뚰궎?섏젣(CPK)';

            worksheet.getCell('BL1').value = 'C06006';
            worksheet.getCell('BL2').value = '吏吏?諛??ы삁愿怨꾧???;
            worksheet.getCell('BL3').value = '?ъ옣蹂묒쐞?섏씤??CRF)';

            worksheet.getCell('BM1').value = 'C06008';
            worksheet.getCell('BM2').value = '吏吏?諛??ы삁愿怨꾧???;
            worksheet.getCell('BM3').value = '?몃え?쒖뒪?뚯씤(Homocysteine)';

            worksheet.getCell('BN1').value = 'C070011';
            worksheet.getCell('BN2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BN3').value = '?곹삁援?RBC)';

            worksheet.getCell('BO1').value = 'C070012';
            worksheet.getCell('BO2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BO3').value = '?덉깋??Hb)';

            worksheet.getCell('BP1').value = 'C070013';
            worksheet.getCell('BP2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BP3').value = '?곹삁援ъ슜??Hct)';

            worksheet.getCell('BQ1').value = 'C070014';
            worksheet.getCell('BQ2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BQ3').value = '?됯퇏?곹삁援ъ슜??MCV)';

            worksheet.getCell('BR1').value = 'C070015';
            worksheet.getCell('BR2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BR3').value = '?됯퇏?곹삁援ы삁?됱냼??MCH)';

            worksheet.getCell('BS1').value = 'C070016';
            worksheet.getCell('BS2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BS3').value = '?됯퇏?곹삁援ы삁?됱냼?띾룄(MCHC)';

            worksheet.getCell('BT1').value = 'C070017';
            worksheet.getCell('BT2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BT3').value = '?곹삁援щ텇?ш퀎??RDW)';

            worksheet.getCell('BU1').value = 'C070018';
            worksheet.getCell('BU2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BU3').value = '?덉냼?먯닔(PLT)';

            worksheet.getCell('BV1').value = 'C070019';
            worksheet.getCell('BV2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BV3').value = '?덉냼?먮갚遺꾩쑉(PCT)';

            worksheet.getCell('BW1').value = 'C0700110';
            worksheet.getCell('BW2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BW3').value = '?됯퇏?덉냼?먯슜??MPV)';

            worksheet.getCell('BX1').value = 'C0700111';
            worksheet.getCell('BX2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BX3').value = '?덉냼?먮텇?ы룺(PDW)';

            worksheet.getCell('BY1').value = 'C0700112';
            worksheet.getCell('BY2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BY3').value = '諛깊삁援?WBC)';

            worksheet.getCell('BZ1').value = 'C0700113';
            worksheet.getCell('BZ2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('BZ3').value = '遺꾪쉷?몄쨷援?Seg.Neutrophil)';

            worksheet.getCell('CA1').value = 'C0700114';
            worksheet.getCell('CA2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CA3').value = '遊됱긽?몄쨷援?Band neutrophil)';

            worksheet.getCell('CB1').value = 'C0700115';
            worksheet.getCell('CB2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CB3').value = '由쇳봽援?Lymphocyte)';

            worksheet.getCell('CC1').value = 'C0700116';
            worksheet.getCell('CC2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CC3').value = '?⑦빑援?Monocyte)';

            worksheet.getCell('CD1').value = 'C0700117';
            worksheet.getCell('CD2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CD3').value = '?몄궛援?Eosinophile)';

            worksheet.getCell('CE1').value = 'C0700118';
            worksheet.getCell('CE2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CE3').value = '?쇨린援?Basophile)';

            worksheet.getCell('CF1').value = 'C0700119';
            worksheet.getCell('CF2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CF3').value = '?꾧낏?섍뎄(metamyelocyte)';

            worksheet.getCell('CG1').value = 'C0700120';
            worksheet.getCell('CG2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CG3').value = '怨⑥닔援?myelocyte)';

            worksheet.getCell('CH1').value = 'C0700121';
            worksheet.getCell('CH2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CH3').value = '?꾧낏?섏꽭??promyeloyte)';

            worksheet.getCell('CI1').value = 'C0700122';
            worksheet.getCell('CI2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CI3').value = '怨⑥닔?꾩꽭??myeloblast)';

            worksheet.getCell('CJ1').value = 'C0700123';
            worksheet.getCell('CJ2').value = '?쇰컲?덉븸寃??CBC)';
            worksheet.getCell('CJ3').value = '?좏빑?곹삁援?nRCBC)';

            worksheet.getCell('CK1').value = 'C11001';
            worksheet.getCell('CK2').value = '泥?寃고븤??鍮덊삁 愿?④???;
            worksheet.getCell('CK3').value = '?쇰━??Ferritin)';

            worksheet.getCell('CL1').value = 'C11002';
            worksheet.getCell('CL2').value = '泥?寃고븤??鍮덊삁 愿?④???;
            worksheet.getCell('CL3').value = '?덉껌泥?Fe)';

            worksheet.getCell('CM1').value = 'C11003';
            worksheet.getCell('CM2').value = '泥?寃고븤??鍮덊삁 愿?④???;
            worksheet.getCell('CM3').value = '珥앹쿋寃고빀??TIBC)';

            worksheet.getCell('CN1').value = 'C11004';
            worksheet.getCell('CN2').value = '泥?寃고븤??鍮덊삁 愿?④???;
            worksheet.getCell('CN3').value = '遺덊룷??泥좉껐?⑸뒫(UIBC)';

            worksheet.getCell('CO1').value = 'C12001';
            worksheet.getCell('CO2').value = '媛묒긽?좉린?κ???;
            worksheet.getCell('CO3').value = '媛묒긽?좏샇瑜대が(T3)';

            worksheet.getCell('CP1').value = 'C12002';
            worksheet.getCell('CP2').value = '媛묒긽?좉린?κ???;
            worksheet.getCell('CP3').value = '媛묒긽?좏샇瑜대が(T4)';

            worksheet.getCell('CQ1').value = 'C12003';
            worksheet.getCell('CQ2').value = '媛묒긽?좉린?κ???;
            worksheet.getCell('CQ3').value = '媛묒긽?좏샇瑜대が(Free T3)';

            worksheet.getCell('CR1').value = 'C12004';
            worksheet.getCell('CR2').value = '媛묒긽?좉린?κ???;
            worksheet.getCell('CR3').value = '媛묒긽?좏샇瑜대が(Free T4)';

            worksheet.getCell('CS1').value = 'C12005';
            worksheet.getCell('CS2').value = '媛묒긽?좉린?κ???;
            worksheet.getCell('CS3').value = '媛묒긽?좎옄洹뱁샇瑜대が(TSH)';

            worksheet.getCell('CT1').value = 'C13001';
            worksheet.getCell('CT2').value = '媛먯뿼寃??;
            worksheet.getCell('CT3').value = '?щ━肄붾컯??: H.pylori';

            worksheet.getCell('CU1').value = 'C13002';
            worksheet.getCell('CU2').value = '媛먯뿼寃??;
            worksheet.getCell('CU3').value = '留ㅻ룆 : RPR(VDRL)';

            worksheet.getCell('CV1').value = 'C13003';
            worksheet.getCell('CV2').value = '媛먯뿼寃??;
            worksheet.getCell('CV3').value = '留ㅻ룆媛먯옉?덇뎄?묒쭛 : TPHA';

            worksheet.getCell('CW1').value = 'C14001';
            worksheet.getCell('CW2').value = '?듯뭾 諛??쇱쬆諛섏쓳';
            worksheet.getCell('CW3').value = '?붿궛(uric acid)';

            worksheet.getCell('CX1').value = 'C14002';
            worksheet.getCell('CX2').value = '?듯뭾 諛??쇱쬆諛섏쓳';
            worksheet.getCell('CX3').value = '瑜섎쭏?곗뒪?몄옄(RA Factor, RF)';

            worksheet.getCell('CY1').value = 'C14003';
            worksheet.getCell('CY2').value = '?듯뭾 諛??쇱쬆諛섏쓳';
            worksheet.getCell('CY3').value = 'C-諛섏쓳 ?⑤갚 (CRP)';

            worksheet.getCell('CZ1').value = 'C14004';
            worksheet.getCell('CZ2').value = '?듯뭾 諛??쇱쬆諛섏쓳';
            worksheet.getCell('CZ3').value = '怨좉컧??C-諛섏쓳 ?⑤갚 (HS_CRP)';

            worksheet.getCell('DA1').value = 'C15001';
            worksheet.getCell('DA2').value = '?꾪빐吏덇???;
            worksheet.getCell('DA3').value = '?섑듃瑜?Na)';

            worksheet.getCell('DB1').value = 'C15002';
            worksheet.getCell('DB2').value = '?꾪빐吏덇???;
            worksheet.getCell('DB3').value = '移쇰ⅷ(K)';

            worksheet.getCell('DC1').value = 'C15003';
            worksheet.getCell('DC2').value = '?꾪빐吏덇???;
            worksheet.getCell('DC3').value = '?쇱냼(Cl)';

            worksheet.getCell('DD1').value = 'C15004';
            worksheet.getCell('DD2').value = '?꾪빐吏덇???;
            worksheet.getCell('DD3').value = '移쇱뒛(Ca)';

            worksheet.getCell('DE1').value = 'C15005';
            worksheet.getCell('DE2').value = '?꾪빐吏덇???;
            worksheet.getCell('DE3').value = '??P)';

            worksheet.getCell('DF1').value = 'C15006';
            worksheet.getCell('DF2').value = '?꾪빐吏덇???;
            worksheet.getCell('DF3').value = '留덇렇?ㅼ뒛(Mg)';

            worksheet.getCell('DG1').value = 'C15007';
            worksheet.getCell('DG2').value = '?꾪빐吏덇???;
            worksheet.getCell('DG3').value = '?꾩뿰(Zn)';

            worksheet.getCell('DH1').value = 'C15008';
            worksheet.getCell('DH2').value = '?꾪빐吏덇???;
            worksheet.getCell('DH3').value = '?덉쨷 ?댁궛?뷀깂??CO2)';

            worksheet.getCell('DI1').value = 'C16001';
            worksheet.getCell('DI2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DI3').value = 'AFP(媛꾩븫)';

            worksheet.getCell('DJ1').value = 'C16002';
            worksheet.getCell('DJ2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DJ3').value = 'CEA(??μ븫)';

            worksheet.getCell('DK1').value = 'C16003';
            worksheet.getCell('DK2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DK3').value = 'CA19-9 (痍뚯옣??';

            worksheet.getCell('DL1').value = 'C16004';
            worksheet.getCell('DL2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DL3').value = 'PSA(?꾨┰?좎븫)_??;

            worksheet.getCell('DM1').value = 'C16005';
            worksheet.getCell('DM2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DM3').value = 'CA125(?쒖냼/?먭턿??_??;

            worksheet.getCell('DN1').value = 'C16006';
            worksheet.getCell('DN2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DN3').value = 'CA15-3(?좊갑??_??;

            worksheet.getCell('DO1').value = 'C16007';
            worksheet.getCell('DO2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DO3').value = 'Cyfra21-1(?먯븫)';

            worksheet.getCell('DP1').value = 'C16008';
            worksheet.getCell('DP2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DP3').value = 'NSE(?먯븫)';

            worksheet.getCell('DQ1').value = 'C16009';
            worksheet.getCell('DQ2').value = '醫낆뼇?쒖??먭???;
            worksheet.getCell('DQ3').value = 'SCC(?먯븫,?앸룄???명룊?곹뵾??';

            worksheet.getCell('DR1').value = 'C18002';
            worksheet.getCell('DR2').value = '鍮꾪?誘쇨???;
            worksheet.getCell('DR3').value = '鍮꾪?誘퍭(Vit.D)';

            worksheet.getCell('DS1').value = 'D010011';
            worksheet.getCell('DS2').value = '?뚮?寃??;
            worksheet.getCell('DS3').value = '?붾퉬以?urine S.G)';

            worksheet.getCell('DT1').value = 'D010012';
            worksheet.getCell('DT2').value = '?뚮?寃??;
            worksheet.getCell('DT3').value = '?붿궛??urine pH)';

            worksheet.getCell('DU1').value = 'D010013';
            worksheet.getCell('DU2').value = '?뚮?寃??;
            worksheet.getCell('DU3').value = '?붾갚?덇뎄(Urine Leukocytes)';

            worksheet.getCell('DV1').value = 'D010014';
            worksheet.getCell('DV2').value = '?뚮?寃??;
            worksheet.getCell('DV3').value = '?붿븘吏덉궛??urine Nitrite)';

            worksheet.getCell('DW1').value = 'D010015';
            worksheet.getCell('DW2').value = '?뚮?寃??;
            worksheet.getCell('DW3').value = '?붾떒諛?urine protein)';

            worksheet.getCell('DX1').value = 'D010016';
            worksheet.getCell('DX2').value = '?뚮?寃??;
            worksheet.getCell('DX3').value = '?붾떦(urine glucose)';

            worksheet.getCell('DY1').value = 'D010017';
            worksheet.getCell('DY2').value = '?뚮?寃??;
            worksheet.getCell('DY3').value = '耳??urine ketone body)';

            worksheet.getCell('DZ1').value = 'D010018';
            worksheet.getCell('DZ2').value = '?뚮?寃??;
            worksheet.getCell('DZ3').value = '?좊줈鍮뚮━?멸쾺(urobilinogen)';

            worksheet.getCell('EA1').value = 'D010019';
            worksheet.getCell('EA2').value = '?뚮?寃??;
            worksheet.getCell('EA3').value = '鍮뚮━猷⑤퉰(bilirubin)';

            worksheet.getCell('EB1').value = 'D0100110';
            worksheet.getCell('EB2').value = '?뚮?寃??;
            worksheet.getCell('EB3').value = '?붿옞??urine occult blood)';

            worksheet.getCell('EC1').value = 'D010021';
            worksheet.getCell('EC2').value = '?뚮?寃??;
            worksheet.getCell('EC3').value = '?붿묠?щ갚?덇뎄(urine WBC)';

            worksheet.getCell('ED1').value = 'D010022';
            worksheet.getCell('ED2').value = '?뚮?寃??;
            worksheet.getCell('ED3').value = '?붿묠?ъ쟻?덇뎄(urine RBC)';

            worksheet.getCell('EE1').value = 'D010023';
            worksheet.getCell('EE2').value = '?뚮?寃??;
            worksheet.getCell('EE3').value = '?붿묠???꾨?寃쎄???;

            worksheet.getCell('EF1').value = 'D02001';
            worksheet.getCell('EF2').value = '?蹂寃??;
            worksheet.getCell('EF3').value = '遺꾨??좏삁';

            worksheet.getCell('EG1').value = 'D02002';
            worksheet.getCell('EG2').value = '?蹂寃??;
            worksheet.getCell('EG3').value = '遺꾨?異⑸?寃??湲곗깮異?';

            worksheet.getCell('EH1').value = 'G02001';
            worksheet.getCell('EH2').value = '遺?멸낵寃??;
            worksheet.getCell('EH3').value = '?먭턿寃쎈??붽???Papsmear)';

            worksheet.getCell('EI1').value = 'G02002';
            worksheet.getCell('EI2').value = '遺?멸낵寃??;
            worksheet.getCell('EI3').value = '?먭턿寃쎈????≪긽?명룷寃??Thin prep)';

            worksheet.getCell('EJ1').value = 'G02003';
            worksheet.getCell('EJ2').value = '遺?멸낵寃??;
            worksheet.getCell('EJ3').value = '?몄쑀?먯쥌諛붿씠?ъ뒪寃??HPV)';

            worksheet.getCell('EK1').value = 'E01001';
            worksheet.getCell('EK2').value = '?ы룓湲곕뒫寃??;
            worksheet.getCell('EK3').value = '?ъ쟾??寃??;

            worksheet.getCell('EL1').value = 'E01002';
            worksheet.getCell('EL2').value = '?ы룓湲곕뒫寃??;
            worksheet.getCell('EL3').value = '?먭린??寃??;

            worksheet.getCell('EM1').value = 'E01003';
            worksheet.getCell('EM2').value = '?ы룓湲곕뒫寃??;
            worksheet.getCell('EM3').value = '?됰?X-??珥ъ쁺';

            worksheet.getCell('EN1').value = 'E02001';
            worksheet.getCell('EN2').value = '?좊갑珥ъ쁺';
            worksheet.getCell('EN3').value = '?좊갑X-??Mammography)';

            worksheet.getCell('EO1').value = 'F02001';
            worksheet.getCell('EO2').value = '泥숈텛?쇰컲珥ъ쁺';
            worksheet.getCell('EO3').value = '寃쎌텛X-?좎눋??;

            worksheet.getCell('EP1').value = 'F02002';
            worksheet.getCell('EP2').value = '泥숈텛?쇰컲珥ъ쁺';
            worksheet.getCell('EP3').value = '?붿텛X-?좎눋??;

            worksheet.getCell('EQ1').value = 'F03001';
            worksheet.getCell('EQ2').value = '?숇㎘寃쏀솕寃??;
            worksheet.getCell('EQ3').value = '?숇㎘寃쏀솕寃??;

            worksheet.getCell('ER1').value = 'F05001';
            worksheet.getCell('ER2').value = '怨⑤??꾧???;
            worksheet.getCell('ER3').value = '怨⑤??꾧???(Bone density)';

            worksheet.getCell('ES1').value = 'F06001';
            worksheet.getCell('ES2').value = '?꾩옣寃??;
            worksheet.getCell('ES3').value = '?꾨궡?쒓꼍(鍮꾩닔硫?';

            worksheet.getCell('ET1').value = 'F06002';
            worksheet.getCell('ET2').value = '?꾩옣寃??;
            worksheet.getCell('ET3').value = '?꾨궡?쒓꼍(?섎㈃)';

            worksheet.getCell('EU1').value = 'F06003';
            worksheet.getCell('EU2').value = '?꾩옣寃??;
            worksheet.getCell('EU3').value = '?꾩옣議곗쁺珥ъ쁺';

            worksheet.getCell('EV1').value = 'F07001';
            worksheet.getCell('EV2').value = '??κ???;
            worksheet.getCell('EV3').value = '??λ궡?쒓꼍(鍮꾩닔硫?';

            worksheet.getCell('EW1').value = 'F07002';
            worksheet.getCell('EW2').value = '??κ???;
            worksheet.getCell('EW3').value = '??λ궡?쒓꼍(?섎㈃)';

            worksheet.getCell('EX1').value = 'F08001';
            worksheet.getCell('EX2').value = '珥덉쓬?뚭???;
            worksheet.getCell('EX3').value = '?곷났遺珥덉쓬??;

            worksheet.getCell('EY1').value = 'F08004';
            worksheet.getCell('EY2').value = '珥덉쓬?뚭???;
            worksheet.getCell('EY3').value = '?꾨┰???⑥꽦?섎났遺)珥덉쓬??;

            worksheet.getCell('EZ1').value = 'F08005';
            worksheet.getCell('EZ2').value = '珥덉쓬?뚭???;
            worksheet.getCell('EZ3').value = '寃쎌쭅???꾨┰??珥덉쓬??;

            worksheet.getCell('FA1').value = 'F08006';
            worksheet.getCell('FA2').value = '珥덉쓬?뚭???;
            worksheet.getCell('FA3').value = '怨⑤컲(?ъ꽦?섎났遺)珥덉쓬??;

            worksheet.getCell('FB1').value = 'F08007';
            worksheet.getCell('FB2').value = '珥덉쓬?뚭???;
            worksheet.getCell('FB3').value = '吏덉큹?뚰뙆(VaginalSono)';

            worksheet.getCell('FC1').value = 'F08008';
            worksheet.getCell('FC2').value = '珥덉쓬?뚭???;
            worksheet.getCell('FC3').value = '媛묒긽?좎큹?뚰뙆';

            worksheet.getCell('FD1').value = 'F08009';
            worksheet.getCell('FD2').value = '珥덉쓬?뚭???;
            worksheet.getCell('FD3').value = '寃쎈룞留μ큹?뚰뙆';

            worksheet.getCell('FE1').value = 'F08010';
            worksheet.getCell('FE2').value = '珥덉쓬?뚭???;
            worksheet.getCell('FE3').value = '?좊갑珥덉쓬??BreastSono)';

            worksheet.getCell('FF1').value = 'F08012';
            worksheet.getCell('FF2').value = '珥덉쓬?뚭???;
            worksheet.getCell('FF3').value = '?ъ옣珥덉쓬??;

            worksheet.getCell('FG1').value = 'F09001';
            worksheet.getCell('FG2').value = '?똂T寃??;
            worksheet.getCell('FG3').value = '??癒몃━)CT';

            worksheet.getCell('FH1').value = 'F10001';
            worksheet.getCell('FH2').value = '?륝T寃??;
            worksheet.getCell('FH3').value = '?됰?(??CT';

            worksheet.getCell('FI1').value = 'F11001';
            worksheet.getCell('FI2').value = '泥숈텛CT寃??;
            worksheet.getCell('FI3').value = '寃쎌텛(紐?CT';

            worksheet.getCell('FJ1').value = 'F11002';
            worksheet.getCell('FJ2').value = '泥숈텛CT寃??;
            worksheet.getCell('FJ3').value = '?붿텛(?덈━)CT';

            worksheet.getCell('FK1').value = 'F12001';
            worksheet.getCell('FK2').value = '?ъ옣CT寃??;
            worksheet.getCell('FK3').value = '?ъ옣?앺쉶??移쇱뒛?ㅼ퐫?대쭅)CT';

            worksheet.getCell('FL1').value = 'F13001';
            worksheet.getCell('FL2').value = '蹂듬?CT寃??;
            worksheet.getCell('FL3').value = '蹂듬?鍮꾨쭔CT';

            worksheet.getCell('FM1').value = 'F16001';
            worksheet.getCell('FM2').value = '?똌R寃??;
            worksheet.getCell('FM3').value = '?똌RI';

            worksheet.getCell('FN1').value = 'F16002';
            worksheet.getCell('FN2').value = '?똌R寃??;
            worksheet.getCell('FN3').value = '?똌RI-T2';

            worksheet.getCell('FO1').value = 'F16003';
            worksheet.getCell('FO2').value = '?똌R寃??;
            worksheet.getCell('FO3').value = '?뚰삁愿MRA';

            worksheet.getCell('FP1').value = 'F16004';
            worksheet.getCell('FP2').value = '?똌R寃??;
            worksheet.getCell('FP3').value = '?똌RA-T2';

            worksheet.getCell('FQ1').value = 'F16005';
            worksheet.getCell('FQ2').value = '?똌R寃??;
            worksheet.getCell('FQ3').value = '?똌RI+?똌RA';

            worksheet.getCell('FR1').value = 'F17001';
            worksheet.getCell('FR2').value = '泥숈텛MR寃??;
            worksheet.getCell('FR3').value = '寃쎌텛(紐?MRI';

            worksheet.getCell('FS1').value = 'F17002';
            worksheet.getCell('FS2').value = '泥숈텛MR寃??;
            worksheet.getCell('FS3').value = '寃쎌텛MRI-T2';

            worksheet.getCell('FT1').value = 'F17003';
            worksheet.getCell('FT2').value = '泥숈텛MR寃??;
            worksheet.getCell('FT3').value = '?붿텛(?덈━)MRI';

            worksheet.getCell('FU1').value = 'F17004';
            worksheet.getCell('FU2').value = '泥숈텛MR寃??;
            worksheet.getCell('FU3').value = '?붿텛MRI-T2';

            worksheet.getCell('FV1').value = 'F18001';
            worksheet.getCell('FV2').value = '愿?뉾R寃??;
            worksheet.getCell('FV3').value = '寃ш????닿묠)MRI (醫? ??以???遺??';

            worksheet.getCell('FW1').value = 'F18002';
            worksheet.getCell('FW2').value = '愿?뉾R寃??;
            worksheet.getCell('FW3').value = '議깃???諛쒕ぉ)MRI (醫? ??以???遺??';

            worksheet.getCell('FX1').value = 'F18003';
            worksheet.getCell('FX2').value = '愿?뉾R寃??;
            worksheet.getCell('FX3').value = '怨좉???怨⑤컲)MRI';

            worksheet.getCell('FY1').value = 'F18004';
            worksheet.getCell('FY2').value = '愿?뉾R寃??;
            worksheet.getCell('FY3').value = '?섍렐愿???먮ぉ)MRI (醫? ??以???遺??';

            worksheet.getCell('FZ1').value = 'F18005';
            worksheet.getCell('FZ2').value = '愿?뉾R寃??;
            worksheet.getCell('FZ3').value = '?ш???臾대쫷)MRI (醫? ??以???遺??';

            worksheet.getCell('GA1').value = 'F21001';
            worksheet.getCell('GA2').value = 'PET寃??;
            worksheet.getCell('GA3').value = '???꾩떊 PET';

            worksheet.getCell('GB1').value = 'F21002';
            worksheet.getCell('GB2').value = 'PET寃??;
            worksheet.getCell('GB3').value = '?꾩떊 PET(???쒖쇅)';

            // if (dsResultList.length < 1) {
            //     console.log('No Data');
            //     return;
            // }

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
                itemData[8] = dsResultList[idxItem].review;

                worksheet.addRow(itemData);
            }

            workbook.xlsx.writeBuffer().then(function (buffer) {
                saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
            });
        }

        dxInstances.btnSampleDown.option({
            text: '?묒??섑뵆?뚯씪 ?ㅼ슫',
            onClick: function () {
                exportExcelContractCheckupSample();
            }
        });

        dxInstances.selectCheckupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadResultBatch();
            }
        });

        dxInstances.btnExcelDelete.option({
            text: '泥⑤??뚯씪 ?쒓굅',
            disabled: true,
            onClick: function () {
                inputOpenFile.val('');
                LoadResultBatch(dxInstances.companyId.option('value'));
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

                            if (employeeCodes.length === 0) {
                                employeeCodes.push(row.getCell(7).value);
                                for (let i = 9; i < 185; i++) {
                                    let item = {};
                                    item.resultValue = row.getCell(i).value;
                                    itemSubValue.push(Object.assign({}, itemValue[i - 9], item));
                                }
                                resultItemValue.push(itemSubValue);
                            } else {
                                for (let i = 0; i < employeeCodes.length; i++) {
                                    if (employeeCodes[i] !== row.getCell(7).value) {
                                        employeeCodes.push(row.getCell(7).value);
                                        for (let i = 9; i < 185; i++) {
                                            let item = {};
                                            item.resultValue = row.getCell(i).value;
                                            itemSubValue.push(Object.assign({}, itemValue[i - 9], item));
                                        }
                                        resultItemValue.push(itemSubValue);
                                    }
                                }
                            }
                            // 鍮????留뚮굹硫?以묐떒
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
                            dxInstances.dataGridUnregisteredResult.columnOption('checkupedAt', {
                                value: {
                                    dataSource: $.ajax({
                                        url: '<c:url value="/hm/resultcheckup"/>',
                                        data: {
                                            employeeCode: resultRow.employeeCode,
                                        },
                                    }),
                                }
                            });
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
            text: '?묒??곸슜',
            stylingMode: 'outlined',
            type: 'danger',
            icon: 'xlsxfile',
            disabled: true,
            onClick: function () {
                inputOpenFile.trigger('click');
            },
        });

        let ajaxCompanyList = {
            url: '<c:url value="/hm/companylist"/>',
        };
        let ajaxHospitalList = {
            url: '<c:url value="/common/hospital"/>',
        };

        $.when($.ajax(ajaxHospitalList), $.ajax(ajaxCompanyList)).then(
            function (responseHospitalList, responseCompanyList) {

                dsCompany = responseCompanyList[0].data;
                dsHospital = responseHospitalList[0].data;

                dxInstances.companyId.option({
                    dataSource: dsCompany,
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                    placeholder: '湲곗뾽???좏깮?섏꽭??',
                    onValueChanged: function (data) {
                        LoadResultBatch(data.value);
                    },
                });
            });

        function LoadResultBatch(value) {
            $.ajax({
                url: '<c:url value="/hm/resultlist"/>',
                method: 'GET',
                data: {
                    companyId: value,
                    checkupYear: dxInstances.selectCheckupYear.option('value'),
                },
            }).then(function (response) {
                dsResultList = response.data;

                dxInstances.dataGridUnregisteredResult.option({
                    dataSource: dsResultList,
                });
                dxInstances.btnExcelApply.option({
                    disabled: false,
                });
            });
        }

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'outlined',
            text: '???,
            type: 'success',
            onClick: function () {
                dxInstances.dataGridUnregisteredResult.getDataSource().store().load().done(function (gridData) {
                    let changes = gridData.filter(function (item) {
                        return item._crudType !== 'SELECT';
                    });

                    let data = sitebuilder.dxToValues();
                    data.count = changes.length;

                    if (changes.length < 1) {
                        sitebuilder.notify("蹂寃쎈맂 ?댁슜???놁뒿?덈떎.");
                        return;
                    } else {
                        sitebuilder.notify("???以묒엯?덈떎...");
                    }

                    for (let i = 0; i < changes.length; i++) {
                        changes[i].resultItems = resultItemValue[i];
                    }
                    data.resultEmployees = changes;
                    data.checkupYear = dxInstances.selectCheckupYear.option('value');

                    let formData = new FormData($('#formAttach')[0]);
                    formData.append('result', new Blob([JSON.stringify(data)], {
                        type: "application/json"
                    }));

                    $.ajax({
                        url: '<c:url value="/hm/result"/>',
                        method: 'POST',
                        processData: false,
                        contentType: false,
                        data: formData,
                    }).then(function () {
                        sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                        inputOpenFile.val('');

                        dxInstances.fileName.option({
                            value: null,
                            readOnly: true,
                        });

                        dxInstances.btnExcelApply.option({
                            disabled: false,
                        });
                        LoadResultBatch(dxInstances.companyId.option('value'));
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
                caption: '?쒖꽌',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                //EmployeeCheckupId
                dataField: 'employeeCheckupId',
                caption: '吏곸썝寃吏꾩븘?대뵒',
                alignment: 'center',
                visible: false,
            }, {
                //湲곗뾽泥댁퐫??                dataField: 'companyCode',
                caption: '湲곗뾽泥댁퐫??,
                alignment: 'center',
            }, {
                //湲곗뾽泥대챸
                dataField: 'companyName',
                caption: '湲곗뾽泥대챸',
                alignment: 'center',
            }, {
                //蹂묒썝肄붾뱶
                dataField: 'hospitalCode',
                caption: '蹂묒썝肄붾뱶',
                alignment: 'center',
            }, {
                //蹂묒썝紐?                dataField: 'hospitalName',
                caption: '蹂묒썝紐?,
                alignment: 'center',
            }, {
                //?쇳꽣肄붾뱶
                dataField: 'centerCode',
                caption: '?쇳꽣肄붾뱶',
                alignment: 'center',
            }, {
                //?쇳꽣紐?                dataField: 'centerName',
                caption: '?쇳꽣紐?,
                alignment: 'center',
            }, {
                //?대쫫
                dataField: 'employeeName',
                caption: '寃吏꾩옄紐?,
                alignment: 'center',
            }, {
                //?앸뀈?붿씪
                dataField: 'birth',
                caption: '?앸뀈?붿씪',
                alignment: 'center',
                dataType: 'date',
            }, {
                //?깅퀎
                dataField: 'sex',
                caption: '?깅퀎',
                alignment: 'center',
            }, {
                //ID
                dataField: 'employeeCode',
                caption: 'ID',
                alignment: 'center',
            }, {
                //寃吏꾩씪
                dataField: 'checkupedAt',
                caption: '?섍??꾨즺??,
                alignment: 'center',
                dataType: 'date',
            }, {
                //寃곌낵?깅줉??                dataField: 'employeeRegisteredAt',
                caption: '寃곌낵?깅줉??,
                alignment: 'center',
                dataType: 'date',
            }, {
                //醫낇빀?뚭껄
                dataField: 'review',
                caption: '醫낇빀?뚭껄',
                type: 'buttons',
                buttons: [{
                    text: '蹂닿린',
                    onClick: function (e) {
                        dxInstances.popupReview.show();
                        dxInstances.popupReview.option({
                            title: "醫낇빀?뚭껄",
                            closeOnOutsideClick: true,
                            width: 700,
                            height: 500,
                            contentTemplate: function (contentElement) {
                                contentElement.append('<div style="font-weight: bold; color: #2ea3aa">醫낇빀?뚭껄</div>');
                                if (e.row.data.review === null || e.row.data.review === '') {
                                    contentElement.append($("<div/>").dxTextArea({
                                        height: 500,
                                        value: '醫낇빀?뚭껄???놁뒿?덈떎.',
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
    });
</script>
</html>
