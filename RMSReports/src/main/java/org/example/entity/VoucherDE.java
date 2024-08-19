package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.configuration.CustomLocalDateTimeDeserializer;

import java.util.List;

@Entity
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class VoucherDE {
    public List<VoucherDetailDE> VoucherDetails;
    public int VchTypeId;
    public int VendorId;
    public String SalesmanId;
    public int GodownId;
    public int ApprovedById;
    public String VchNo;
    public String InvNo;
    public String DocNo;
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object DocDate;
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object VchDate;
    public String Description;
    public boolean IsPosted;
    public int StatusId;
    public String VchTypeKeyCode;
    public String Vendor;
    public String Godown;
    public String Salesman;
    public String ApprovedBy;
    public String Status;
    public String VchType;
}
