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
@Table(name = "sale_order_line")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SaleOrderLine extends BaseDomain {
    @Id
    public int id;
    public int statusId;
    public String itemCode;
    public String itemName;
    public String ItemName;
    public String itmName;
    public int itemId;
    public String comments;
    public int rModId;
    public String modifierName;
    public boolean isRMod;
    public int sizeId;
    public String size;
    public int dealId;
    public int qty;
    public float price;
    public float lineTotal;
    public int saleOrderId;
    public boolean optionalModifier;
    public boolean isDealItem;
    public int addOnNo;
    public int kdsId;
    public boolean isDeleted;
    @Nullable
    public String KDS;
    public String lineStatus;

    public SaleOrderLine(String itemName, int qty, float price, float lineTotal) {
        itemName = itemName;
        qty = qty;
        price = price;
        lineTotal = lineTotal;
    }

    public SaleOrderLine() {
    }



}
