package org.example.controller;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
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
@RequestMapping("/api/EndReport")
public class EndRptController {
    @PostMapping("/ShiftReport")
    public ResponseEntity<byte[]> generateReport(@RequestBody EndReport order) {
        try {
            File file;
            file = ResourceUtils.getFile("classpath:ShiftEndRpt.jrxml");
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

            File file3;
            file3 = ResourceUtils.getFile("classpath:Groups.jrxml");
            InputStream input3 = new FileInputStream(file3);
            JasperReport groupReport = JasperCompileManager.compileReport(input3);

            File file4;
            file4 = ResourceUtils.getFile("classpath:Receivables.jrxml");
            InputStream input4 = new FileInputStream(file4);
            JasperReport receivableReport = JasperCompileManager.compileReport(input4);

            Map<String, Object> parameters = new HashMap<>();
            parameters.put("UserName", order.User);
            parameters.put("User", order.User);
            parameters.put("PrintingDate", order.PrintingDate);
            parameters.put("Time", order.PrintingTime);
            parameters.put("Shift", order.Shift);
            parameters.put("Day", order.Day);
            parameters.put("Terminal", order.Terminal);
            parameters.put("TotalNetSales", order.TotalNetSale);
            parameters.put("CashNet", order.CashNet);
            parameters.put("CardNet", order.CardNet);
            parameters.put("TotalGSTSales", order.TotalGSTSales);
            parameters.put("CashGST", order.CashGST);
            parameters.put("CardGST", order.CardGST);
            parameters.put("TotalDiscSales", order.TotalDiscSales);
            parameters.put("CashDiscount", order.CashDiscount);
            parameters.put("CardDiscount", order.CardDiscount);
            parameters.put("TotalGross", order.TotalGross);
            parameters.put("Comp", order.Comp);
            parameters.put("SvcChrgs", order.SrvcChrgs);
            parameters.put("Void", order.Void);
            parameters.put("Refund", order.Refund);
            parameters.put("TotalCashIn", order.TotalCashIn);
            parameters.put("Banks", order.BankSales);
            parameters.put("Receivables", order.Receivable);
            parameters.put("CalCash", order.CalCash);
            parameters.put("CashIn", order.CashIn);
            parameters.put("Float", order.Float);
            parameters.put("DeclCash", order.DecCash);
            parameters.put("Expenses", order.Expenses);
            parameters.put("Over/Short", order.OverShort);
            parameters.put("DIO", order.DineInOrdersAmount);
            parameters.put("DOrders", order.DineInOrders);
            parameters.put("DAPO", order.AvgPerOrder);
            parameters.put("DGuests", order.Guest);
            parameters.put("DAPG", order.AvgPerGuest);
            parameters.put("TAO", order.TakeAwayOrdersAmount);
            parameters.put("DeliveryO", order.DeliveryOrdersAmount);

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

            //GroupReport Data
            Map<String, Object> groupParams = new HashMap<>();
            groupParams.put("groupDataSet", new JRBeanCollectionDataSource(order.Groups));
            parameters.put("groupReport", groupReport);
            parameters.put("groupRptParams", groupParams);

            //ReceivableReport Data
            Map<String, Object> receivableParams = new HashMap<>();
            receivableParams.put("receivableDataSet", new JRBeanCollectionDataSource(order.Receivables));
            parameters.put("receivableReport", receivableReport);
            parameters.put("receivableRptParams", receivableParams);

            JasperPrint mainJasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());
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

    @PostMapping("/DayReport")
    public ResponseEntity<byte[]> generateDayReport(@RequestBody EndReport order) {
        try {
            File file;
            file = ResourceUtils.getFile("classpath:DayEndReport.jrxml");
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

            File file3;
            file3 = ResourceUtils.getFile("classpath:Receivables.jrxml");
            InputStream input3 = new FileInputStream(file3);
            JasperReport receivableReport = JasperCompileManager.compileReport(input3);

            Map<String, Object> parameters = new HashMap<>();
            parameters.put("UserName", order.User);
            parameters.put("User", order.User);
            parameters.put("PrintingDate", order.PrintingDate);
            parameters.put("Time", order.PrintingTime);
            parameters.put("Shift", order.Shift);
            parameters.put("Day", order.Day);
            parameters.put("Terminal", order.Terminal);
            parameters.put("TotalNetSales", order.TotalNetSale);
            parameters.put("CashNet", order.CashNet);
            parameters.put("CardNet", order.CardNet);
            parameters.put("TotalGSTSales", order.TotalGSTSales);
            parameters.put("CashGST", order.CashGST);
            parameters.put("CardGST", order.CardGST);
            parameters.put("TotalDiscSales", order.TotalDiscSales);
            parameters.put("CashDiscount", order.CashDiscount);
            parameters.put("CardDiscount", order.CardDiscount);
            parameters.put("TotalGross", order.TotalGross);
            parameters.put("Comp", order.Comp);
            parameters.put("SvcChrgs", order.SrvcChrgs);
            parameters.put("Void", order.Void);
            parameters.put("Refund", order.Refund);
            parameters.put("TotalCashIn", order.TotalCashIn);
            parameters.put("Banks", order.BankSales);
            parameters.put("Receivables", order.Receivable);
            parameters.put("CalCash", order.CalCash);
            parameters.put("CashIn", order.CashIn);
            parameters.put("Float", order.Float);
            parameters.put("DeclCash", order.DecCash);
            parameters.put("Expenses", order.Expenses);
            parameters.put("Over/Short", order.OverShort);
            parameters.put("DIO", order.DineInOrdersAmount);
            parameters.put("DOrders", order.DineInOrders);
            parameters.put("DAPO", order.AvgPerOrder);
            parameters.put("DGuests", order.Guest);
            parameters.put("DAPG", order.AvgPerGuest);
            parameters.put("TAO", order.TakeAwayOrdersAmount);
            parameters.put("DeliveryO", order.DeliveryOrdersAmount);

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

            //ReceivableReport Data
            Map<String, Object> receivableParams = new HashMap<>();
            receivableParams.put("receivableDataSet", new JRBeanCollectionDataSource(order.Receivables));
            parameters.put("receivableReport", receivableReport);
            parameters.put("receivableRptParams", receivableParams);

            JasperPrint mainJasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());
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
