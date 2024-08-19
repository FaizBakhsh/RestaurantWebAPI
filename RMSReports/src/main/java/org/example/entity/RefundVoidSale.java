package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class RefundVoidSale {

    public String date;
    public String invNo;
    public String billTime;
    public String itemName;
    public String type;
    public String time;
    public String reason;
    public int qty;
    public Float amount;
    public Float gst;

}
