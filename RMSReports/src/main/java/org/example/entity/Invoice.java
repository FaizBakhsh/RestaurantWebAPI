package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class Invoice {
    public String date;
    public String billType;
    public String billNo;
    public String cashOutTime;
    public String terminal;
    public String shift;
    public String gst;
    public String discount;
    public String netAmount;
    public String taxCode;
    public String customer;
}
