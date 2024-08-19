package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class MenuItemWiseSale {
    public String size;
    public String itemName;
    public String price;
    public String qty;
    public String grossSale;
    public String discount;
    public String gst;
    public String netSale;
}

