package org.example.controller;

import com.lowagie.text.Document;
import com.lowagie.text.pdf.*;
import org.example.entity.SaleOrderLine;
import org.example.entity.VoucherDE;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.example.entity.VoucherDetailDE;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/Voucher")
public class VoucherRptController {

    public VoucherRptController() {
    }

    @PostMapping("/Report")
    public ResponseEntity<byte[]> generateReport(@RequestBody VoucherDE _vch) {
        try {
            System.out.print(_vch.VoucherDetails.get(0).coaDesc);
            File file;
            file = ResourceUtils.getFile("classpath:VoucherRpt.jrxml");
            InputStream input = new FileInputStream(file);
            JasperReport jasperReport = JasperCompileManager.compileReport(input);
            Map<String, Object> parameters = new HashMap<>();

            // String inputDate = _vch.VchDate.toString();
            //DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'");
            //DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            // Instant instant = Instant.parse(inputDate);
            //String formattedDate = instant.atZone(ZoneId.systemDefault()).format(outputFormat);

            parameters.put("VchDate", _vch.getVchDate().toString());
            parameters.put("VchType", _vch.VchType);
            parameters.put("VchNo", _vch.VchNo);
            parameters.put("ApprovedBy", _vch.ApprovedBy);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(_vch.VoucherDetails));
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

    @PostMapping("/VchReport")
    public ResponseEntity<byte[]> vchListRpt(@RequestBody List<VoucherDE> vouchers) {
        try {
            File file;
            file = ResourceUtils.getFile("classpath:VoucherListRpt.jrxml");
            InputStream input = new FileInputStream(file);
            JasperReport jasperReport = JasperCompileManager.compileReport(input);

            File file1;
            file1 = ResourceUtils.getFile("classpath:vchSubReport.jrxml");
            InputStream input1 = new FileInputStream(file1);
            JasperReport vchRpt = JasperCompileManager.compileReport(input1);


            Map<String, Object> parameters = new HashMap<>();
            parameters.put("FromDate", "");
            parameters.put("ToDate", "");

            List<Map<String, Object>> subreportParametersList = new ArrayList<>();
            for (VoucherDE _vch : vouchers) {
                Map<String, Object> subRprParams = new HashMap<>();
                //String inputDate = _vch.VchDate.toString();
                //DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'");
                // DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

                //Instant instant = Instant.parse(inputDate);
                //String formattedDate = instant.atZone(ZoneId.systemDefault()).format(outputFormat);

                subRprParams.put("VchDate", _vch.getVchDate().toString());
                subRprParams.put("VchType", _vch.VchType);
                subRprParams.put("VchNo", _vch.VchNo);
                subRprParams.put("ApprovedBy", _vch.ApprovedBy);
                // subRprParams.put("detailData", _vch.VoucherDetails);
                subRprParams.put("vchDetailDataSet", new JRBeanCollectionDataSource(_vch.VoucherDetails)
                );
                subreportParametersList.add(subRprParams);
            }

            parameters.put("VoucherRpt", vchRpt);
            parameters.put("vchRptParams", subreportParametersList.get(0));
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(vouchers));
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

    @PostMapping("/vchReport")
    public ResponseEntity<byte[]> generateMain(@RequestBody List<VoucherDE> vouchers) {
        try {

            // Load the main Jasper Report template
            InputStream mainReportTemplate = getClass().getResourceAsStream("/path_to_main_report.jrxml");

            // Create a list to store subreport bytes for each voucher
            List<byte[]> subreportBytesList = new ArrayList<>();

            for (VoucherDE voucher : vouchers) {
                // Load and compile the subreport template
                InputStream subReportTemplate = getClass().getResourceAsStream("/path_to_sub_report.jrxml");
                JasperReport subreport = JasperCompileManager.compileReport(subReportTemplate);

                // Set parameters for the subreport for each voucher
                Map<String, Object> subreportParameters = new HashMap<>();
                subreportParameters.put("dateParam", voucher.getVchDate());
                subreportParameters.put("vchNoParam", voucher.getVchNo());
                subreportParameters.put("vchTypeParam", voucher.getVchType());

                // Generate the subreport
                JasperPrint subreportJasperPrint = JasperFillManager.fillReport(subreport, subreportParameters, new JRBeanCollectionDataSource(vouchers));

                // Export the subreport to a byte array (PDF, for example)
                ByteArrayOutputStream subreportByteArrayOutputStream = new ByteArrayOutputStream();
                JasperExportManager.exportReportToPdfStream(subreportJasperPrint, subreportByteArrayOutputStream);
                subreportBytesList.add(subreportByteArrayOutputStream.toByteArray());

                subReportTemplate.close();
            }

            // Compile the main Jasper Report
            JasperReport mainReport = JasperCompileManager.compileReport(mainReportTemplate);

            // Set parameters for the main report
            Map<String, Object> mainReportParameters = new HashMap<>();
            mainReportParameters.put("subreportBytesList", subreportBytesList);

            // Generate the main report
            JasperPrint mainJasperPrint = JasperFillManager.fillReport(mainReport, mainReportParameters, new JRBeanCollectionDataSource(vouchers));

            // Export the main report to a byte array (PDF, for example)
            ByteArrayOutputStream mainReportByteArrayOutputStream = new ByteArrayOutputStream();
            JasperExportManager.exportReportToPdfStream(mainJasperPrint, mainReportByteArrayOutputStream);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.add("Content-Disposition", "inline; filename=main_report.pdf");

            mainReportTemplate.close();

            return new ResponseEntity<>(mainReportByteArrayOutputStream.toByteArray(), headers, HttpStatus.OK);
        } catch (JRException | IOException e) {
            // Handle exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @PostMapping("/ListReport")
    public ResponseEntity<byte[]> VchListReport(@RequestBody List<VoucherDE> vouchers) {
        try {
            File mainFile;
            mainFile = ResourceUtils.getFile("classpath:VoucherListRpt.jrxml");
            InputStream mainInput = new FileInputStream(mainFile);
            JasperReport mainReport = JasperCompileManager.compileReport(mainInput);
            JasperPrint mainPrint = JasperFillManager.fillReport(mainReport, null, new JREmptyDataSource());
            //jasperPrints.add(jasperPrint);
            ByteArrayOutputStream mainPdfOutputStream = new ByteArrayOutputStream();
            JasperExportManager.exportReportToPdfStream(mainPrint, mainPdfOutputStream);

            File file;
            file = ResourceUtils.getFile("classpath:VoucherRpt.jrxml");
            InputStream input = new FileInputStream(file);
            JasperReport jasperReport = JasperCompileManager.compileReport(input);
            Map<String, Object> parameters = new HashMap<>();
            List<JasperPrint> jasperPrints = new ArrayList<>();
            List<ByteArrayOutputStream> pdfOutputStreams = new ArrayList<>();
            pdfOutputStreams.add(mainPdfOutputStream);
            for (VoucherDE _vch : vouchers) {
                System.out.print(_vch.VchType);

                parameters.put("VchDate", _vch.getVchDate().toString());
                parameters.put("VchType", _vch.VchType);
                parameters.put("VchNo", _vch.VchNo);
                parameters.put("ApprovedBy", _vch.ApprovedBy);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(_vch.VoucherDetails));
                //jasperPrints.add(jasperPrint);
                ByteArrayOutputStream pdfOutputStream = new ByteArrayOutputStream();
                JasperExportManager.exportReportToPdfStream(jasperPrint, pdfOutputStream);
                pdfOutputStreams.add(pdfOutputStream);
            }
            ByteArrayOutputStream mergedPdfOutputStream = new ByteArrayOutputStream();
            Document document = new Document();
            PdfCopy copy = new PdfCopy(document, mergedPdfOutputStream);
            document.open();
            int remainingSpace = 0; // Initialize the remaining space to 0.

            for (ByteArrayOutputStream pdfOutputStream : pdfOutputStreams) {
                PdfReader reader = new PdfReader(pdfOutputStream.toByteArray());
                int numPages = reader.getNumberOfPages();
                for (int pageNum = 1; pageNum <= numPages; pageNum++) {
                    PdfImportedPage page = copy.getImportedPage(reader, pageNum);

                    // Check if there's enough space for the page content, or if it's a new page.
                    if (remainingSpace == 0 || remainingSpace < page.getHeight()) {
                        document.newPage(); // Start a new page.
                        remainingSpace = (int) document.getPageSize().getHeight(); // Reset remaining space.
                    }

                    // Calculate the available space on the current page.
                    float availableSpace = remainingSpace;

                    if (availableSpace < page.getHeight()) {
                        // Create a PdfStamper to manipulate the content on the current page.
                        PdfStamper stamper = new PdfStamper(reader, mergedPdfOutputStream);
                        PdfContentByte content = stamper.getOverContent(pageNum);

                        // Calculate the scale factor to fit the page content within the available space.
                        float scale = availableSpace / page.getHeight();

                        // Adjust the content on the current page using the scale factor.
                        content.addTemplate(page, scale, 0, 0, scale, 0, 0);

                        stamper.close();
                        remainingSpace = 0; // No remaining space left on this page.
                    } else {
                        // Add the page content as is to the current page.
                        copy.addPage(page);
                        remainingSpace -= page.getHeight(); // Update remaining space.
                    }
                }
            }

            document.close();
            // Set the response headers
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.add("Content-Disposition", "inline; filename=vouchers-report.pdf");

            return ResponseEntity
                    .ok()
                    .headers(headers)
                    .body(mergedPdfOutputStream.toByteArray());
        } catch (JRException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
