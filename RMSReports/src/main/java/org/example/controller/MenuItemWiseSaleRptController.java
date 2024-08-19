package org.example.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.entity.CompanyInfo;
import org.example.entity.DiscountSale;
import org.example.entity.MenuItemWiseSale;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/MenuItemWiseSale")
public class MenuItemWiseSaleRptController {

    public MenuItemWiseSaleRptController() {
    }

    @PostMapping("/Report/{period}")
    public ResponseEntity<byte[]> generateReport(@RequestBody Map<String, Object> request, @PathVariable("period") String period) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            List<MenuItemWiseSale> sales = mapper.convertValue(request.get("ReportData"), new TypeReference<List<MenuItemWiseSale>>() {
            });


            CompanyInfo companyProfile = request.containsKey("CompanyProfile")
                    ? mapper.convertValue(request.get("CompanyProfile"), CompanyInfo.class)
                    : null;
            File file;
            file = ResourceUtils.getFile("classpath:MenuItemWiseSalesRpt.jrxml");
            InputStream input = new FileInputStream(file);
            JasperReport jasperReport = JasperCompileManager.compileReport(input);
            Map<String, Object> parameters = new HashMap<>();
            if (companyProfile != null) {
                parameters.put("Image", companyProfile.Logo);
                parameters.put("cltAddress", companyProfile.Address);
                parameters.put("cltPhoneNo", companyProfile.PhoneNo);
                parameters.put("cltName", companyProfile.Name);
            }
            parameters.put("Period", period);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(sales));
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
