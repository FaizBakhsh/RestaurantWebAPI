package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class VoucherDetailDE {
    public int vchId;
    public int acId;
    public int billId;
    public String vchNarration;
    public double vchDebitAmt;
    public double vchCreditAmt;
    public int productId;
    public int qty;
    public int Rate;
    public String coaDesc;
    public String product;
    public Boolean isDefaultDrCr;
}
