package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.annotation.Nullable;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.Id;

@Entity
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CustomerWiseSale {
    public String name;
    public String country;
    public String itemName;
    public String customer;
    public int saleOrderId;
    public String date;
    public int qty;
    public float discount;
    public float amount;
    public float gst;

}
