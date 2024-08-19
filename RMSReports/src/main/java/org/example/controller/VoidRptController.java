package org.example.controller;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.example.entity.SaleOrder;
import org.example.entity.SaleOrderLine;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/VoidOrder")
public class VoidRptController {
    @PostMapping("/Report")
    public ResponseEntity<byte[]> generateReport(@RequestBody SaleOrder order) {
        try {

            System.out.print(order.SaleOrderLines.get(0).KDS);
            File file = ResourceUtils.getFile("classpath:VoidRpt.jrxml");
            InputStream input = new FileInputStream(file);
            JasperReport jasperReport = JasperCompileManager.compileReport(input);
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("OrderType", order.OrderType);
            parameters.put("BillTitle", order.BillTitle);
            parameters.put("Date", order.OrderDate);
            parameters.put("WaiterName", order.Waiter);
            parameters.put("KDSName", order.SaleOrderLines.get(0).KDS);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(order.SaleLines));
            // Export the report to a ByteArrayOutputStream in PDF format
            ByteArrayOutputStream _stream = new ByteArrayOutputStream();
            JasperExportManager.exportReportToPdfStream(jasperPrint, _stream);

            // Set the response headers
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=report.pdf");
            headers.setContentType(MediaType.APPLICATION_PDF);

            // Return the PDF bytes in a ResponseEntity
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
