package org.example.service;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.example.entity.SaleOrderLine;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SaleReport {
    public String generateReport(List<SaleOrderLine> lines) {
        try {
            File file = ResourceUtils.getFile("classpath:SaleReport.jrxml");
            InputStream input = new FileInputStream(file);
            // Compile the Jasper report from .jrxml to .japser
            JasperReport jasperReport = JasperCompileManager.compileReport(input);
            // Get your data source
            JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(lines);
            // Add parameters
            Map<String, Object> parameters = new HashMap<>();
            //parameters.put("createdBy", "JavaHelper.org");
            // Fill the report
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, source);
            // Export the report to a PDF file

            JasperExportManager.exportReportToPdfFile(jasperPrint, "c:\\Users" + "order.pdf");
            System.out.println("PDF File Generated !!");
            JasperExportManager.exportReportToXmlFile(jasperPrint, "order.pdf", true);
            System.out.println("XML File Generated !!");
            JasperExportManager.exportReportToHtmlFile(jasperPrint, "order.pdf");
            System.out.println("HTML Generated");
            return "Report successfully generated @path= ";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    public byte[] generateReport(List<SaleOrderLine> lines, String format) throws FileNotFoundException, JRException {
        File file = ResourceUtils.getFile("classpath:SaleReport.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());

        //Set report data
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lines);
        // Map<String, Object> parameters = new HashMap<>();
        //parameters.put("title", "Order Report");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource);
        byte[] reportContent = JasperExportManager.exportReportToPdf(jasperPrint);
        return reportContent;
        //...
    }

    public ResponseEntity<byte[]> GenerateReport(List<SaleOrderLine> lines, String format) throws FileNotFoundException, JRException {
        File file = ResourceUtils.getFile("classpath:SaleReport.jrxml");
        InputStream input = new FileInputStream(file);
        JasperReport jasperReport = JasperCompileManager.compileReport(input);
        Map<String, Object> parameters = new HashMap<>();
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(lines));

        // Export the report to a ByteArrayOutputStream in PDF format
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint, baos);

        // Set the response headers
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=report.pdf");
        headers.setContentType(MediaType.APPLICATION_PDF);

        // Return the PDF bytes in a ResponseEntity
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(baos.size())
                .body(baos.toByteArray());


    }
}
