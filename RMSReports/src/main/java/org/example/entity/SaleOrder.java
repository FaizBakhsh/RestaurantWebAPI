package org.example.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import jakarta.annotation.Nullable;
import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.example.configuration.CustomLocalDateTimeDeserializer;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "sale_order")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SaleOrder extends BaseDomain {
    @Id
    public int Id;
    public List<SaleOrderLine> SaleOrderLines;
    public List<SaleOrderLine> SaleLines;
    public boolean DisplayCash;
    public String Waiter;
    public float CashReceived;
    public float RemainingCash;
    public float Service;
    public float GST;
    public float Total;
    public float GSTValue;
    public float DiscountValue;
    public float PPOFee;
    public float DeliveryCharges;
    public float Discount;
    public float NetTotal;
    public int PaymentMethodId;
    public String PaymentMethod;
    public int ShiftId;
    public int RiderId;
    public String Rider;
    public String BillTitle;
    public int DiscountTypeId;
    public int BillStatusId;
    public int StatusId;
    public int OrderTypeId;
    public String CustomerId;
    public String TableNo;
    public int RestaurantId;
    public String WaiterId;
    public String Guest;
    @Nullable
    public String PhoneNo;
    public String Name;
    public String Address;
    public int SourceId;
    public String Source;
    public String Note;
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object DispatchedTime;
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object DeliveryTime;
    public String Comments;
    //  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss[.SSS][.SS][.S]")
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object Date;
    public String OrderDate;
    public String Time;
    public int TerminalId;
    public String Terminal;
    public String Shift;
    public String Status;
    public String OrderType;
    public String BillStatus;

    public SaleOrder() {
        SaleOrderLines = new ArrayList<>();
        SaleLines = new ArrayList<>();
    }

}
