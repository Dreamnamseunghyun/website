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
                            <h3 class="h3">Í≤∞Í≥ºÏ°∞Ìöå</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box2" style="width:370px;">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>Í∏∞ÏóÖÏ≤?Í≤Ä??/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="lookupCompany"
                                                     data-sitebuilder="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2" style="width:370px; margin-right:0;">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-4 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="selectCompanyYear"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div id="btnExelDownload" class="btnExcelSample" data-sitebuilder="dxButton"
                                                 style="height:34px!important;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12" id="searchGrid" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div id="dataGridResultLookup" class="main_table" data-sitebuilder="dxDataGrid">
                            </div>
                        </div>
                        <%--                    </div>--%>
                    </div>
                </div>
            </div>


        </div>
    </div>
        <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        sitebuilder.openMenu('result-lookup');

        let dxInstances = sitebuilder.createDx(false);

        let dsResultExcelList;

        function exportExcelContractCheckupSample() {
            let workbook = new ExcelJS.Workbook();
            let worksheet = workbook.addWorksheet('Sheet1');

            worksheet.getColumn(5).width = 15;
            worksheet.getColumn(7).width = 15;
            let itemCode = [];
            let cell = [];

            worksheet.getCell('A3').value = 'Í∏∞ÏóÖÏ≤¥ÏΩî??;
            worksheet.getCell('B3').value = 'Î≥ëÏõêÏΩîÎìú';
            worksheet.getCell('C3').value = '?ºÌÑ∞ÏΩîÎìú';
            worksheet.getCell('D3').value = 'Í≤ÄÏßÑÏûêÎ™?;
            worksheet.getCell('E3').value = '?ùÎÖÑ?îÏùº(8?êÎ¶¨)';
            worksheet.getCell('F3').value = '?±Î≥Ñ';
            worksheet.getCell('G3').value = 'ID';
            worksheet.getCell('H3').value = 'Ï¢ÖÌï©?åÍ≤¨';

            worksheet.getCell('I1').value = 'B010011';
            worksheet.getCell('I2').value = '?†Ï≤¥Í≥ÑÏ∏° Î∞??àÏïï';
            worksheet.getCell('I3').value = '?†Ïû•';

            worksheet.getCell('J1').value = 'B010012';
            worksheet.getCell('J2').value = '?†Ï≤¥Í≥ÑÏ∏° Î∞??àÏïï';
            worksheet.getCell('J3').value = 'Ï≤¥Ï§ë';

            worksheet.getCell('K1').value = 'B010013';
            worksheet.getCell('K2').value = '?†Ï≤¥Í≥ÑÏ∏° Î∞??àÏïï';
            worksheet.getCell('K3').value = 'ÎπÑÎßå??BMI)';

            worksheet.getCell('L1').value = 'B010014';
            worksheet.getCell('L2').value = '?†Ï≤¥Í≥ÑÏ∏° Î∞??àÏïï';
            worksheet.getCell('L3').value = '?àÎ¶¨?òÎ†à';

            worksheet.getCell('M1').value = 'B010021';
            worksheet.getCell('M2').value = '?†Ï≤¥Í≥ÑÏ∏° Î∞??àÏïï';
            worksheet.getCell('M3').value = '?òÏ∂ïÍ∏∞Ìòà??;

            worksheet.getCell('N1').value = 'B010022';
            worksheet.getCell('N2').value = '?†Ï≤¥Í≥ÑÏ∏° Î∞??àÏïï';
            worksheet.getCell('N3').value = '?¥ÏôÑÍ∏∞Ìòà??;

            worksheet.getCell('O1').value = 'B030021';
            worksheet.getCell('O2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('O3').value = '500(Ï¢?';

            worksheet.getCell('P1').value = 'B030022';
            worksheet.getCell('P2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('P3').value = '500(??';

            worksheet.getCell('Q1').value = 'B030023';
            worksheet.getCell('Q2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('Q3').value = '1000(Ï¢?';

            worksheet.getCell('R1').value = 'B030024';
            worksheet.getCell('R2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('R3').value = '1000(??';

            worksheet.getCell('S1').value = 'B030025';
            worksheet.getCell('S2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('S3').value = '2000(Ï¢?';

            worksheet.getCell('T1').value = 'B030026';
            worksheet.getCell('T2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('T3').value = '2000(??';

            worksheet.getCell('U1').value = 'B030027';
            worksheet.getCell('U2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('U3').value = '4000(Ï¢?';

            worksheet.getCell('V1').value = 'B030028';
            worksheet.getCell('V2').value = 'Ï≤?†•Í≤Ä??;
            worksheet.getCell('V3').value = '4000(??';

            worksheet.getCell('W1').value = 'B040021';
            worksheet.getCell('W2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('W3').value = '?úÎ†•(Ï¢?';

            worksheet.getCell('X1').value = 'B040022';
            worksheet.getCell('X2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('X3').value = '?úÎ†•(??';

            worksheet.getCell('Y1').value = 'B040023';
            worksheet.getCell('Y2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('Y3').value = 'ÍµêÏ†ï?úÎ†•(Ï¢?';

            worksheet.getCell('Z1').value = 'B040024';
            worksheet.getCell('Z2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('Z3').value = 'ÍµêÏ†ï?úÎ†•(??';

            worksheet.getCell('AA1').value = 'B040031';
            worksheet.getCell('AA2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('AA3').value = '?àÏïï(Ï¢?';

            worksheet.getCell('AB1').value = 'B040032';
            worksheet.getCell('AB2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('AB3').value = '?àÏïï(??';

            worksheet.getCell('AC1').value = 'B040041';
            worksheet.getCell('AC2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('AC3').value = '?àÏ?(Ï¢?';

            worksheet.getCell('AD1').value = 'B040042';
            worksheet.getCell('AD2').value = '?àÍ≥ºÍ≤Ä??;
            worksheet.getCell('AD3').value = '?àÏ?(??';

            worksheet.getCell('AE1').value = 'C01001';
            worksheet.getCell('AE2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AE3').value = 'Ï¥ùÎã®Î∞?Total protein)';

            worksheet.getCell('AF1').value = 'C01002';
            worksheet.getCell('AF2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AF3').value = '?åÎ?ÎØ?Albumin)';

            worksheet.getCell('AG1').value = 'C01003';
            worksheet.getCell('AG2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AG3').value = 'Í∏ÄÎ°úÎ∏îÎ¶?Globulin)';

            worksheet.getCell('AH1').value = 'C01004';
            worksheet.getCell('AH2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AH3').value = 'A/GÎπÑÏú®(albumin:globilin ratio)';

            worksheet.getCell('AI1').value = 'C01005';
            worksheet.getCell('AI2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AI3').value = 'AST(SGOT)';

            worksheet.getCell('AJ1').value = 'C01006';
            worksheet.getCell('AJ2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AJ3').value = 'ALT(SGPT)';

            worksheet.getCell('AK1').value = 'C01007';
            worksheet.getCell('AK2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AK3').value = 'Í∞êÎßàÏßÄ?∞Ìîº(Œ≥-GTP)';

            worksheet.getCell('AL1').value = 'C01008';
            worksheet.getCell('AL2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AL3').value = 'Ï¥ùÎπåÎ¶¨Î£®Îπ?Total bilirubin)';

            worksheet.getCell('AM1').value = 'C01009';
            worksheet.getCell('AM2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AM3').value = 'ÏßÅÏ†ëÎπåÎ¶¨Î£®Îπà(Direct bilirubin)';

            worksheet.getCell('AN1').value = 'C01010';
            worksheet.getCell('AN2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AN3').value = 'Í∞ÑÏ†ëÎπåÎ¶¨Î£®Îπà(Indirect bilirubin)';

            worksheet.getCell('AO1').value = 'C01011';
            worksheet.getCell('AO2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AO3').value = '?åÏπºÎ¶¨Ìè¨?§Ìåå?Ä??ALP)';

            worksheet.getCell('AP1').value = 'C01012';
            worksheet.getCell('AP2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AP3').value = '?†ÏÇ∞?àÏàò?åÌö®??LDH)';

            worksheet.getCell('AQ1').value = 'C02001';
            worksheet.getCell('AQ2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AQ3').value = 'A????≤¥ ?ïÏÑ±?¨Î?(HAV IgG)';

            worksheet.getCell('AR1').value = 'C02002';
            worksheet.getCell('AR2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AR3').value = 'A?ïÍ∞Ñ?ºÌëúÎ©¥Ìï≠Ï≤?HAV IgM)';

            worksheet.getCell('AS1').value = 'C02005';
            worksheet.getCell('AS2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AS3').value = 'B?ïÍ∞Ñ?ºÌï≠??HBsAg)';

            worksheet.getCell('AT1').value = 'C02006';
            worksheet.getCell('AT2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AT3').value = 'B?ïÍ∞Ñ?ºÌï≠Ï≤?HBsAb)';

            worksheet.getCell('AU1').value = 'C02007';
            worksheet.getCell('AU2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AU3').value = 'B?ïÍ∞Ñ?ºÌôú?ôÏÑ±Î∞èÏ†Ñ?ºÏÑ±?¨Î?(HBeAg)';

            worksheet.getCell('AV1').value = 'C02008';
            worksheet.getCell('AV2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AV3').value = 'B?ïÍ∞Ñ?ºÌôú?ôÏÑ±Î∞èÏ†Ñ?ºÏÑ±?¨Î?(HBeAb)';

            worksheet.getCell('AW1').value = 'C02009';
            worksheet.getCell('AW2').value = 'Í∞ÑÍ∏∞??Í≤Ä??;
            worksheet.getCell('AW3').value = 'C?ïÍ∞Ñ?ºÌï≠Ï≤?HCVAb)';

            worksheet.getCell('AX1').value = 'C03001';
            worksheet.getCell('AX2').value = '?†Ïû•Í∏∞Îä•Í≤Ä??;
            worksheet.getCell('AX3').value = '?îÏÜåÏßàÏÜå(BUN)';

            worksheet.getCell('AY1').value = 'C03002';
            worksheet.getCell('AY2').value = '?†Ïû•Í∏∞Îä•Í≤Ä??;
            worksheet.getCell('AY3').value = '?¨Î†à?ÑÌã∞??Creatinin)';

            worksheet.getCell('AZ1').value = 'C03003';
            worksheet.getCell('AZ2').value = '?†Ïû•Í∏∞Îä•Í≤Ä??;
            worksheet.getCell('AZ3').value = 'B/CÎπÑÏú®';

            worksheet.getCell('BA1').value = 'C03004';
            worksheet.getCell('BA2').value = '?†Ïû•Í∏∞Îä•Í≤Ä??;
            worksheet.getCell('BA3').value = '?†ÏÇ¨Íµ¨Ï≤¥?¨Í≥º??GFR)';

            worksheet.getCell('BB1').value = 'C04001';
            worksheet.getCell('BB2').value = '?πÎá®Í≤Ä??;
            worksheet.getCell('BB3').value = 'Í≥µÎ≥µ?úÌòà??FBS=Glucose)';

            worksheet.getCell('BC1').value = 'C04002';
            worksheet.getCell('BC2').value = '?πÎá®Í≤Ä??;
            worksheet.getCell('BC3').value = '?πÌôî?àÏÉâ??HbA1c)';

            worksheet.getCell('BD1').value = 'C04004';
            worksheet.getCell('BD2').value = '?πÎá®Í≤Ä??;
            worksheet.getCell('BD3').value = 'Insulin';

            worksheet.getCell('BE1').value = 'C05001';
            worksheet.getCell('BE2').value = 'Ï∑åÏû•Í∏∞Îä•Í≤Ä??;
            worksheet.getCell('BE3').value = 'Î¶¨Ìåå?ÑÏ†ú(Lipase)';

            worksheet.getCell('BF1').value = 'C05002';
            worksheet.getCell('BF2').value = 'Ï∑åÏû•Í∏∞Îä•Í≤Ä??;
            worksheet.getCell('BF3').value = '?ÑÎ??ºÏ†ú(Amylase)';

            worksheet.getCell('BG1').value = 'C06001';
            worksheet.getCell('BG2').value = 'ÏßÄÏß?Î∞??¨ÌòàÍ¥ÄÍ≥ÑÍ???;
            worksheet.getCell('BG3').value = 'Ï¥ùÏΩú?àÏä§?åÎ°§';

            worksheet.getCell('BH1').value = 'C06002';
            worksheet.getCell('BH2').value = 'ÏßÄÏß?Î∞??¨ÌòàÍ¥ÄÍ≥ÑÍ???;
            worksheet.getCell('BH3').value = 'Í≥†Î???ÏΩúÎ†à?§ÌÖåÎ°?HDL-ÏΩúÎ†à?§ÌÖåÎ°?';

            worksheet.getCell('BI1').value = 'C06003';
            worksheet.getCell('BI2').value = 'ÏßÄÏß?Î∞??¨ÌòàÍ¥ÄÍ≥ÑÍ???;
            worksheet.getCell('BI3').value = '?ÄÎ∞Ä??ÏΩúÎ†à?§ÌÖåÎ°?LDL-ÏΩúÎ†à?§ÌÖåÎ°?';

            worksheet.getCell('BJ1').value = 'C06004';
            worksheet.getCell('BJ2').value = 'ÏßÄÏß?Î∞??¨ÌòàÍ¥ÄÍ≥ÑÍ???;
            worksheet.getCell('BJ3').value = 'Ï§ëÏÑ±ÏßÄÎ∞?Triglyceride)';

            worksheet.getCell('BK1').value = 'C06005';
            worksheet.getCell('BK2').value = 'ÏßÄÏß?Î∞??¨ÌòàÍ¥ÄÍ≥ÑÍ???;
            worksheet.getCell('BK3').value = '?¨Î†à?ÑÌã∞?åÌÇ§?òÏ†ú(CPK)';

            worksheet.getCell('BL1').value = 'C06006';
            worksheet.getCell('BL2').value = 'ÏßÄÏß?Î∞??¨ÌòàÍ¥ÄÍ≥ÑÍ???;
            worksheet.getCell('BL3').value = '?¨Ïû•Î≥ëÏúÑ?òÏù∏??CRF)';

            worksheet.getCell('BM1').value = 'C06008';
            worksheet.getCell('BM2').value = 'ÏßÄÏß?Î∞??¨ÌòàÍ¥ÄÍ≥ÑÍ???;
            worksheet.getCell('BM3').value = '?∏Î™®?úÏä§?åÏù∏(Homocysteine)';

            worksheet.getCell('BN1').value = 'C070011';
            worksheet.getCell('BN2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BN3').value = '?ÅÌòàÍµ?RBC)';

            worksheet.getCell('BO1').value = 'C070012';
            worksheet.getCell('BO2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BO3').value = '?àÏÉâ??Hb)';

            worksheet.getCell('BP1').value = 'C070013';
            worksheet.getCell('BP2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BP3').value = '?ÅÌòàÍµ¨Ïö©??Hct)';

            worksheet.getCell('BQ1').value = 'C070014';
            worksheet.getCell('BQ2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BQ3').value = '?âÍ∑†?ÅÌòàÍµ¨Ïö©??MCV)';

            worksheet.getCell('BR1').value = 'C070015';
            worksheet.getCell('BR2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BR3').value = '?âÍ∑†?ÅÌòàÍµ¨Ìòà?âÏÜå??MCH)';

            worksheet.getCell('BS1').value = 'C070016';
            worksheet.getCell('BS2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BS3').value = '?âÍ∑†?ÅÌòàÍµ¨Ìòà?âÏÜå?çÎèÑ(MCHC)';

            worksheet.getCell('BT1').value = 'C070017';
            worksheet.getCell('BT2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BT3').value = '?ÅÌòàÍµ¨Î∂Ñ?¨Í≥Ñ??RDW)';

            worksheet.getCell('BU1').value = 'C070018';
            worksheet.getCell('BU2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BU3').value = '?àÏÜå?êÏàò(PLT)';

            worksheet.getCell('BV1').value = 'C070019';
            worksheet.getCell('BV2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BV3').value = '?àÏÜå?êÎ∞±Î∂ÑÏú®(PCT)';

            worksheet.getCell('BW1').value = 'C0700110';
            worksheet.getCell('BW2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BW3').value = '?âÍ∑†?àÏÜå?êÏö©??MPV)';

            worksheet.getCell('BX1').value = 'C0700111';
            worksheet.getCell('BX2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BX3').value = '?àÏÜå?êÎ∂Ñ?¨Ìè≠(PDW)';

            worksheet.getCell('BY1').value = 'C0700112';
            worksheet.getCell('BY2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BY3').value = 'Î∞±ÌòàÍµ?WBC)';

            worksheet.getCell('BZ1').value = 'C0700113';
            worksheet.getCell('BZ2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('BZ3').value = 'Î∂ÑÌöç?∏Ï§ëÍµ?Seg.Neutrophil)';

            worksheet.getCell('CA1').value = 'C0700114';
            worksheet.getCell('CA2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CA3').value = 'Î¥âÏÉÅ?∏Ï§ëÍµ?Band neutrophil)';

            worksheet.getCell('CB1').value = 'C0700115';
            worksheet.getCell('CB2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CB3').value = 'Î¶ºÌîÑÍµ?Lymphocyte)';

            worksheet.getCell('CC1').value = 'C0700116';
            worksheet.getCell('CC2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CC3').value = '?®ÌïµÍµ?Monocyte)';

            worksheet.getCell('CD1').value = 'C0700117';
            worksheet.getCell('CD2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CD3').value = '?∏ÏÇ∞Íµ?Eosinophile)';

            worksheet.getCell('CE1').value = 'C0700118';
            worksheet.getCell('CE2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CE3').value = '?ºÍ∏∞Íµ?Basophile)';

            worksheet.getCell('CF1').value = 'C0700119';
            worksheet.getCell('CF2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CF3').value = '?ÑÍ≥®?òÍµ¨(metamyelocyte)';

            worksheet.getCell('CG1').value = 'C0700120';
            worksheet.getCell('CG2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CG3').value = 'Í≥®ÏàòÍµ?myelocyte)';

            worksheet.getCell('CH1').value = 'C0700121';
            worksheet.getCell('CH2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CH3').value = '?ÑÍ≥®?òÏÑ∏??promyeloyte)';

            worksheet.getCell('CI1').value = 'C0700122';
            worksheet.getCell('CI2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CI3').value = 'Í≥®Ïàò?ÑÏÑ∏??myeloblast)';

            worksheet.getCell('CJ1').value = 'C0700123';
            worksheet.getCell('CJ2').value = '?ºÎ∞ò?àÏï°Í≤Ä??CBC)';
            worksheet.getCell('CJ3').value = '?†Ìïµ?ÅÌòàÍµ?nRCBC)';

            worksheet.getCell('CK1').value = 'C11001';
            worksheet.getCell('CK2').value = 'Ï≤?Í≤∞Ìïç??ÎπàÌòà Í¥Ä?®Í???;
            worksheet.getCell('CK3').value = '?ºÎ¶¨??Ferritin)';

            worksheet.getCell('CL1').value = 'C11002';
            worksheet.getCell('CL2').value = 'Ï≤?Í≤∞Ìïç??ÎπàÌòà Í¥Ä?®Í???;
            worksheet.getCell('CL3').value = '?àÏ≤≠Ï≤?Fe)';

            worksheet.getCell('CM1').value = 'C11003';
            worksheet.getCell('CM2').value = 'Ï≤?Í≤∞Ìïç??ÎπàÌòà Í¥Ä?®Í???;
            worksheet.getCell('CM3').value = 'Ï¥ùÏ≤†Í≤∞Ìï©??TIBC)';

            worksheet.getCell('CN1').value = 'C11004';
            worksheet.getCell('CN2').value = 'Ï≤?Í≤∞Ìïç??ÎπàÌòà Í¥Ä?®Í???;
            worksheet.getCell('CN3').value = 'Î∂àÌè¨??Ï≤†Í≤∞?©Îä•(UIBC)';

            worksheet.getCell('CO1').value = 'C12001';
            worksheet.getCell('CO2').value = 'Í∞ëÏÉÅ?†Í∏∞?•Í???;
            worksheet.getCell('CO3').value = 'Í∞ëÏÉÅ?†Ìò∏Î•¥Î™¨(T3)';

            worksheet.getCell('CP1').value = 'C12002';
            worksheet.getCell('CP2').value = 'Í∞ëÏÉÅ?†Í∏∞?•Í???;
            worksheet.getCell('CP3').value = 'Í∞ëÏÉÅ?†Ìò∏Î•¥Î™¨(T4)';

            worksheet.getCell('CQ1').value = 'C12003';
            worksheet.getCell('CQ2').value = 'Í∞ëÏÉÅ?†Í∏∞?•Í???;
            worksheet.getCell('CQ3').value = 'Í∞ëÏÉÅ?†Ìò∏Î•¥Î™¨(Free T3)';

            worksheet.getCell('CR1').value = 'C12004';
            worksheet.getCell('CR2').value = 'Í∞ëÏÉÅ?†Í∏∞?•Í???;
            worksheet.getCell('CR3').value = 'Í∞ëÏÉÅ?†Ìò∏Î•¥Î™¨(Free T4)';

            worksheet.getCell('CS1').value = 'C12005';
            worksheet.getCell('CS2').value = 'Í∞ëÏÉÅ?†Í∏∞?•Í???;
            worksheet.getCell('CS3').value = 'Í∞ëÏÉÅ?†ÏûêÍ∑πÌò∏Î•¥Î™¨(TSH)';

            worksheet.getCell('CT1').value = 'C13001';
            worksheet.getCell('CT2').value = 'Í∞êÏóºÍ≤Ä??;
            worksheet.getCell('CT3').value = '?¨Î¶¨ÏΩîÎ∞ï??: H.pylori';

            worksheet.getCell('CU1').value = 'C13002';
            worksheet.getCell('CU2').value = 'Í∞êÏóºÍ≤Ä??;
            worksheet.getCell('CU3').value = 'Îß§ÎèÖ : RPR(VDRL)';

            worksheet.getCell('CV1').value = 'C13003';
            worksheet.getCell('CV2').value = 'Í∞êÏóºÍ≤Ä??;
            worksheet.getCell('CV3').value = 'Îß§ÎèÖÍ∞êÏûë?àÍµ¨?ëÏßë : TPHA';

            worksheet.getCell('CW1').value = 'C14001';
            worksheet.getCell('CW2').value = '?µÌíç Î∞??ºÏ¶ùÎ∞òÏùë';
            worksheet.getCell('CW3').value = '?îÏÇ∞(uric acid)';

            worksheet.getCell('CX1').value = 'C14002';
            worksheet.getCell('CX2').value = '?µÌíç Î∞??ºÏ¶ùÎ∞òÏùë';
            worksheet.getCell('CX3').value = 'Î•òÎßà?∞Ïä§?∏Ïûê(RA Factor, RF)';

            worksheet.getCell('CY1').value = 'C14003';
            worksheet.getCell('CY2').value = '?µÌíç Î∞??ºÏ¶ùÎ∞òÏùë';
            worksheet.getCell('CY3').value = 'C-Î∞òÏùë ?®Î∞± (CRP)';

            worksheet.getCell('CZ1').value = 'C14004';
            worksheet.getCell('CZ2').value = '?µÌíç Î∞??ºÏ¶ùÎ∞òÏùë';
            worksheet.getCell('CZ3').value = 'Í≥†Í∞ê??C-Î∞òÏùë ?®Î∞± (HS_CRP)';

            worksheet.getCell('DA1').value = 'C15001';
            worksheet.getCell('DA2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DA3').value = '?òÌä∏Î•?Na)';

            worksheet.getCell('DB1').value = 'C15002';
            worksheet.getCell('DB2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DB3').value = 'ÏπºÎ•®(K)';

            worksheet.getCell('DC1').value = 'C15003';
            worksheet.getCell('DC2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DC3').value = '?ºÏÜå(Cl)';

            worksheet.getCell('DD1').value = 'C15004';
            worksheet.getCell('DD2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DD3').value = 'ÏπºÏäò(Ca)';

            worksheet.getCell('DE1').value = 'C15005';
            worksheet.getCell('DE2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DE3').value = '??P)';

            worksheet.getCell('DF1').value = 'C15006';
            worksheet.getCell('DF2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DF3').value = 'ÎßàÍ∑∏?§Ïäò(Mg)';

            worksheet.getCell('DG1').value = 'C15007';
            worksheet.getCell('DG2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DG3').value = '?ÑÏó∞(Zn)';

            worksheet.getCell('DH1').value = 'C15008';
            worksheet.getCell('DH2').value = '?ÑÌï¥ÏßàÍ???;
            worksheet.getCell('DH3').value = '?àÏ§ë ?¥ÏÇ∞?îÌÉÑ??CO2)';

            worksheet.getCell('DI1').value = 'C16001';
            worksheet.getCell('DI2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DI3').value = 'AFP(Í∞ÑÏïî)';

            worksheet.getCell('DJ1').value = 'C16002';
            worksheet.getCell('DJ2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DJ3').value = 'CEA(?Ä?•Ïïî)';

            worksheet.getCell('DK1').value = 'C16003';
            worksheet.getCell('DK2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DK3').value = 'CA19-9 (Ï∑åÏû•??';

            worksheet.getCell('DL1').value = 'C16004';
            worksheet.getCell('DL2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DL3').value = 'PSA(?ÑÎ¶Ω?†Ïïî)_??;

            worksheet.getCell('DM1').value = 'C16005';
            worksheet.getCell('DM2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DM3').value = 'CA125(?úÏÜå/?êÍ∂Å??_??;

            worksheet.getCell('DN1').value = 'C16006';
            worksheet.getCell('DN2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DN3').value = 'CA15-3(?†Î∞©??_??;

            worksheet.getCell('DO1').value = 'C16007';
            worksheet.getCell('DO2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DO3').value = 'Cyfra21-1(?êÏïî)';

            worksheet.getCell('DP1').value = 'C16008';
            worksheet.getCell('DP2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DP3').value = 'NSE(?êÏïî)';

            worksheet.getCell('DQ1').value = 'C16009';
            worksheet.getCell('DQ2').value = 'Ï¢ÖÏñë?úÏ??êÍ???;
            worksheet.getCell('DQ3').value = 'SCC(?êÏïî,?ùÎèÑ???∏Ìèâ?ÅÌîº??';

            worksheet.getCell('DR1').value = 'C18002';
            worksheet.getCell('DR2').value = 'ÎπÑÌ?ÎØºÍ???;
            worksheet.getCell('DR3').value = 'ÎπÑÌ?ÎØºD(Vit.D)';

            worksheet.getCell('DS1').value = 'D010011';
            worksheet.getCell('DS2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DS3').value = '?îÎπÑÏ§?urine S.G)';

            worksheet.getCell('DT1').value = 'D010012';
            worksheet.getCell('DT2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DT3').value = '?îÏÇ∞??urine pH)';

            worksheet.getCell('DU1').value = 'D010013';
            worksheet.getCell('DU2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DU3').value = '?îÎ∞±?àÍµ¨(Urine Leukocytes)';

            worksheet.getCell('DV1').value = 'D010014';
            worksheet.getCell('DV2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DV3').value = '?îÏïÑÏßàÏÇ∞??urine Nitrite)';

            worksheet.getCell('DW1').value = 'D010015';
            worksheet.getCell('DW2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DW3').value = '?îÎã®Î∞?urine protein)';

            worksheet.getCell('DX1').value = 'D010016';
            worksheet.getCell('DX2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DX3').value = '?îÎãπ(urine glucose)';

            worksheet.getCell('DY1').value = 'D010017';
            worksheet.getCell('DY2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DY3').value = 'ÏºÄ??urine ketone body)';

            worksheet.getCell('DZ1').value = 'D010018';
            worksheet.getCell('DZ2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('DZ3').value = '?†Î°úÎπåÎ¶¨?∏Í≤ê(urobilinogen)';

            worksheet.getCell('EA1').value = 'D010019';
            worksheet.getCell('EA2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('EA3').value = 'ÎπåÎ¶¨Î£®Îπà(bilirubin)';

            worksheet.getCell('EB1').value = 'D0100110';
            worksheet.getCell('EB2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('EB3').value = '?îÏû†??urine occult blood)';

            worksheet.getCell('EC1').value = 'D010021';
            worksheet.getCell('EC2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('EC3').value = '?îÏπ®?¨Î∞±?àÍµ¨(urine WBC)';

            worksheet.getCell('ED1').value = 'D010022';
            worksheet.getCell('ED2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('ED3').value = '?îÏπ®?¨Ï†Å?àÍµ¨(urine RBC)';

            worksheet.getCell('EE1').value = 'D010023';
            worksheet.getCell('EE2').value = '?åÎ?Í≤Ä??;
            worksheet.getCell('EE3').value = '?îÏπ®???ÑÎ?Í≤ΩÍ???;

            worksheet.getCell('EF1').value = 'D02001';
            worksheet.getCell('EF2').value = '?ÄÎ≥ÄÍ≤Ä??;
            worksheet.getCell('EF3').value = 'Î∂ÑÎ??†Ìòà';

            worksheet.getCell('EG1').value = 'D02002';
            worksheet.getCell('EG2').value = '?ÄÎ≥ÄÍ≤Ä??;
            worksheet.getCell('EG3').value = 'Î∂ÑÎ?Ï∂©Î?Í≤Ä??Í∏∞ÏÉùÏ∂?';

            worksheet.getCell('EH1').value = 'G02001';
            worksheet.getCell('EH2').value = 'Î∂Ä?∏Í≥ºÍ≤Ä??;
            worksheet.getCell('EH3').value = '?êÍ∂ÅÍ≤ΩÎ??îÍ???Papsmear)';

            worksheet.getCell('EI1').value = 'G02002';
            worksheet.getCell('EI2').value = 'Î∂Ä?∏Í≥ºÍ≤Ä??;
            worksheet.getCell('EI3').value = '?êÍ∂ÅÍ≤ΩÎ????°ÏÉÅ?∏Ìè¨Í≤Ä??Thin prep)';

            worksheet.getCell('EJ1').value = 'G02003';
            worksheet.getCell('EJ2').value = 'Î∂Ä?∏Í≥ºÍ≤Ä??;
            worksheet.getCell('EJ3').value = '?∏Ïú†?êÏ¢ÖÎ∞îÏù¥?¨Ïä§Í≤Ä??HPV)';

            worksheet.getCell('EK1').value = 'E01001';
            worksheet.getCell('EK2').value = '?¨ÌèêÍ∏∞Îä•Í≤Ä??;
            worksheet.getCell('EK3').value = '?¨Ï†Ñ??Í≤Ä??;

            worksheet.getCell('EL1').value = 'E01002';
            worksheet.getCell('EL2').value = '?¨ÌèêÍ∏∞Îä•Í≤Ä??;
            worksheet.getCell('EL3').value = '?êÍ∏∞??Í≤Ä??;

            worksheet.getCell('EM1').value = 'E01003';
            worksheet.getCell('EM2').value = '?¨ÌèêÍ∏∞Îä•Í≤Ä??;
            worksheet.getCell('EM3').value = '?âÎ?X-??Ï¥¨ÏòÅ';

            worksheet.getCell('EN1').value = 'E02001';
            worksheet.getCell('EN2').value = '?†Î∞©Ï¥¨ÏòÅ';
            worksheet.getCell('EN3').value = '?†Î∞©X-??Mammography)';

            worksheet.getCell('EO1').value = 'F02001';
            worksheet.getCell('EO2').value = 'Ï≤ôÏ∂î?ºÎ∞òÏ¥¨ÏòÅ';
            worksheet.getCell('EO3').value = 'Í≤ΩÏ∂îX-?†Ï¥¨??;

            worksheet.getCell('EP1').value = 'F02002';
            worksheet.getCell('EP2').value = 'Ï≤ôÏ∂î?ºÎ∞òÏ¥¨ÏòÅ';
            worksheet.getCell('EP3').value = '?îÏ∂îX-?†Ï¥¨??;

            worksheet.getCell('EQ1').value = 'F03001';
            worksheet.getCell('EQ2').value = '?ôÎß•Í≤ΩÌôîÍ≤Ä??;
            worksheet.getCell('EQ3').value = '?ôÎß•Í≤ΩÌôîÍ≤Ä??;

            worksheet.getCell('ER1').value = 'F05001';
            worksheet.getCell('ER2').value = 'Í≥®Î??ÑÍ???;
            worksheet.getCell('ER3').value = 'Í≥®Î??ÑÍ???(Bone density)';

            worksheet.getCell('ES1').value = 'F06001';
            worksheet.getCell('ES2').value = '?ÑÏû•Í≤Ä??;
            worksheet.getCell('ES3').value = '?ÑÎÇ¥?úÍ≤Ω(ÎπÑÏàòÎ©?';

            worksheet.getCell('ET1').value = 'F06002';
            worksheet.getCell('ET2').value = '?ÑÏû•Í≤Ä??;
            worksheet.getCell('ET3').value = '?ÑÎÇ¥?úÍ≤Ω(?òÎ©¥)';

            worksheet.getCell('EU1').value = 'F06003';
            worksheet.getCell('EU2').value = '?ÑÏû•Í≤Ä??;
            worksheet.getCell('EU3').value = '?ÑÏû•Ï°∞ÏòÅÏ¥¨ÏòÅ';

            worksheet.getCell('EV1').value = 'F07001';
            worksheet.getCell('EV2').value = '?Ä?•Í???;
            worksheet.getCell('EV3').value = '?Ä?•ÎÇ¥?úÍ≤Ω(ÎπÑÏàòÎ©?';

            worksheet.getCell('EW1').value = 'F07002';
            worksheet.getCell('EW2').value = '?Ä?•Í???;
            worksheet.getCell('EW3').value = '?Ä?•ÎÇ¥?úÍ≤Ω(?òÎ©¥)';

            worksheet.getCell('EX1').value = 'F08001';
            worksheet.getCell('EX2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('EX3').value = '?ÅÎ≥µÎ∂ÄÏ¥àÏùå??;

            worksheet.getCell('EY1').value = 'F08004';
            worksheet.getCell('EY2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('EY3').value = '?ÑÎ¶Ω???®ÏÑ±?òÎ≥µÎ∂Ä)Ï¥àÏùå??;

            worksheet.getCell('EZ1').value = 'F08005';
            worksheet.getCell('EZ2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('EZ3').value = 'Í≤ΩÏßÅ???ÑÎ¶Ω??Ï¥àÏùå??;

            worksheet.getCell('FA1').value = 'F08006';
            worksheet.getCell('FA2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('FA3').value = 'Í≥®Î∞ò(?¨ÏÑ±?òÎ≥µÎ∂Ä)Ï¥àÏùå??;

            worksheet.getCell('FB1').value = 'F08007';
            worksheet.getCell('FB2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('FB3').value = 'ÏßàÏ¥à?åÌåå(VaginalSono)';

            worksheet.getCell('FC1').value = 'F08008';
            worksheet.getCell('FC2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('FC3').value = 'Í∞ëÏÉÅ?†Ï¥à?åÌåå';

            worksheet.getCell('FD1').value = 'F08009';
            worksheet.getCell('FD2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('FD3').value = 'Í≤ΩÎèôÎß•Ï¥à?åÌåå';

            worksheet.getCell('FE1').value = 'F08010';
            worksheet.getCell('FE2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('FE3').value = '?†Î∞©Ï¥àÏùå??BreastSono)';

            worksheet.getCell('FF1').value = 'F08012';
            worksheet.getCell('FF2').value = 'Ï¥àÏùå?åÍ???;
            worksheet.getCell('FF3').value = '?¨Ïû•Ï¥àÏùå??;

            worksheet.getCell('FG1').value = 'F09001';
            worksheet.getCell('FG2').value = '?åCTÍ≤Ä??;
            worksheet.getCell('FG3').value = '??Î®∏Î¶¨)CT';

            worksheet.getCell('FH1').value = 'F10001';
            worksheet.getCell('FH2').value = '?êCTÍ≤Ä??;
            worksheet.getCell('FH3').value = '?âÎ?(??CT';

            worksheet.getCell('FI1').value = 'F11001';
            worksheet.getCell('FI2').value = 'Ï≤ôÏ∂îCTÍ≤Ä??;
            worksheet.getCell('FI3').value = 'Í≤ΩÏ∂î(Î™?CT';

            worksheet.getCell('FJ1').value = 'F11002';
            worksheet.getCell('FJ2').value = 'Ï≤ôÏ∂îCTÍ≤Ä??;
            worksheet.getCell('FJ3').value = '?îÏ∂î(?àÎ¶¨)CT';

            worksheet.getCell('FK1').value = 'F12001';
            worksheet.getCell('FK2').value = '?¨Ïû•CTÍ≤Ä??;
            worksheet.getCell('FK3').value = '?¨Ïû•?ùÌöå??ÏπºÏäò?§ÏΩî?¥ÎßÅ)CT';

            worksheet.getCell('FL1').value = 'F13001';
            worksheet.getCell('FL2').value = 'Î≥µÎ?CTÍ≤Ä??;
            worksheet.getCell('FL3').value = 'Î≥µÎ?ÎπÑÎßåCT';

            worksheet.getCell('FM1').value = 'F16001';
            worksheet.getCell('FM2').value = '?åMRÍ≤Ä??;
            worksheet.getCell('FM3').value = '?åMRI';

            worksheet.getCell('FN1').value = 'F16002';
            worksheet.getCell('FN2').value = '?åMRÍ≤Ä??;
            worksheet.getCell('FN3').value = '?åMRI-T2';

            worksheet.getCell('FO1').value = 'F16003';
            worksheet.getCell('FO2').value = '?åMRÍ≤Ä??;
            worksheet.getCell('FO3').value = '?åÌòàÍ¥ÄMRA';

            worksheet.getCell('FP1').value = 'F16004';
            worksheet.getCell('FP2').value = '?åMRÍ≤Ä??;
            worksheet.getCell('FP3').value = '?åMRA-T2';

            worksheet.getCell('FQ1').value = 'F16005';
            worksheet.getCell('FQ2').value = '?åMRÍ≤Ä??;
            worksheet.getCell('FQ3').value = '?åMRI+?åMRA';

            worksheet.getCell('FR1').value = 'F17001';
            worksheet.getCell('FR2').value = 'Ï≤ôÏ∂îMRÍ≤Ä??;
            worksheet.getCell('FR3').value = 'Í≤ΩÏ∂î(Î™?MRI';

            worksheet.getCell('FS1').value = 'F17002';
            worksheet.getCell('FS2').value = 'Ï≤ôÏ∂îMRÍ≤Ä??;
            worksheet.getCell('FS3').value = 'Í≤ΩÏ∂îMRI-T2';

            worksheet.getCell('FT1').value = 'F17003';
            worksheet.getCell('FT2').value = 'Ï≤ôÏ∂îMRÍ≤Ä??;
            worksheet.getCell('FT3').value = '?îÏ∂î(?àÎ¶¨)MRI';

            worksheet.getCell('FU1').value = 'F17004';
            worksheet.getCell('FU2').value = 'Ï≤ôÏ∂îMRÍ≤Ä??;
            worksheet.getCell('FU3').value = '?îÏ∂îMRI-T2';

            worksheet.getCell('FV1').value = 'F18001';
            worksheet.getCell('FV2').value = 'Í¥Ä?àMRÍ≤Ä??;
            worksheet.getCell('FV3').value = 'Í≤¨Í????¥Íπ®)MRI (Ï¢? ??Ï§???Î∂Ä??';

            worksheet.getCell('FW1').value = 'F18002';
            worksheet.getCell('FW2').value = 'Í¥Ä?àMRÍ≤Ä??;
            worksheet.getCell('FW3').value = 'Ï°±Í???Î∞úÎ™©)MRI (Ï¢? ??Ï§???Î∂Ä??';

            worksheet.getCell('FX1').value = 'F18003';
            worksheet.getCell('FX2').value = 'Í¥Ä?àMRÍ≤Ä??;
            worksheet.getCell('FX3').value = 'Í≥†Í???Í≥®Î∞ò)MRI';

            worksheet.getCell('FY1').value = 'F18004';
            worksheet.getCell('FY2').value = 'Í¥Ä?àMRÍ≤Ä??;
            worksheet.getCell('FY3').value = '?òÍ∑ºÍ¥Ä???êÎ™©)MRI (Ï¢? ??Ï§???Î∂Ä??';

            worksheet.getCell('FZ1').value = 'F18005';
            worksheet.getCell('FZ2').value = 'Í¥Ä?àMRÍ≤Ä??;
            worksheet.getCell('FZ3').value = '?¨Í???Î¨¥Î¶é)MRI (Ï¢? ??Ï§???Î∂Ä??';

            worksheet.getCell('GA1').value = 'F21001';
            worksheet.getCell('GA2').value = 'PETÍ≤Ä??;
            worksheet.getCell('GA3').value = '???ÑÏã† PET';

            worksheet.getCell('GB1').value = 'F21002';
            worksheet.getCell('GB2').value = 'PETÍ≤Ä??;
            worksheet.getCell('GB3').value = '?ÑÏã† PET(???úÏô∏)';

            if (dsResultExcelList.length < 1) {
                console.log('No Data');
                return;
            }

            let itemData;
            for (let idxItem in dsResultExcelList) {
                itemData = [];
                itemData[1] = dsResultExcelList[idxItem].companyCode;
                itemData[2] = dsResultExcelList[idxItem].hospitalCode;
                itemData[3] = dsResultExcelList[idxItem].centerCode;
                itemData[4] = dsResultExcelList[idxItem].employeeName;
                itemData[5] = DevExpress.localization.formatDate(new Date(dsResultExcelList[idxItem].birth), "yyyy-MM-dd");
                itemData[6] = dsResultExcelList[idxItem].sex;
                itemData[7] = dsResultExcelList[idxItem].employeeCode;
                itemData[8] = dsResultExcelList[idxItem].review;

                let itemCode;
                let resultValue;
                for (let i = 0; i < dsResultExcelList[idxItem].resultEmployees[0].resultItems.length; i++) {
                    itemCode = dsResultExcelList[idxItem].resultEmployees[0].resultItems.map(function (v) {
                        return v.itemCode;
                    });
                    resultValue = dsResultExcelList[idxItem].resultEmployees[0].resultItems.map(function (v) {
                        return v.resultValue;
                    });
                }

                let cell = [];
                for (let i = 73; i < 91; i++) {
                    cell.push(worksheet.getCell(String.fromCharCode(i) + 1).value);
                    if (i === 90) {
                        for (let j = 65; j < 72; j++) {
                            for (let k = 65; k < 91; k++) {
                                if (j === 71 && k === 66) {
                                    cell.push(worksheet.getCell(String.fromCharCode(j) + String.fromCharCode(k) + 1).value);
                                    break;
                                } else {
                                    cell.push(worksheet.getCell(String.fromCharCode(j) + String.fromCharCode(k) + 1).value);
                                }
                            }
                        }
                    }
                }
                for (let i = 0; i < cell.length; i++) {
                    for (let j = 0; j < itemCode.length; j++) {
                        if (cell[i] === itemCode[j]) {
                            itemData[i + 9] = resultValue[j];
                        }
                    }
                }
                worksheet.addRow(itemData);
            }

            workbook.xlsx.writeBuffer().then(function (buffer) {
                saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
            });
        }

        dxInstances.lookupCompany.option({
            displayExpr: 'companyName',
            valueExpr: 'companyId',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'companyName',
            searchMode: 'contains',
            searchTimeout: 100,
            onValueChanged: function (e) {
                LoadSelectResult();
            },
        });

        dxInstances.selectCompanyYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadSelectResult();
            }
        });

        dxInstances.btnExelDownload.option({
            text: 'Í≤∞Í≥º?ÑÌô© ?§Ïö¥Î°úÎìú',
            onClick: function (e) {
                $.ajax({
                    url: '<c:url value="/pm/result-employee"/>',
                    method: 'GET',
                    data: {
                        companyId: dxInstances.lookupCompany.option('value'),
                        checkupYear: dxInstances.selectCompanyYear.option('value')
                    },
                }).then(function (response) {
                    dsResultExcelList = response.data;
                    exportExcelContractCheckupSample();
                });
            },
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
            valueChangeEvent: "keyup",
            mode: 'search',
            onValueChanged: function (e) {
                dxInstances.dataGridResultLookup.searchByText(e.value);
            },
        });

        dxInstances.dataGridResultLookup.option({
            dataSource: [],
            columns: [{
                //Í∏∞ÏóÖÏ≤¥ÏΩî??                dataField: 'companyCode',
                caption: 'Í∏∞ÏóÖÏ≤¥ÏΩî??,
                alignment: 'center',
            }, {
                //Í∏∞ÏóÖÏ≤¥Î™Ö
                dataField: 'companyName',
                caption: 'Í∏∞ÏóÖÏ≤¥Î™Ö',
                alignment: 'center',
            }, {
                //Î≥ëÏõêÏΩîÎìú
                dataField: 'hospitalCode',
                caption: 'Î≥ëÏõêÏΩîÎìú',
                alignment: 'center',
            }, {
                //Î≥ëÏõêÎ™?                dataField: 'hospitalName',
                caption: 'Î≥ëÏõêÎ™?,
                alignment: 'center',
            }, {
                //?ºÌÑ∞ÏΩîÎìú
                dataField: 'centerCode',
                caption: '?ºÌÑ∞ÏΩîÎìú',
                alignment: 'center',
            }, {
                //?ºÌÑ∞Î™?                dataField: 'centerName',
                caption: '?ºÌÑ∞Î™?,
                alignment: 'center',
            }, {
                //?¥Î¶Ñ
                dataField: 'employeeName',
                caption: 'Í≤ÄÏßÑÏûêÎ™?,
                alignment: 'center',
            }, {
                //?ùÎÖÑ?îÏùº
                dataField: 'birth',
                caption: '?ùÎÖÑ?îÏùº',
                alignment: 'center',
                dataType: 'date',
            }, {
                //?±Î≥Ñ
                dataField: 'sex',
                caption: '?±Î≥Ñ',
                alignment: 'center',
            }, {
                //ID
                dataField: 'employeeCode',
                caption: 'ID',
                alignment: 'center',
            }, {
                //Í≤ÄÏßÑÏùº
                dataField: 'checkupedAt',
                caption: '?òÍ??ÑÎ£å??,
                alignment: 'center',
                dataType: 'date',
            }, {
                //Í≤∞Í≥º?±Î°ù??                dataField: 'employeeRegisteredAt',
                caption: 'Í≤∞Í≥º?±Î°ù??,
                alignment: 'center',
                dataType: 'date',
            }, {
                type: 'buttons',
                caption: 'Í≤∞Í≥ºÎ≥¥Í∏∞',
                buttons: [{
                    text: 'Î≥¥Í∏∞',
                    onClick: function (e) {
                        $.ajax({
                            url: '<c:url value="/pm/result-employee"/>',
                            method: 'GET',
                            data: {
                                checkupResultEmployeeId: e.row.data.checkupResultEmployeeId,
                            },
                        }).then(function (response) {
                            dsResultExcelList = response.data;
                            console.log(dsResultExcelList)
                            exportExcelContractCheckupSample();
                        });
                    },
                }]
            }, {
                type: 'buttons',
                caption: '??†ú',
                buttons: [{
                    text: '??†ú',
                    dataField: '',
                    onClick: function (e) {
                        if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                            $.ajax({
                                url: '<c:url value="/pm/result"/>/' + e.row.data.checkupResultEmployeeId + '/employee',
                                method: 'DELETE',
                            }).then(function () {
                                LoadSelectResult();
                            });
                        }
                    },
                }]
            }],
        });
        // Load
        let ajaxCompanyList = {
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        }

        $.when($.ajax(ajaxCompanyList)).then(function (responseCompanyList) {
            // Company List
            dxInstances.lookupCompany.option({
                dataSource: responseCompanyList.data,
            });
        });

        let dsResultList;

        function LoadSelectResult() {
            $.ajax({
                url: '<c:url value="/pm/select-result"/>',
                method: 'GET',
                data: {
                    companyId: dxInstances.lookupCompany.option('value'),
                    checkupYear: dxInstances.selectCompanyYear.option('value')
                },
            }).then(function (response) {
                dsResultList = response.data;
                console.log(dsResultList)
                dxInstances.dataGridResultLookup.option({
                    dataSource: dsResultList
                });
            });
        }
    });
</script>
</html>
