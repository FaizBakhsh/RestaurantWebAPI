package org.example.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.example.entity.CompanyInfo;
import org.example.entity.SaleOrder;
import org.example.entity.SaleOrderLine;
import org.example.service.SaleReport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.*;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@RestController
@RequestMapping("/api/SaleOrder")
public class SaleRptController {

    List<SaleOrder> orders = new ArrayList<>();
    SaleOrder order = new SaleOrder();
    @Autowired
    private SaleReport saleReport;

    public SaleRptController() {
    }

    @GetMapping
    public List<SaleOrder> getOrders() {
        return orders;
    }

    @PostMapping("/report")
    public ResponseEntity<Resource> getReport(@RequestBody SaleOrder order) {
        try {
            // List<SaleOrderLine> lines = new ArrayList<SaleOrderLine>();
            //SaleOrderLine line = new SaleOrderLine("Burger", 1, 100, 100);
            ///SaleOrderLine line1 = new SaleOrderLine("Pizza", 1, 200, 200);
            //lines.add(line);
            //lines.add(line1);
            byte[] reportContent = saleReport.generateReport(order.SaleOrderLines, "pdf");
            ByteArrayResource resource = new ByteArrayResource(reportContent);

            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .contentLength(resource.contentLength())
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            ContentDisposition.attachment()
                                    .filename("SaleOrderRpt" + ".pdf")
                                    .build().toString())
                    .body(resource);
        } catch (FileNotFoundException | JRException e) {
            throw new RuntimeException(e);
        }
        // return order.SaleOrderLines;
    }

    @PostMapping("/Report/{invType}")
    public ResponseEntity<byte[]> generateReport(@RequestBody Map<String, Object> request, @PathVariable("invType") String invType) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            SaleOrder order = mapper.convertValue(request.get("ReportData"), SaleOrder.class);

            CompanyInfo companyProfile = request.containsKey("CompanyProfile")
                    ? mapper.convertValue(request.get("CompanyProfile"), CompanyInfo.class)
                    : null;
            System.out.print(invType);
            // System.out.print(order.SaleOrderLines.get(0).itemName);
            //System.out.print(order.SaleOrderLines.get(0).ItemName);
            File file;
            if (Objects.equals(order.OrderType, "Delivery")) {
                file = ResourceUtils.getFile("classpath:DeliveryRpt.jrxml");
            } else {
                file = ResourceUtils.getFile("classpath:SaleReport.jrxml");
            }
            InputStream input = new FileInputStream(file);
            JasperReport jasperReport = JasperCompileManager.compileReport(input);
            Map<String, Object> parameters = new HashMap<>();
            if (companyProfile != null) {
                parameters.put("Image", companyProfile.Logo);
                parameters.put("cltAddress", companyProfile.Address);
                parameters.put("cltPhoneNo", companyProfile.PhoneNo);
                parameters.put("cltName", companyProfile.Name);
            }
            parameters.put("ResName", "Restaurant Name");
            parameters.put("ResAddress", "Restaurant Address");
            parameters.put("Rider", order.Source);
            parameters.put("DisplayCash", order.DisplayCash);
            parameters.put("Note", order.Note);
            parameters.put("CashReceived", order.CashReceived);
            parameters.put("RemainingCash", order.RemainingCash);
            parameters.put("Contact", order.Name);
            parameters.put("Address", order.Address);
            parameters.put("OrderType", order.OrderType);
            parameters.put("BillTitle", order.BillTitle);
            parameters.put("InvoiceType", invType);
            parameters.put("Date", order.OrderDate);
            parameters.put("PhoneNo", order.PhoneNo);
            parameters.put("Terminal", order.Terminal);
            parameters.put("MOP", order.PaymentMethod);
            parameters.put("saleNo", String.valueOf(order.Id));
            parameters.put("NetTotal", String.valueOf(order.NetTotal));
            parameters.put("GST", String.valueOf(order.GST));
            parameters.put("GSTValue", String.valueOf(order.GSTValue));
            parameters.put("Discount", String.valueOf(order.DiscountValue));
            parameters.put("ServiceCharges", String.valueOf(order.Service));
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            parameters.put("PrintingDate", dtf.format(now).toString());
            parameters.put("TotalItems", String.valueOf(order.SaleLines.stream()
                    .mapToDouble(SaleOrderLine::getQty)
                    .sum()));
            parameters.put("SubTotal", String.valueOf(order.SaleLines.stream()
                    .mapToDouble(SaleOrderLine::getLineTotal)
                    .sum()));

            //              { "TotalItems",order.SaleOrderLines.Sum(sol => sol.QTY).ToString ()  },
            //              { "SubTotal", order.SaleOrderLines.Sum(sol => sol.LineTotal).ToString ()},
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

    @GetMapping("/saleReport")
    public ResponseEntity<byte[]> report() {
        List<SaleOrderLine> lines = new ArrayList<SaleOrderLine>();
        SaleOrderLine line1 = new SaleOrderLine("Burger", 1, 100, 100);
        SaleOrderLine line2 = new SaleOrderLine("Pizza", 1, 200, 200);
        SaleOrderLine line3 = new SaleOrderLine("Drink", 1, 200, 200);
        lines.add(line2);
        lines.add(line1);
        lines.add(line3);
        try {
            JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lines);
            JasperPrint saleReport =
                    JasperFillManager.fillReport(JasperCompileManager.compileReport(ResourceUtils.getFile("classpath:SaleReport.jrxml").getAbsolutePath()) // path of the jasper report
                            , null // dynamic parameters
                            , dataSource);
            HttpHeaders headers = new HttpHeaders();
            //set the PDF format
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("filename", "order.pdf");
            //create the report in PDF format
            return new ResponseEntity<byte[]>(JasperExportManager.exportReportToPdf(saleReport), headers, HttpStatus.OK);
            // saleReport.generateReport(lines,"pdf");
        } catch (FileNotFoundException | JRException e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("{id}")
    public Optional<SaleOrder> getSaleById(@PathVariable("id") Long id) {
        return orders.stream().filter(x -> x.Id == id).findFirst();
    }

    @PostMapping
    public String createSale(@RequestBody SaleOrder order) {
        this.orders.add(order);
        return " Successfully Added";
    }
}
