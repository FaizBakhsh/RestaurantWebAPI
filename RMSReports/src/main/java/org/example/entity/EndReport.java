package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class EndReport {
    public List<Source> Sources;
    public List<Bank> Banks;
    public List<Receivable> Receivables;
    public List<Group> Groups;
    public String PrintingDate;
    public String PrintingTime;
    public String Shift;
    public String Day;
    public String Terminal;
    public String User;
    public String TotalNetSale;
    public String CashNet;
    public String CardNet;
    public String TotalGSTSales;
    public String TotalDiscSales;
    public String CashGST;
    public String CardGST;
    public String CashDiscount;
    public String CardDiscount;
    public String TotalGross;
    public String Comp;
    public String SrvcChrgs;
    public String Void;
    public String Refund;
    public String TotalCashIn;
    public String BankSales;
    public String Receivable;
    public String CalCash;
    public String CashIn;
    public String Float;
    public String DecCash;
    public String Expenses;
    public String OverShort;
    public String DineInOrdersAmount;
    public String DineInOrders;
    public String AvgPerOrder;
    public String Guest;
    public String AvgPerGuest;
    public String TakeAwayOrdersAmount;
    public String DeliveryOrdersAmount;

    public EndReport() {
        Sources = new ArrayList<>();
        Banks = new ArrayList<>();
        Receivables = new ArrayList<>();
        Groups = new ArrayList<>();
    }
}

