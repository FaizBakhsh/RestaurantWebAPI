package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DailySale extends BaseDomain {
    public List<Source> Sources;
    public List<Bank> Banks;
    public List<Sales> Sales;

    public String logo;
    public String cltName;
    public String cltPhoneNo;
    public String cltAddress;
    public String ReportTitle;
    public String Period;
    public String NetSale;
    public String GST;
    public String CashGST;
    public String CardGST;
    public String Discount;
    public String CardDiscount;
    public String CashDiscount;
    public String POSFee;
    public String TotalSale;
    public String SvcCharges;
    public String Refund;
    public String GrossSale;
    public String CashSale;
    public String VisaSale;
    public String Receivables;
    public String CashReceivable;
    public String CardReceivable;
    public String TotalPayments;
    public String CalculatedCash;
    public String FloatCash;
    public String TotalCheckOut;
    public String DeclaredCash;
    public String OverandShort;
    public String BankingTotal;
    public String TakeAway;
    public String TotalTakeAwayOrders;
    public String DineIn;
    public String TotalDineInOrders;
    public String AvgPerGuest;
    public String AvgPerTable;
    public String Delivery;
    public String TotalDeliveryOrders;
    public String TotalOrders;
    public String AvgOrders;


    public DailySale() {
        Sales = new ArrayList<>();
        Sources = new ArrayList<>();
        Banks = new ArrayList<>();
    }
}

