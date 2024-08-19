package org.example.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.example.entity.CompanyInfo;
import org.example.entity.DailySale;
import org.example.entity.EndReport;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/DailySale")
public class DailySaleRptController {
    @PostMapping("/Report/{period}")
    public ResponseEntity<byte[]> generateReport(@RequestBody Map<String, Object> request, @PathVariable("period") String period) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            DailySale order = mapper.convertValue(request.get("ReportData"), DailySale.class);
            CompanyInfo companyProfile = request.containsKey("CompanyProfile")
                    ? mapper.convertValue(request.get("CompanyProfile"), CompanyInfo.class)
                    : null;
            File file;
            file = ResourceUtils.getFile("classpath:DailySaleRpt.jrxml");
            InputStream input = new FileInputStream(file);
            JasperReport jasperReport = JasperCompileManager.compileReport(input);

            File file1;
            file1 = ResourceUtils.getFile("classpath:Banks.jrxml");
            InputStream input1 = new FileInputStream(file1);
            JasperReport bankReport = JasperCompileManager.compileReport(input1);

            File file2;
            file2 = ResourceUtils.getFile("classpath:Sources.jrxml");
            InputStream input2 = new FileInputStream(file2);
            JasperReport sourceReport = JasperCompileManager.compileReport(input2);


            Map<String, Object> parameters = new HashMap<>();
            if (companyProfile != null) {
                parameters.put("Image", companyProfile.Logo);
                parameters.put("cltAddress", companyProfile.Address);
                parameters.put("cltPhoneNo", companyProfile.PhoneNo);
                parameters.put("cltName", companyProfile.Name);
            }
            parameters.put("ReportTitle", order.ReportTitle);
            parameters.put("Period", period);
            parameters.put("NetSale", order.NetSale);
            parameters.put("GST", order.GST);
            parameters.put("CardGST", order.CardGST);
            parameters.put("CashGST", order.CashGST);
            parameters.put("POSFee", order.POSFee);
            parameters.put("TotalSale", order.TotalSale);
            parameters.put("Discount", order.Discount);
            parameters.put("CardDiscount", order.CardDiscount);
            parameters.put("CashDiscount", order.CashDiscount);
            parameters.put("SvcCharges", order.SvcCharges);
            parameters.put("Refund", order.Refund);
            parameters.put("GrossSale", order.GrossSale);
            parameters.put("CashSale", order.CashSale);
            parameters.put("VisaSale", order.VisaSale);
            parameters.put("Receivables", order.Receivables);
            parameters.put("CardReceivable", order.CardReceivable);
            parameters.put("CashReceivable", order.CashReceivable);
            parameters.put("TotalPayments", order.TotalPayments);
            parameters.put("CalculatedCash", order.CalculatedCash);
            parameters.put("FloatCash", order.FloatCash);
            parameters.put("Refund", order.Refund);
            parameters.put("TotalCheckOut", order.TotalCheckOut);
            parameters.put("OverandShort", order.OverandShort);
            parameters.put("BankingTotal", order.BankingTotal);
            parameters.put("DeclaredCash", order.DeclaredCash);
            parameters.put("TakeAway", order.TakeAway);
            parameters.put("TotalTakeAwayOrders", order.TotalTakeAwayOrders);
            parameters.put("DineIn", order.DineIn);
            parameters.put("TotalDineInOrders", order.TotalDineInOrders);
            parameters.put("Delivery", order.Delivery);
            parameters.put("TotalDeliveryOrders", order.TotalDeliveryOrders);
            parameters.put("AvgPerGuest", order.AvgPerGuest);
            parameters.put("AvgPerTable", order.AvgPerTable);
            parameters.put("TotalOrders", order.TotalOrders);
            parameters.put("AvgOrders", order.AvgOrders);


            //BankReport Data
            Map<String, Object> bankParams = new HashMap<>();
            bankParams.put("bankDataSet", new JRBeanCollectionDataSource(order.Banks));
            parameters.put("bankReport", bankReport);
            parameters.put("bankRptParams", bankParams);

            //SourceReport Data
            Map<String, Object> sourceParams = new HashMap<>();
            sourceParams.put("sourceDataSet", new JRBeanCollectionDataSource(order.Sources));
            parameters.put("sourceReport", sourceReport);
            parameters.put("sourceRptParams", sourceParams);


            JasperPrint mainJasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(order.Sales));
            ByteArrayOutputStream _stream = new ByteArrayOutputStream();
            JasperExportManager.exportReportToPdfStream(mainJasperPrint, _stream);
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=report.pdf");
            headers.setContentType(MediaType.APPLICATION_PDF);
            return ResponseEntity
                    .ok()
                    .headers(headers)
                    .contentLength(_stream.size())
                    .body(_stream.toByteArray());
        } catch (FileNotFoundException | JRException e) {
            throw new RuntimeException(e);
        }
    }

}
