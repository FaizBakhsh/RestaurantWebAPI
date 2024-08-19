package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DiscountSale {
    public String narration;
    public String billTitle;
    public String itemName;
    public String discountType;
    public String discountPer;
    public int qty;
    public Float amount;

}
